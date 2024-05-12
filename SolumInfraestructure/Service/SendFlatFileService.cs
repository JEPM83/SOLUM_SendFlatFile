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
using ICSharpCode.SharpZipLib.Core;

namespace SolumInfraestructure.Service
{
    public class SendFlatFileService : IPrintSpool
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
                            DataContextDB kardexObjects = new DataContextDB();
                            eCliente eCliente = new eCliente();
                            eCliente = kardexObjects.cargar_company(objParametros);
                            Console.WriteLine("*-------------------------------------------------------------------*");
                            Console.WriteLine("*CLIENTE: [" + eCliente.nombre + "]" + " PROCESO: [" + objParametros.proceso +"]*");
                            Console.WriteLine("*-------------------------------------------------------------------*");
                            Console.WriteLine("IDENTIFICADOR: " + objParametros.hostgroupid);
                            Console.WriteLine("");
                            objParametros.sociedad = eCliente.sociedad;
                            objParametros.nombre = eCliente.nombre;
                            cargar_ruta(objParametros);
                        }
                        else
                        {
                            Console.WriteLine("!!NO EXISTE CONFIGURACION DEL PROCESO: [" + objParametros.proceso + "] EN EL SISTEMA");
                        }
                    }
                }
            }
        }
        public List<eParametros> cargar_parametros() {
            DataContextDB FlatFileObjects = new DataContextDB();
            var resp = new List<eParametros>();
            try
            {
                resp = FlatFileObjects.cargar_parametros();
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
            DataContextDB FlatFileObjects = new DataContextDB();
            try
            {
                resp = FlatFileObjects.cargar_configuracion(objParametros);
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
            DataContextDB FlatFileObjects = new DataContextDB();
            List<eRuta> resp = new List<eRuta>();
            List<eFile> file = new List<eFile>();
            eResponse Resultado = new eResponse();
            //bool Resultado = false;
            try
            {
                resp = FlatFileObjects.cargar_ruta(objParametros);
                if (resp == null)
                {
                    Console.WriteLine("!!RUTA NO CONFIGURADA O DESACTIVADA PARA EL PROCESO: [" + objParametros.proceso + "]");
                }
                else {
                    //Console.WriteLine("CONFIGURACION DE RUTAS PARA EL PROCESO [" + objParametros.proceso + "]");
                }
                foreach (var ruta in resp)
                {
                    Console.WriteLine("RUTA: " + ruta.Route);
                    file = cargar_file(objParametros, ruta);
                    //foreach (var efile in file) {
                    if (file != null)
                    {
                        Resultado = resultado(file, ruta, objParametros);
                        Console.WriteLine("*----------FIN-----------*");
                    }
                    else {
                        Console.WriteLine("!!NO HAY OBJETOS CONFIGURADOS");
                    }
                    //}
                    if (ruta.Email == true) {
                        //if (Resultado == true)
                        if (Resultado.Notificar == true)
                        {
                            FlatFileObjects.sendemail(objParametros,ruta,Resultado);
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
            DataContextDB FlatFileObjects = new DataContextDB();
            List<eFile> file = new List<eFile>();
            List<List<string>> lista = new List<List<string>>();
            try
            {
                file = FlatFileObjects.cargar_file(objParametros, objRuta);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return file;
        }
        public eResponse resultado(List<eFile> objFile, eRuta objRuta, eParametros objParametros)
        {
            //bool Resultado = false;
            //bool Resultado_Final = false;
            eResponse Resultado = new eResponse();
            eResponse Resultado_Final = new eResponse();
            List<List<string>> lista = new List<List<string>>();
            Console.WriteLine("");
            Console.WriteLine("OBJETOS:");
            foreach (var file in objFile)
            {
                Console.WriteLine("Prefijo: " + file.Prefix + " Extensión: " + file.Extent + " Destino: " + file.Destino + " Tipo:" + file.Type.ToString());
                if (String.IsNullOrEmpty(file.Ordenamiento))
                {
                    objParametros.modo = 0;
                    Resultado = obtener_datos(objParametros,file,objRuta);
                    //if (Resultado == true)
                    if (Resultado.Tipo == "success")
                    {
                        Resultado_Final = Resultado;
                    }
                    else if (Resultado.Tipo == "error")
                    {
                        Resultado_Final = Resultado;
                        break;
                    }
                    else if (Resultado.Tipo == null) {
                        break;
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
                //if (Resultado == true)
                if (Resultado.Tipo == "success")
                {
                    Resultado_Final = Resultado;
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
                    //if (Resultado == true)
                    if (Resultado.Tipo == "success")
                    {
                        Resultado_Final = Resultado;
                    }
                }
            }
            return Resultado_Final;
        }
        private eResponse recorrer_grupo_archivo(eParametros objParametros, eRuta objRuta, List<List<string>> lista, string nombre)
        {
            eResponse Resultado = new eResponse();
            eResponse Resultado_Final = new eResponse();
            List<List<string>> lista_trabajo = new List<List<string>>();
            string name_prefijo = null;
            string nombre_final = null;
            string[] files;
            int i = 0;
            bool estado = true;
            //bool Resultado = false;
            //bool Resultado_Final = false;
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
                    //if (Resultado == true)
                    if (Resultado.Tipo == "success")
                    {
                        //Resultado_Final = true;
                        Resultado_Final = Resultado;
                    }
                }
                //KeySolum.Clear();
            }
            return Resultado_Final;
        }
        private eResponse obtener_datos(eParametros objParametros,eFile objFile,eRuta objRuta)
        {
            //bool Resultado = false;
            eResponse Resultado = new eResponse();
            DataContextDB FlatFileObjects = new DataContextDB();
            int? modalidad = null;
            if (objFile.Type != null)
            {
                modalidad = objFile.Type; //Si el detalle del Type en la tabla EX_FILE esta configurado, se toma ese valor.
            }
            else if (objParametros.modalidad != null) { 
                modalidad = objParametros.modalidad; //Si el detalle del Type en la tabla EX_FILE es null o no existe, se toma el valor de la modalidad del planificado de manera general.
            }
            string[] files;
            if (objParametros.modo == 0 && (modalidad == 0 || objParametros.modalidad == 2)) //modo=0 Cuando puede filtrar diversos archivos y en la configuracion este seteado 1 solo archivo, ejm: SAP_PRD_
            {
                files = Directory.GetFiles(objRuta.Route, objFile.Prefix + "*." + objFile.Extent);
            }
            else if (objParametros.modo == 1 && (modalidad == 0 || objParametros.modalidad == 2)) //modo=1 Cuando tiene que filtrar nombres exactos debido a que los archivos estan configurados en pares o mas, ejm: SAP_OD_CAB y SAP_OD_DET
            {
                files = Directory.GetFiles(objRuta.Route, objFile.Prefix + objFile.Extent);
            }
            else {
                files = null;
            }
            if (files != null && modalidad == 0) //TRABAJAR CON ARCHIVO TXT YA EXISTENTE EN RUTA
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
                            FlatFileObjects.ultimoproceso(objParametros);
                            Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                        }
                        else
                        {
                            System.IO.File.Move(objRuta.Route + namefile, objRuta.Historic + namefile + "-" + DateTime.Now.ToString("yyyyMMddHHmmssfff"));
                            Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de datos - archivo renombrado");
                        }
                    }
                    catch (Exception e)
                    {
                        if (!System.IO.File.Exists(objRuta.LogErr + namefile))
                        {
                            try
                            {
                                System.IO.File.Move(objRuta.Route + namefile, objRuta.LogErr + namefile);
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString(), "Error en envío de datos");
                            }
                            catch (Exception y)
                            {
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString() + " - " + y.Message.ToString(), "Error al copiar el txt a la ruta LOG");
                                Resultado.Notificar = false;
                            }
                        }
                        else
                        {
                            try
                            {
                                System.IO.File.Move(objRuta.Route + namefile, objRuta.LogErr + namefile + "-" + DateTime.Now.ToString("yyyyMMddHHmmssfff"));
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString(), "Error en envío de datos - archivo renombrado");

                            }
                            catch (Exception y)
                            {
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString() + " - " + y.Message.ToString(), "Error al copiar el txt renombrado a la ruta LOG");
                                Resultado.Notificar = false;
                            }
                        }
                    }
                }
            }
            else if (modalidad == 1)
            { //TRABAJAR CON OBJETO, CREAR EL ARCHIVO TXT O XLSX Y MOVERLO AL HIS
                string name = String.Empty;
                string namefile = String.Empty;
                if (objFile.Extent.ToUpper() == "TXT")
                {
                    var lkardex = FlatFileObjects.EjecutarKardex(objParametros, FlatFileObjects.cargar_modelo(objRuta));
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
                    FlatFileObjects.ultimoproceso(objParametros);
                    Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                }
                else if (objFile.Extent.ToUpper() == "XLSX")
                {
                    try
                    {
                        var lkardex = FlatFileObjects.EjecutarKardex(objParametros, FlatFileObjects.cargar_modelo(objRuta));
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
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                            }
                            else
                            {
                                // No se tienen permisos de escritura
                                Console.WriteLine("No se tienen permisos de escritura en el directorio.");
                                objParametros.mensaje = "No se tienen permisos de escritura en el directorio.";
                                Resultado = FlatFileObjects.ultimoproceso(objParametros);
                            }
                        }
                        else
                        {
                            // El directorio no existe
                            Console.WriteLine("El directorio no existe.");
                            objParametros.mensaje = "El directorio no existe.";
                            Resultado = FlatFileObjects.ultimoproceso(objParametros);
                        }

                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Error: " + e.Message.ToString());
                        FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, e.Message.ToString(), "Envío correcto de interfaz");
                        objParametros.mensaje = e.Message.ToString();
                        Resultado = FlatFileObjects.ultimoproceso(objParametros);
                    }
                }
            }
            else if (modalidad == 2 && files.Count()> 0)
            { //Trabajar a partir de un archivo plano y migrarlo a una tabla de la BD
                foreach (string names in files)
                {
                    long q = 0;
                    string namefile = Path.GetFileName((names));
                    Console.WriteLine("   OBJETO: " + namefile);
                    eResponse eResponse = new eResponse();
                    objFile.Separator = "\t";
                    try
                    {
                        if (!System.IO.File.Exists(objRuta.Historic + namefile))
                        {
                            using (StreamReader reader = new StreamReader(objRuta.Route + namefile))
                            {
                                int? headerRow = objParametros.titulo ?? 1; // Fila que contiene los nombres de las columnas
                                int? dataStartRow = objParametros.datos - objParametros.titulo ?? 3; // Fila a partir de la cual comienzan los datos
                                string line;
                                for (int i = 1; i < headerRow; i++)
                                {
                                    reader.ReadLine();
                                }
                                string[] columnNames = reader.ReadLine().Split(char.Parse(objFile.Separator)); // Lee la fila de nombres de columna
                                DataTable dataTable = new DataTable();
                                dataTable.Columns.Add("Sociedad", typeof(string));
                                dataTable.Columns.Add("HostGroupId", typeof(string));
                                dataTable.Columns.Add("U_EX_CLIENTE", typeof(string));
                                foreach (string columnName in columnNames)
                                {
                                    dataTable.Columns.Add(columnName, typeof(string)); // Asigna un tipo de dato adecuado según tus necesidades
                                }
                                // Leer y agregar los datos a partir de la fila especificada
                                for (int i = 1; i < dataStartRow; i++)
                                {
                                    reader.ReadLine(); // Saltar filas hasta llegar a la fila de datos
                                }
                                while ((line = reader.ReadLine()) != null)
                                {
                                    //string[] parts = line.Split('\t'); // Utiliza tabulación como separador
                                    string[] parts = line.Split(char.Parse(objFile.Separator)); // Utiliza tabulación como separador
                                    List<string> rowData = new List<string> { objParametros.sociedad, objParametros.hostgroupid, objParametros.cliente };
                                    rowData.AddRange(parts);
                                    dataTable.Rows.Add(rowData.ToArray());
                                }
                                eResponse = FlatFileObjects.ProcesarDataMasiva(dataTable, objFile);
                            }
                            System.IO.File.Move(objRuta.Route + namefile, objRuta.Historic + namefile);
                            FlatFileObjects.ultimoproceso(objParametros);
                            if (eResponse.Tipo == "success")
                            {
                                Console.WriteLine("   " + namefile + " cargado correctamente en:" + objFile.Destino);
                                Console.WriteLine("");
                                Resultado = eResponse;
                                FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de interfaz");
                            }
                            else
                            {
                                Console.WriteLine("   Error en la carga masiva del objeto: " + namefile + " hacia: " + objFile.Destino);
                                Resultado = eResponse;
                                FlatFileObjects.RegistraEvento(objParametros, objFile.Destino, null, 0, eResponse.Mensaje, "Error en la ejecucion de Transacciones");
                            }
                        }
                        else
                        {
                            System.IO.File.Move(objRuta.Route + namefile, objRuta.Historic + namefile + "-" + DateTime.Now.ToString("yyyyMMddHHmmssfff"));
                            Resultado = eResponse;
                            FlatFileObjects.RegistraEvento(objParametros, namefile, null, 1, null, "Envío correcto de datos - archivo renombrado");
                        }
                    }
                    catch (Exception e)
                    {
                        if (!System.IO.File.Exists(objRuta.LogErr + namefile))
                        {
                            try
                            {
                                System.IO.File.Move(objRuta.Route + namefile, objRuta.LogErr + namefile);
                                FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString(), "Error en envío de datos");
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = eResponse;
                            }
                            catch (Exception y)
                            {
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString() + " - " + y.Message.ToString(), "Error al copiar el txt a la ruta LOG");
                                Resultado = eResponse;
                            }
                        }
                        else
                        {
                            try
                            {
                                System.IO.File.Move(objRuta.Route + namefile, objRuta.LogErr + namefile + "-" + DateTime.Now.ToString("yyyyMMddHHmmssfff"));
                                FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString(), "Error en envío de datos - archivo renombrado");
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                Resultado = eResponse;
                            }
                            catch (Exception y)
                            {
                                objParametros.mensaje = e.Message.ToString();
                                FlatFileObjects.ultimoproceso(objParametros);
                                FlatFileObjects.RegistraEvento(objParametros, namefile, null, 0, e.Message.ToString() + " - " + y.Message.ToString(), "Error al copiar el txt renombrado a la ruta LOG");
                                Resultado = eResponse;
                            }
                        }
                    }
                }
            }
            else if (modalidad == 4)
            {
                string sql_ejecutar = string.Empty;
                eResponse objResponseSql = new eResponse();
                try
                {
                    var sql_exec = objFile.SAttribute;
                    sql_ejecutar = Escanear_Variables(sql_exec, objParametros);
                    objResponseSql = FlatFileObjects.EjecutarScriptRetorno(sql_ejecutar);
                    if (objResponseSql.Tipo == "success")
                    {
                        FlatFileObjects.RegistraEvento(objParametros, objFile.Destino, null, 1, null, "Envío correcto de interfaz");
                        //Console.WriteLine(objResponseSql.Titulo);
                        //Console.WriteLine(objResponseSql.Mensaje);
                        Console.WriteLine("   " + objFile.SAttribute + " ejecutado y cargado correctamente en: " + objFile.Destino);
                        Console.WriteLine("");
                        Resultado = objResponseSql;
                    }
                    else if (objResponseSql.Tipo == "error")
                    {
                        FlatFileObjects.RegistraEvento(objParametros, objFile.Destino, null, 0, objResponseSql.Mensaje, "Error en la ejecucion de Transacciones" + sql_ejecutar);
                        //Console.WriteLine(objResponseSql.Titulo);
                        Console.WriteLine(objResponseSql.Mensaje);
                        Console.WriteLine("");
                        Resultado = objResponseSql;
                    }
                }
                catch (Exception e)
                {
                    FlatFileObjects.RegistraEvento(objParametros, objFile.Destino, null, 0, e.Message.ToString(), "Error en la ejecucion de Transacciones" + sql_ejecutar);
                    Resultado = objResponseSql;
                    //Console.WriteLine(objResponseSql.Titulo);
                    Console.WriteLine(objResponseSql.Mensaje);
                    Console.WriteLine("");
                }
            }
            else if (files.Count() == 0) {
                Console.WriteLine("");
                Console.WriteLine("NO HAY OBJETOS A PROCESAR EN ESTOS MOMENTOS!!");
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
        public string Escanear_Variables(string sql_exec,eParametros objParametros)
        {
            sql_exec = String.IsNullOrEmpty(sql_exec) ? "" : sql_exec;
            int scan = sql_exec.IndexOf("@@");
            string cadena = string.Empty;
            while (scan > 1)
            {
                var scan_1 = sql_exec.IndexOf(" ", scan);
                var variable = sql_exec.Substring(scan, (scan_1 - scan));
                cadena = sql_exec.Replace(@variable, @obtener_valor_variable(variable, objParametros));
                sql_exec = cadena;
                scan = sql_exec.IndexOf("@@", scan + 1);
            }
            if (String.IsNullOrEmpty(cadena))
            {
                cadena = sql_exec;
            }
            return cadena;
        }
        public string obtener_valor_variable(string variable, eParametros objParametros)
        {
            if (variable == "@@HGUI")
            {
                return "'" + objParametros.hostgroupid + "'";
            }
            else if (variable == "@@CIA")
            {
                return "'" + objParametros.cliente + "'";

            }
            else if (variable == "@@SOCIEDAD")
            {
                return "'" + objParametros.sociedad + "'";

            }
            else
            {
                return string.Empty;
            }
        }
    }
}
