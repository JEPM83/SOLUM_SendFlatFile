using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using SolumInfraestructure.Domain.Entities;
using SolumInfraestructure.Interface;
using System.Data;
using System.Data.SqlClient;
using static System.Net.WebRequestMethods;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;

namespace SolumInfraestructure.Domain.DBContext
{
    public class DataContextDB:IPrintSpool
    {
        protected string cnxStringCRM = ConfigurationManager.ConnectionStrings["conexionCRM"].ToString();
        public bool cargar_configuracion(eParametros parametros)
        {
            using (SqlConnection conn = new SqlConnection(cnxStringCRM))
            using (SqlCommand cmd = new SqlCommand("select Code from [@EX_PROCESO] where Code = '" + parametros.proceso + "' and state = 0", conn))
            {
                SqlDataReader rd = null;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                int i = 0;
                try
                {
                    rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        i++;
                    }
                    conn.Close();
                    rd.Close();
                    if (i == 0)
                    {
                        return false;
                    }
                    else
                    {
                        Console.WriteLine("Entro a configuracion [@EX_PROCESO]!!: " + parametros.proceso + "");
                        return true;
                    }
                }
                finally
                {
                    conn.Close();
                    rd.Close();
                }
            }
            
        }
        public List<eRuta> cargar_ruta(eParametros parametros)
        {
            var eFtpListDetail = new List<eRuta>();
            using (SqlConnection conn = new SqlConnection(cnxStringCRM))
            using (SqlCommand cmd = new SqlCommand("select Code,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Attached,U_EX_MODELO,Zip,Subject,Environment,LogErr from [@EX_RUTA] where U_EX_CLIENTE = '" + parametros.cliente + "' and U_EX_PROCESO = '" + parametros.proceso + "' and state = 0", conn))
            {
                SqlDataReader rd = null;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                int i = 0;
                try
                {
                    rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        i++;
                        var eFtpDetail =  new eRuta();
                        eFtpDetail.Code = int.Parse(rd.GetValue(0).ToString());
                        eFtpDetail.Server = rd.GetValue(1).ToString();
                        eFtpDetail.Port = string.IsNullOrEmpty(rd.GetValue(2).ToString()) ? 0 : int.Parse(rd.GetValue(2).ToString());
                        eFtpDetail.Route = rd.GetValue(3).ToString();
                        eFtpDetail.Sftp = rd.GetBoolean(4);
                        eFtpDetail.Historic = rd.GetValue(5).ToString();
                        eFtpDetail.UserSap = rd.GetValue(6).ToString();
                        eFtpDetail.Password = rd.GetValue(7).ToString();
                        eFtpDetail.Email = rd.GetBoolean(8);
                        eFtpDetail.Attached = rd.GetBoolean(9);
                        eFtpDetail.Modelo = rd.GetValue(9) != DBNull.Value ?rd.GetValue(10).ToString() : null;
                        eFtpDetail.LogErr = rd.GetValue(14).ToString();
                        eFtpDetail.Subject = rd.GetValue(12).ToString();
                        eFtpListDetail.Add(eFtpDetail);
                    }

                    if (i == 0)
                    {
                        //MessageBox.Show("RUTA no configurada o desactivada en proceso de INVENTORY");
                    }
                    rd.Close();
                    conn.Close();
                }
                finally
                {
                    rd.Close();
                    conn.Close();
                }
                return eFtpListDetail;
            }
        }
        public List<eFile> cargar_file(eParametros parametros,eRuta ruta)
        {
            var eFileListDetail = new List<eFile>();
            using (SqlConnection conn = new SqlConnection(cnxStringCRM))
            using (SqlCommand cmd = new SqlCommand("select Prefix,Extent,Separator,Destino,[Order] from [@EX_FILE] where U_EX_RUTA = " + ruta.Code + " and state = 0 order by [Order]", conn))
            {
                SqlDataReader rd = null;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                int i = 0;
                Console.WriteLine("Entrando a obtener archivo");
                try
                {
                    rd = cmd.ExecuteReader();
                    //List<List<string>> lista = new List<List<string>>();
                    while (rd.Read())
                    {
                        i++;
                        var eFileDetail = new eFile();
                        eFileDetail.Prefix = rd.GetValue(0).ToString();
                        eFileDetail.Extent = rd.GetValue(1).ToString();
                        eFileDetail.Separator = rd.GetValue(2).ToString();
                        eFileDetail.Destino = rd.GetValue(3).ToString();
                        eFileDetail.Ordenamiento = rd.GetValue(4).ToString();
                        eFileListDetail.Add(eFileDetail);
                        Console.WriteLine("Archivo " + eFileDetail.Prefix);
                    }
                    rd.Close();
                    conn.Close();
                    return eFileListDetail;
                }
                finally
                {
                    rd.Close();
                    conn.Close();
                }
            }
        }
        public List<eParametros> cargar_parametros() {
            var eFileListDetail = new List<eParametros>();
            using (SqlConnection conn = new SqlConnection(cnxStringCRM))
            using (SqlCommand cmd = new SqlCommand("select Code,U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,format(fechainicio,'yyyy-MM-dd') fechainicio,format(fechafin,'yyyy-MM-dd') fechafin,ultimoproceso from [@EX_PLANIFICADO] where state = 0 order by [Code]", conn))
            {
                SqlDataReader rd = null;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                int i = 0;
                Console.WriteLine("Entrando a lista de planificados");
                try
                {
                    rd = cmd.ExecuteReader();
                    //List<List<string>> lista = new List<List<string>>();
                    while (rd.Read())
                    {
                        i++;
                        var eFileDetail = new eParametros();
                        eFileDetail.code = int.Parse(rd.GetValue(0).ToString());
                        eFileDetail.cliente = rd.GetValue(1).ToString();
                        eFileDetail.proceso = rd.GetValue(2).ToString();
                        eFileDetail.tipo =  int.Parse(rd.GetValue(3).ToString());
                        eFileDetail.hora = rd.GetValue(4) != DBNull.Value ? int.Parse(rd.GetValue(4).ToString()) : null; 
                        eFileDetail.minuto = rd.GetValue(5) != DBNull.Value ? int.Parse(rd.GetValue(5).ToString()) : null;
                        eFileDetail.lunes = rd.GetValue(6) != DBNull.Value ? bool.Parse(rd.GetValue(6).ToString()) : null;
                        eFileDetail.martes = rd.GetValue(7) != DBNull.Value ? bool.Parse(rd.GetValue(7).ToString()) : null;
                        eFileDetail.miercoles = rd.GetValue(8) != DBNull.Value ? bool.Parse(rd.GetValue(8).ToString()) : null;
                        eFileDetail.jueves = rd.GetValue(9) != DBNull.Value ? bool.Parse(rd.GetValue(9).ToString()) : null;
                        eFileDetail.viernes = rd.GetValue(10) != DBNull.Value ? bool.Parse(rd.GetValue(10).ToString()) : null;
                        eFileDetail.sabado = rd.GetValue(11) != DBNull.Value ? bool.Parse(rd.GetValue(11).ToString()) : null;
                        eFileDetail.domingo = rd.GetValue(12) != DBNull.Value ? bool.Parse(rd.GetValue(12).ToString()) : null;
                        eFileDetail.modalidad = rd.GetValue(13) != DBNull.Value ? int.Parse(rd.GetValue(13).ToString()) : null;
                        eFileDetail.titulo = rd.GetValue(14) != DBNull.Value ? int.Parse(rd.GetValue(14).ToString()) : null;
                        eFileDetail.datos = rd.GetValue(15) != DBNull.Value ? int.Parse(rd.GetValue(15).ToString()) : null;
                        eFileDetail.fechainicio = rd.GetValue(16) != DBNull.Value ? rd.GetValue(16).ToString() : null;
                        eFileDetail.fechafin = rd.GetValue(17) != DBNull.Value ? rd.GetValue(17).ToString() : null;
                        eFileDetail.ultimoproceso = rd.GetValue(18) != DBNull.Value ? DateTime.Parse(rd.GetValue(18).ToString()) : null;
                        string hostgroupid = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                        eFileDetail.hostgroupid = hostgroupid;
                        DateTime now = DateTime.Now;
                        DayOfWeek diaSemana = now.DayOfWeek;
                        //string nombreDiaSemana = diaSemana.ToString();
                        int hora = now.Hour;
                        int minuto = now.Minute;

                        int? ultimahora = rd.GetValue(18) != DBNull.Value ? DateTime.Parse(eFileDetail.ultimoproceso.ToString()).Hour : null;
                        int? ultimominuto = rd.GetValue(18) != DBNull.Value ? DateTime.Parse(eFileDetail.ultimoproceso.ToString()).Minute : null;
                        DayOfWeek? ultimodia = rd.GetValue(18) != DBNull.Value ? DateTime.Parse(eFileDetail.ultimoproceso.ToString()).DayOfWeek : null;
                        if (eFileDetail.tipo == 0)
                        {
                            eFileDetail.ejecutar = true;
                        }
                        else {
                            if (validar_dia(diaSemana, eFileDetail) == true)
                            {
                                if (hora == eFileDetail.hora && minuto == eFileDetail.minuto)
                                {
                                    if (hora == ultimahora && minuto == ultimominuto && diaSemana == ultimodia)
                                    {
                                        eFileDetail.ejecutar = false;
                                    }
                                    else
                                    {
                                        eFileDetail.ejecutar = true;
                                    }
                                }
                                else {
                                    eFileDetail.ejecutar = false;
                                }
                            }
                            else { 
                                eFileDetail.ejecutar = false;
                            }
                        }
                        eFileListDetail.Add(eFileDetail);
                        Console.WriteLine("Planificado del cliente: " + eFileDetail.cliente);
                    }
                    rd.Close();
                    conn.Close();
                    return eFileListDetail;
                }
                finally
                {
                    rd.Close();
                    conn.Close();
                }
            }
        }
        public bool validar_dia(DayOfWeek diaSemana, eParametros obj) {
            bool validar = false;
            switch (diaSemana)
            {
                case DayOfWeek.Sunday:
                    validar = obj.domingo.HasValue && obj.domingo.Value;
                    break;
                case DayOfWeek.Monday:
                    validar = obj.lunes.HasValue && obj.lunes.Value;
                    break;
                case DayOfWeek.Tuesday:
                    validar = obj.martes.HasValue && obj.martes.Value;
                    break;
                case DayOfWeek.Wednesday:
                    validar = obj.miercoles.HasValue && obj.miercoles.Value;
                    break;
                case DayOfWeek.Thursday:
                    validar = obj.jueves.HasValue && obj.jueves.Value;
                    break;
                case DayOfWeek.Friday:
                    validar = obj.viernes.HasValue && obj.viernes.Value;
                    break;
                case DayOfWeek.Saturday:
                    validar = obj.sabado.HasValue && obj.sabado.Value;
                    break;
            }
            return validar;
        }
        public string cargar_company(eParametros parametros)
        {
            using (SqlConnection conn = new SqlConnection(cnxStringCRM))
            using (SqlCommand cmd = new SqlCommand("select Code, Class, Name,Company from [@EX_CLIENTE] where state = 0 and code = '" + parametros.cliente + "'", conn))
            {
                SqlDataReader rd = null;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                string Ccompany = null;
                try
                {
                    rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        Ccompany = rd.GetValue(3).ToString();
                    }
                    rd.Close();
                    conn.Close() ;
                    return Ccompany;
                }
                finally
                {
                    rd.Close();
                    conn.Close();
                }
            }
        }
        public bool sendemail(eParametros objParametros, eRuta objRuta)
        {
            bool Resultado = false;
            if (objRuta.Email == true)
            {
                /**/
                Console.WriteLine("Iniciando proceso de envio de correo");
                string pathToCertificateFile = ConfigurationManager.AppSettings["PathToCertificateFile"];
                pathToCertificateFile = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + pathToCertificateFile;
                /**/
                using (SqlConnection conn = new SqlConnection(cnxStringCRM))
                using (SqlCommand cmd = new SqlCommand("select Email,Password,Type from [@EX_CONTACT] where U_EX_RUTA = " + objRuta.Code + " and state = 0", conn))
                {
                    SqlDataReader rd = null;
                    SqlDataReader rd_log = null;
                    cmd.CommandType = CommandType.Text;
                    conn.Open();
                    System.Data.DataTable dtSap;
                    int i = 0;
                    int j = 0;
                    try
                    {
                        rd = cmd.ExecuteReader();
                        dtSap = new System.Data.DataTable() { TableName = "Contact" };
                        System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();
                        System.Net.Mail.SmtpClient clienteC = new System.Net.Mail.SmtpClient();
                        //mmsg.Subject = "OPERADOR SOLUM: Envio de Interfaz de Kardex: (" + objParametros.proceso + ") - " + objRuta.Subject + " " + cargar_company(objParametros) + " " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        mmsg.Subject = "OPERADOR SOLUM: " + objRuta.Subject + " " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        mmsg.SubjectEncoding = System.Text.Encoding.UTF8;
                        while (rd.Read())
                        {
                            i++;
                            if (int.Parse(rd.GetValue(2).ToString()) == 0)
                            {
                                j++;
                                //Correo emisor
                                mmsg.From = new System.Net.Mail.MailAddress(rd.GetValue(0).ToString());
                                //Credenciales
                                clienteC.Credentials = new System.Net.NetworkCredential(rd.GetValue(0).ToString(), rd.GetValue(1).ToString());
                                //Si es gmail
                                clienteC.Port = 587;
                                clienteC.EnableSsl = true;
                                X509Certificate certificate = X509Certificate.CreateFromCertFile(pathToCertificateFile);
                                clienteC.ClientCertificates.Add(certificate);
                                clienteC.Host = "smtp.office365.com";
                            }
                            else if (int.Parse(rd.GetValue(2).ToString()) == 1)
                            {
                                mmsg.To.Add(rd.GetValue(0).ToString());
                                Console.WriteLine("Usuario 1:" + rd.GetValue(0).ToString());
                            }
                            else if (int.Parse(rd.GetValue(2).ToString()) == 2)
                            {
                                mmsg.CC.Add(rd.GetValue(0).ToString());
                                Console.WriteLine("Usuario 2:" + rd.GetValue(0).ToString());
                            }
                            else if (int.Parse(rd.GetValue(2).ToString()) == 3)
                            {
                                mmsg.Bcc.Add(rd.GetValue(0).ToString());
                                Console.WriteLine("Usuario 3:" + rd.GetValue(0).ToString());
                            }
                        }
                        rd.Close();
                        conn.Close();
                        //Lista de interfaces
                        using (SqlCommand cmd_log = new SqlCommand("select isnull([Historic] ,'') , isnull(FileName,''),Message  from [@EX_LOG] where HostGroupId = '" + objParametros.hostgroupid + "' and State = 1", conn))
                        {
                            cmd_log.CommandTimeout = 300;
                            conn.Open();
                            rd_log = cmd_log.ExecuteReader();
                            cmd_log.CommandType = CommandType.Text;
                            string mensaje = null;
                            while (rd_log.Read())
                            {
                                //Environment.NewLine
                                if (objRuta.Attached == true)
                                {
                                    //mensaje = mensaje + "ARCHIVO: " + rd_log.GetString(0) + rd_log.GetString(1) + "  MENSAJE: " + rd_log.GetString(2) + Environment.NewLine;
                                    System.Net.Mail.Attachment attachment = new System.Net.Mail.Attachment(rd_log.GetString(0) + rd_log.GetString(1));
                                    mmsg.Attachments.Add(attachment);
                                    Console.WriteLine("Archivo adjunto");
                                }
                            }
                            //
                            mmsg.Body = mensaje + Environment.NewLine + "Identificador: " + objParametros.hostgroupid + Environment.NewLine + "Se ha enviado con éxito";
                            mmsg.BodyEncoding = System.Text.Encoding.UTF8;
                            mmsg.IsBodyHtml = false;
                            mmsg.Priority = System.Net.Mail.MailPriority.High;

                            if (j == 1)
                            {
                                try
                                {
                                    Console.WriteLine("Inicio de envio de correo");
                                    clienteC.Send(mmsg);
                                    Resultado = true;
                                    Console.WriteLine("Correo enviado con éxito");
                                }
                                catch (System.Net.Mail.SmtpException ex)
                                {
                                    //MessageBox.Show(ex.Message.ToString());
                                    //Inscribir error
                                    Resultado = false;
                                }
                                if (i == 0)
                                {
                                    //MessageBox.Show("DESTINATARIOS no configurados o desactivados en proceso de INVENTORY");
                                    //Inscribir error
                                }
                            }
                            else
                            {
                                //MessageBox.Show("Correo emisor no configurado en proceso INVENTORY");
                                //Inscribir error
                            }
                            ////
                            rd.Close();
                            conn.Close();
                        }
                    }
                    catch (Exception e)
                    {
                        rd.Close();
                        conn.Close();
                    }
                }
               
            }
            return Resultado;
        }
        public bool RegistraEvento(eParametros objParametros, string fileName, string referencia, int status, string messageSystem, string message)
        {
            bool Resultado = false;
            try
            {
                using (SqlConnection conn = new SqlConnection(cnxStringCRM))
                using (SqlCommand cmd = new SqlCommand("Sp_registareventosolum", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@HostGroupId", SqlDbType.VarChar).Value = objParametros.hostgroupid == null ? string.Empty : objParametros.hostgroupid; ;
                    cmd.Parameters.Add("@Cliente", SqlDbType.NVarChar).Value = objParametros.cliente;
                    cmd.Parameters.Add("@ProcessName", SqlDbType.NVarChar).Value = objParametros.proceso;
                    cmd.Parameters.Add("@FileName", SqlDbType.VarChar).Value = fileName == null ? System.Data.SqlTypes.SqlString.Null : fileName;
                    cmd.Parameters.Add("@Reference", SqlDbType.VarChar).Value = referencia == null ? string.Empty : referencia;
                    cmd.Parameters.Add("@Status", SqlDbType.Int).Value = status;
                    cmd.Parameters.Add("@MessageSystem", SqlDbType.VarChar).Value = messageSystem == null ? System.Data.SqlTypes.SqlString.Null : messageSystem;
                    cmd.Parameters.Add("@Message", SqlDbType.VarChar).Value = message == null ? System.Data.SqlTypes.SqlString.Null : message;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Resultado = true;
                    conn.Close();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.ToString());
            }
            return Resultado;
        }
        public bool ultimoproceso(eParametros objParametros)
        {
            bool Resultado = false;
            objParametros.usuario = Environment.UserName;
            try
            {
                using (SqlConnection conn = new SqlConnection(cnxStringCRM))
                using (SqlCommand cmd = new SqlCommand("BZ_JEPM_UltimoProceso_Planificado", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Code", SqlDbType.Int).Value = objParametros.code; ;
                    cmd.Parameters.Add("@Auditoria", SqlDbType.DateTime).Value = DateTime.Now; ;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar).Value = objParametros.mensaje; ;
                    cmd.Parameters.Add("@Hostgroupid", SqlDbType.VarChar).Value = objParametros.hostgroupid; ;
                    cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = objParametros.usuario; ;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Resultado = true;
                    conn.Close();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.ToString());
            }
            return Resultado;
        }
        public eModelo cargar_modelo(eRuta ruta)
        {
            var eFileListDetail = new eModelo();
            using (SqlConnection conn = new SqlConnection(cnxStringCRM))
            using (SqlCommand cmd = new SqlCommand("select Code,Name,SQL,Columnas,State from [@EX_MODELO] where Code = '" + ruta.Modelo + "' and state = 0", conn))
            {
                SqlDataReader rd = null;
                cmd.CommandType = CommandType.Text;
                conn.Open();
                int i = 0;
                Console.WriteLine("Entrando a obtener archivo");
                try
                {
                    rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        i++;
                        var eFileDetail = new eModelo();
                        eFileDetail.code = rd.GetValue(0) != DBNull.Value ? rd.GetValue(0).ToString() : null;
                        eFileDetail.name = rd.GetValue(1) != DBNull.Value ? rd.GetValue(1).ToString() : null;
                        eFileDetail.sql = rd.GetValue(2) != DBNull.Value ? rd.GetValue(2).ToString() : null;
                        eFileDetail.columnas = rd.GetValue(3) != DBNull.Value ? int.Parse(rd.GetValue(3).ToString()) : null;
                        eFileListDetail = eFileDetail;
                    }
                    rd.Close();
                    conn.Close();
                    return eFileListDetail;
                }
                finally
                {
                    rd.Close();
                    conn.Close();
                }
            }
        }
        public List<eKardex> EjecutarKardex(eParametros objParametros,eModelo modelo)
        {
            try
            {
                var eFileListDetail = new List<eKardex>();
                using (SqlConnection conn = new SqlConnection(cnxStringCRM))
                using (SqlCommand cmd = new SqlCommand(modelo.sql, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@SN", SqlDbType.VarChar).Value = "C" + objParametros.cliente ;
                    cmd.Parameters.Add("@FechaInicio", SqlDbType.Date).Value = objParametros.fechainicio ?? DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@FechaFin", SqlDbType.Date).Value = objParametros.fechafin ?? DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    SqlDataReader rd = null;
                    rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        var eFileDetail = new eKardex();
                        eFileDetail.Fecha = rd.GetValue(0) != DBNull.Value ? DateTime.Parse(rd.GetValue(0).ToString()).Date.ToString("dd/MM/yyyy") : null;
                        eFileDetail.TipoDocumento = rd.GetValue(1) != DBNull.Value ? rd.GetValue(1).ToString() : null;
                        eFileDetail.NumeroDocumento = rd.GetValue(2) != DBNull.Value ? rd.GetValue(2).ToString() : null;
                        eFileDetail.NumeroReferencia = rd.GetValue(3) != DBNull.Value ? rd.GetValue(3).ToString() : null;
                        eFileDetail.Referencia = rd.GetValue(4) != DBNull.Value ? rd.GetValue(4).ToString() : null;
                        eFileDetail.CodAlmacen = rd.GetValue(5) != DBNull.Value ? rd.GetValue(5).ToString() : null;
                        eFileDetail.Almacen = rd.GetValue(6) != DBNull.Value ? rd.GetValue(6).ToString() : null;
                        eFileDetail.Linea = rd.GetValue(7) != DBNull.Value ? rd.GetValue(7).ToString() : null;
                        eFileDetail.CodArticulo = rd.GetValue(8) != DBNull.Value ? rd.GetValue(8).ToString() : null;
                        eFileDetail.Articulo = rd.GetValue(9) != DBNull.Value ? rd.GetValue(9).ToString() : null;
                        eFileDetail.Ingreso = rd.GetValue(10) != DBNull.Value ? rd.GetValue(10).ToString() : null;
                        eFileDetail.Salida = rd.GetValue(11) != DBNull.Value ? rd.GetValue(11).ToString() : null;
                        eFileDetail.Saldoacumulado = rd.GetValue(12) != DBNull.Value ? rd.GetValue(12).ToString() : null;
                        eFileListDetail.Add(eFileDetail);
                    }
                    rd.Close();
                    conn.Close();
                    cmd.Dispose();
                    return eFileListDetail;
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.ToString());
            }
        }
    }
    }
