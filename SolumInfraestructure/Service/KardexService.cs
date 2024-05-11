using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Policy;
using System.Text;
using System.Threading;
using System.Xml.Linq;
using SolumInfraestructure.Domain.DBContext;
using SolumInfraestructure.Domain.Entities;
using SolumInfraestructure.Interface;
using Zebra.Sdk.Comm;
using Zebra.Sdk.Printer;
using Zebra.Sdk.Printer.Discovery;
using static System.Net.Mime.MediaTypeNames;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace SolumInfraestructure.Service
{
    public class KardexService : IPrintSpool
    {
        //List<List<long>> KeySolum = new List<List<long>>();
        public void limpiar_variables()
        {
            eRuta model = new eRuta();
            model.Server = null;
            model.Route = null;
            model.Historic = null;
            model.UserSap = null;
            model.Password = null;
            model.Modelo = null;
        }
        public void ejecucion()
        {
            limpiar_variables();
            var listaPlanificados = cargar_parametros();
            if (listaPlanificados.Count > 0)
            {
                foreach (var objParametros in listaPlanificados)
                {
                    if (objParametros.ejecutar == true)
                    {
                        if (cargar_configuracion(objParametros))
                        {
                            Console.WriteLine("Entrando a ruta: " + objParametros.proceso);
                            DataContextDB kardexObjects = new DataContextDB();
                            objParametros.sociedad = kardexObjects.cargar_company(objParametros);
                            cargar_ruta(objParametros);
                        }
                        else
                        {
                            Console.WriteLine("No existe configuración para este proceso");
                        }
                    }
                }
            }
        }
        public List<eParametros> cargar_parametros() {
            DataContextDB kardexObjects = new DataContextDB();
            var resp = new List<eParametros>();
            try
            {
                resp = kardexObjects.cargar_parametros();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return resp;
        }
        public bool cargar_configuracion(eParametros objParametros)
        {
            bool resp = new bool();
            DataContextDB trackingObjects = new DataContextDB();
            try
            {
                resp = trackingObjects.cargar_configuracion(objParametros);
            }
            catch (Exception ex)
            {
                resp = false;
                throw new Exception(ex.Message);
            }
            return resp;
        }
        public List<eRuta> cargar_ruta(eParametros objParametros)
        {
            DataContextDB kardexObjects = new DataContextDB();
            List<eRuta> resp = new List<eRuta>();
            List<eFile> file = new List<eFile>();
            bool Resultado = false;
            try
            {
                resp = kardexObjects.cargar_ruta(objParametros);
                foreach (var ruta in resp)
                {
                    file = cargar_file(objParametros, ruta);
                    foreach (var efile in file) {
                        Resultado = resultado(file, ruta,objParametros);
                    }
                    if (ruta.Email == true) {
                        if (Resultado == true)
                        {
                            kardexObjects.sendemail(objParametros,ruta);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return resp;
        }
        public List<eFile> cargar_file(eParametros objParametros, eRuta objRuta)
        {
            DataContextDB kardexObjects = new DataContextDB();
            List<eFile> file = new List<eFile>();
            List<List<string>> lista = new List<List<string>>();
            try
            {
                file = kardexObjects.cargar_file(objParametros, objRuta);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return file;
        }
        public bool resultado(List<eFile> objFile, eRuta objRuta, eParametros objParametros)
        {
            bool Resultado = false;
            bool Resultado_Final = false;
            List<List<string>> lista = new List<List<string>>();

            foreach (var file in objFile)
            {
                if (String.IsNullOrEmpty(file.Ordenamiento))
                {
                    objParametros.modo = 0;
                    Resultado = obtener_datos(objParametros,file,objRuta);
                    if (Resultado == true)
                    {
                        Resultado_Final = true;
                    }
                }
                else
                {
                    lista.Add(new List<string> { file.Prefix, file.Extent, file.Separator, file.Destino, file.Ordenamiento });
                }
            }
            if (objFile.Count == 1 && !String.IsNullOrEmpty(objFile[0].Ordenamiento))
            {
                eFile objFile_ = new eFile();
                objFile_ = objFile[0];
                objParametros.modo = 0;
                Resultado = obtener_datos(objParametros, objFile_, objRuta);
                if (Resultado == true)
                {
                    Resultado_Final = true;
                }
            }
            else if (objFile.Count > 1 && lista.Count > 0)
            {
                List<string> detalle_lista = new List<string>();
                detalle_lista = lista[0];
                string[] files = Directory.GetFiles(objRuta.Route, detalle_lista[0] + "*." + detalle_lista[1]);
                foreach (string names in files)
                {
                    Resultado = recorrer_grupo_archivo(objParametros, objRuta, lista, Path.GetFileName(names));
                    if (Resultado == true)
                    {
                        Resultado_Final = true;
                    }
                }
            }
            return Resultado_Final;
        }
        private bool recorrer_grupo_archivo(eParametros objParametros, eRuta objRuta, List<List<string>> lista, string nombre)
        {
            List<List<string>> lista_trabajo = new List<List<string>>();
            string name_prefijo = null;
            string nombre_final = null;
            string[] files;
            int i = 0;
            bool estado = true;
            bool Resultado = false;
            bool Resultado_Final = false;
            foreach (List<string> detalle_lista in lista)
            {
                if (i == 0)
                {
                    files = Directory.GetFiles(objRuta.Route, nombre);
                }
                else
                {
                    nombre_final = detalle_lista[0] + name_prefijo;
                    files = Directory.GetFiles(objRuta.Route, nombre_final);
                    if (files.Count() == 0)
                    {
                        estado = false;
                        break;
                    }
                }
                name_prefijo = Path.GetFileName(files[0]).Substring(detalle_lista[0].Length, Path.GetFileName(files[0]).Length - detalle_lista[0].Length);
                lista_trabajo.Add(new List<string> { detalle_lista[0], name_prefijo, detalle_lista[2], detalle_lista[3], detalle_lista[4] });
                i++;
            }
            if (estado == true)
            {
                foreach (List<string> procesar_lista in lista_trabajo)
                {
                    eFile objFile_ =  new eFile();
                    objFile_.Prefix = procesar_lista[0];
                    objFile_.Extent = procesar_lista[1];
                    objFile_.Separator = procesar_lista[2];
                    objFile_.Destino = procesar_lista[3];
                    objFile_.Ordenamiento = procesar_lista[4];
                    objParametros.modo = 1;
                    Resultado = obtener_datos(objParametros, objFile_,objRuta);
                    if (Resultado == true)
                    {
                        Resultado_Final = true;
                    }
                }
                //KeySolum.Clear();
            }
            return Resultado_Final;
        }
        private bool obtener_datos(eParametros objParametros,eFile objFile,eRuta objRuta)
        {
            bool Resultado = false;
            DataContextDB kardexObjects = new DataContextDB();
            string[] files;
            if (objParametros.modo == 0 && objParametros.modalidad == 0)
            {
                files = Directory.GetFiles(objRuta.Route, objFile.Prefix + "*." + objFile.Extent);
            }
            else if (objParametros.modo == 1 && objParametros.modalidad == 0)
            {
                files = Directory.GetFiles(objRuta.Route, objFile.Prefix + objFile.Extent);
            }
            else {
                files = null;
            }
            if (files != null && objParametros.modalidad == 0) //TRABAJAR CON ARCHIVO TXT YA EXISTENTE EN RUTA
            {
                foreach (string names in files)
                {
                    long q = 0;
                    string namefile = Path.GetFileName((names));
                    try
                    {
                        if (!System.IO.File.Exists(objRuta.Historic + namefile))
                        {
                            System.IO.File.Move(objRuta.Route + namefile, objRuta.Historic + namefile);
                            kardexObjects.ultimoproceso(objParametros);
                            Resultado = true;
                            kardexObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                        }
                        else
                        {
                            System.IO.File.Move(objRuta.Route + namefile, objRuta.Historic + namefile + "-" + DateTime.Now.ToString("yyyyMMddHHmmssfff"));
                            Resultado = true;
                            kardexObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de datos - archivo renombrado");
                        }
                    }
                    catch (Exception e)
                    {
                        if (!System.IO.File.Exists(objRuta.LogErr + namefile))
                        {
                            try
                            {
                                System.IO.File.Move(objRuta.Route + namefile, objRuta.LogErr + namefile);
                                kardexObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString(), "Error en envío de datos");
                                objParametros.mensaje = e.Message.ToString();
                                kardexObjects.ultimoproceso(objParametros);
                                Resultado = true;
                            }
                            catch (Exception y)
                            {
                                objParametros.mensaje = e.Message.ToString();
                                kardexObjects.ultimoproceso(objParametros);
                                kardexObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString() + " - " + y.Message.ToString(), "Error al copiar el txt a la ruta LOG");
                                Resultado = false;
                            }
                        }
                        else
                        {
                            try
                            {
                                System.IO.File.Move(objRuta.Route + namefile, objRuta.LogErr + namefile + "-" + DateTime.Now.ToString("yyyyMMddHHmmssfff"));
                                kardexObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString(), "Error en envío de datos - archivo renombrado");
                                objParametros.mensaje = e.Message.ToString();
                                kardexObjects.ultimoproceso(objParametros);
                                Resultado = true;
                            }
                            catch (Exception y)
                            {
                                objParametros.mensaje = e.Message.ToString();
                                kardexObjects.ultimoproceso(objParametros);
                                kardexObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString() + " - " + y.Message.ToString(), "Error al copiar el txt renombrado a la ruta LOG");
                                Resultado = false;
                            }
                        }
                    }
                }
            }
            else if (objParametros.modalidad == 1) { //TRABAJAR CON OBJETO, CREAR EL ARCHIVO TXT O XLSX Y MOVERLO AL HIS
                string name = String.Empty;
                string namefile = String.Empty;
                if (objFile.Extent.ToUpper() == "TXT")
                {
                    var lkardex = kardexObjects.EjecutarKardex(objParametros, kardexObjects.cargar_modelo(objRuta));
                    Encoding encoding = Encoding.UTF8;
                    StringBuilder sb = new StringBuilder();
                    var propiedades = typeof(eKardex).GetProperties();
                    sb.AppendLine(string.Join(objFile.Separator, propiedades.Select(p => p.Name)));
                    foreach (var kardex in lkardex)
                    {
                        sb.AppendLine(string.Join(objFile.Separator, propiedades.Select(p => p.GetValue(kardex))));
                    }
                    if (!string.IsNullOrEmpty(objParametros.fechainicio))
                    {
                        name = objParametros.fechainicio.ToString();
                    }
                    namefile = objFile.Prefix + name + "_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + "." + objFile.Extent;
                    File.WriteAllText(objRuta.Historic + namefile, sb.ToString(), encoding);
                    kardexObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                    kardexObjects.ultimoproceso(objParametros);
                    Resultado = true;
                }
                else if (objFile.Extent.ToUpper() == "XLSX") {
                    try
                    {
                        var lkardex = kardexObjects.EjecutarKardex(objParametros, kardexObjects.cargar_modelo(objRuta));
                        if (!string.IsNullOrEmpty(objParametros.fechainicio))
                        {
                            name = objParametros.fechainicio.ToString();
                        }
                        namefile = objFile.Prefix + name + "_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + "." + objFile.Extent;
                        // Crear una nueva instancia de libro de trabajo de Excel
                        Console.WriteLine("Creando archivo excel");
                        IWorkbook workbook = new XSSFWorkbook();

                        // Crear una hoja de trabajo
                        ISheet sheet = workbook.CreateSheet("Kardex");

                        // Crear los encabezados de columna
                        IRow headerRow = sheet.CreateRow(0);
                        headerRow.CreateCell(0).SetCellValue("Fecha");
                        headerRow.CreateCell(1).SetCellValue("TipoDocumento");
                        headerRow.CreateCell(2).SetCellValue("NumeroDocumento");
                        headerRow.CreateCell(3).SetCellValue("NumeroReferencia");
                        headerRow.CreateCell(4).SetCellValue("Referencia");
                        headerRow.CreateCell(5).SetCellValue("CodAlmacen");
                        headerRow.CreateCell(6).SetCellValue("Almacen");
                        headerRow.CreateCell(7).SetCellValue("Linea");
                        headerRow.CreateCell(8).SetCellValue("CodArticulo");
                        headerRow.CreateCell(9).SetCellValue("Articulo");
                        headerRow.CreateCell(10).SetCellValue("Ingreso");
                        headerRow.CreateCell(11).SetCellValue("Salida");
                        headerRow.CreateCell(12).SetCellValue("Saldoacumulado");

                        // Llenar la hoja de trabajo con los datos de la lista
                        for (int i = 0; i < lkardex.Count; i++)
                        {
                            IRow dataRow = sheet.CreateRow(i + 1);
                            eKardex kardex = lkardex[i];
                            dataRow.CreateCell(0).SetCellValue(kardex.Fecha);
                            dataRow.CreateCell(1).SetCellValue(kardex.TipoDocumento);
                            dataRow.CreateCell(2).SetCellValue(kardex.NumeroDocumento);
                            dataRow.CreateCell(3).SetCellValue(kardex.NumeroReferencia);
                            dataRow.CreateCell(4).SetCellValue(kardex.Referencia);
                            dataRow.CreateCell(5).SetCellValue(kardex.CodAlmacen);
                            dataRow.CreateCell(6).SetCellValue(kardex.Almacen);
                            dataRow.CreateCell(7).SetCellValue(kardex.Linea);
                            dataRow.CreateCell(8).SetCellValue(kardex.CodArticulo);
                            dataRow.CreateCell(9).SetCellValue(kardex.Articulo);
                            dataRow.CreateCell(10).SetCellValue(kardex.Ingreso);
                            dataRow.CreateCell(11).SetCellValue(kardex.Salida);
                            dataRow.CreateCell(12).SetCellValue(kardex.Saldoacumulado);
                        }
                        if (Directory.Exists(Path.GetDirectoryName(objRuta.Historic)))
                        {
                            if (HasWritePermission(Path.GetDirectoryName(objRuta.Historic)))
                            {
                                // Guardar el libro de trabajo en un archivo
                                using (FileStream fileStream = new FileStream(objRuta.Historic + namefile, FileMode.Create))
                                {
                                    workbook.Write(fileStream);
                                }
                                Console.WriteLine("Terminando de crear archivo excel");
                                kardexObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                                kardexObjects.ultimoproceso(objParametros);
                                Resultado = true;
                            }
                            else
                            {
                                // No se tienen permisos de escritura
                                Console.WriteLine("No se tienen permisos de escritura en el directorio.");
                                objParametros.mensaje = "No se tienen permisos de escritura en el directorio.";
                                kardexObjects.ultimoproceso(objParametros);
                                Resultado = false;
                            }
                        }
                        else
                        {
                            // El directorio no existe
                            Console.WriteLine("El directorio no existe.");
                            objParametros.mensaje = "El directorio no existe.";
                            kardexObjects.ultimoproceso(objParametros);
                            Resultado = false;
                        }
                 
                    }
                    catch (Exception e) {
                        Console.WriteLine("Error: " + e.Message.ToString());
                        kardexObjects.RegistraEvento(objParametros, namefile, null, 1, e.Message.ToString(), "Envío correcto de interfaz");
                        objParametros.mensaje = e.Message.ToString();
                        kardexObjects.ultimoproceso(objParametros);
                        Resultado = false;
                    }
                }
            }
            return Resultado;
        }
        private static bool HasWritePermission(string directoryPath)
        {
            try
            {
                // Intentar crear un archivo temporal en el directorio
                string tempFilePath = Path.Combine(directoryPath, Path.GetRandomFileName());
                using (FileStream fs = new FileStream(tempFilePath, FileMode.CreateNew, FileAccess.Write))
                {
                    // Si se pudo crear el archivo, se tienen permisos de escritura
                    fs.WriteByte(0);
                }
                File.Delete(tempFilePath); // Eliminar el archivo temporal
                return true;
            }
            catch
            {
                // No se tienen permisos de escritura
                return false;
            }
        }
    }
}
