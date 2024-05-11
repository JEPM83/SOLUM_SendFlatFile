using System;
using System.Collections.Generic;
using System.Text;

namespace SolumInfraestructure.Domain.Entities
{
    public class eParametros
    {
        private int _code;
        private string _hostgroupid;
        private string _sociedad;
        private string _cliente;
        private string _proceso;
        private int _tipo;
        private int? _hora;
        private int? _minuto;
        private bool? _lunes;
        private bool? _martes;
        private bool? _miercoles;
        private bool? _jueves;
        private bool? _viernes;
        private bool? _sabado;
        private bool? _domingo;
        private int? _modalidad;
        private int? _titulo;
        private int? _datos;
        private string? _fechainicio;
        private string? _fechafin;
        private int _modo;
        private bool _ejecutar;
        private DateTime? _ultimoproceso;
        private string? _mensaje;
        private string? _usuario;
        public int code{ get => _code; set => _code= value; }
        public string hostgroupid { get => _hostgroupid; set => _hostgroupid = value; }
        public string sociedad { get => _sociedad; set => _sociedad = value; }
        public string cliente { get => _cliente; set => _cliente = value; }
        public string proceso { get => _proceso; set => _proceso = value; }
        public int tipo { get => _tipo; set => _tipo = value; }
        public int? hora { get => _hora; set => _hora = value; }
        public int? minuto { get => _minuto; set => _minuto = value; }
        public bool? lunes { get => _lunes; set => _lunes = value; }
        public bool? martes { get => _martes; set => _martes = value; }
        public bool? miercoles { get => _miercoles; set => _miercoles = value; }
        public bool? jueves { get => _jueves; set => _jueves = value; }
        public bool? viernes { get => _viernes; set => _viernes = value; }
        public bool? sabado { get => _sabado; set => _sabado = value; }
        public bool? domingo { get => _domingo; set => _domingo = value; }
        public int? modalidad { get => _modalidad; set => _modalidad = value; }
        public int? titulo { get => _titulo; set => _titulo = value; }
        public int? datos { get => _datos; set => _datos = value; }
        public string? fechainicio { get => _fechainicio; set => _fechainicio = value; }
        public string? fechafin { get => _fechafin; set => _fechafin= value; }
        public int modo { get => _modo; set => _modo = value; }
        public bool ejecutar { get => _ejecutar; set => _ejecutar = value;}
        public DateTime? ultimoproceso { get => _ultimoproceso; set  => _ultimoproceso = value;}
        public string? mensaje { get => _mensaje; set => _mensaje = value; }
        public string? usuario { get => _usuario; set => _usuario = value; }
    }
}
