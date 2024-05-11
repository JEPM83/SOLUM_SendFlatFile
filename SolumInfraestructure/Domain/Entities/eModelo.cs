using System;
using System.Collections.Generic;
using System.Text;

namespace SolumInfraestructure.Domain.Entities
{
    public class eModelo
    {
        public string _Code;
        public string _Name;
        public string _SQL;
        public int? _Columnas;
        public string code { get => _Code; set => _Code = value; }
        public string name { get => _Name; set => _Name = value; }
        public string sql { get => _SQL; set => _SQL = value; }
        public int? columnas { get => _Columnas; set => _Columnas = value; }
    }
}
