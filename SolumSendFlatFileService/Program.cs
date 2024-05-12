using System;
using SolumInfraestructure.Service;
using SolumInfraestructure.Domain.Entities;

namespace SolumSendFlatFileService
{
    public class Program
    {
        public void Servicio() {
            Console.WriteLine("Iniciando servicio de actualización de archivos en SAP");
            SendFlatFileService obj = new SendFlatFileService();
            try
            {
                obj.ejecucion();
            }
            catch (Exception ex)
            {
                obj = null;
                throw new Exception(ex.Message);
            }
        }
        static void Main(string[] args)
        {
           
        }


    }
}
