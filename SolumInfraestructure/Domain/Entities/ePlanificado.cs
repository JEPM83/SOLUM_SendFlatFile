using System;
using System.Collections.Generic;
using System.Text;

namespace SolumInfraestructure.Domain.Entities
{
    public class ePlanificado
    {
        public int code { get; set; }
        public string u_ex_cliente { get; set; }
        public string u_ex_ruta { get; set; }
        public int tipo { get; set; }
        public int hora { get; set; }
        public int minute { get; set; }
        public bool lunes { get; set; }
        public bool martes { get; set; }
        public bool miercoles { get; set; }
        public bool jueves { get; set; }
        public bool viernes { get; set; }
        public bool sabado { get; set; }
        public bool domingo { get; set; }
    }
}
