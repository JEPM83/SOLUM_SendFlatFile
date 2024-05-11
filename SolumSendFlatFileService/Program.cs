using System;
using SolumInfraestructure.Service;
using SolumInfraestructure.Domain.Entities;

namespace SolumKardexService
{
    public class Program
    {
        public void Servicio() {
            Console.WriteLine("Iniciando servicio de kardex");
            KardexService obj = new KardexService();
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
