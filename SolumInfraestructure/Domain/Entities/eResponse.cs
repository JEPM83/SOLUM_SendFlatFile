using System;
using System.Collections.Generic;
using System.Text;

namespace SolumInfraestructure.Domain.Entities
{
    public class eResponse
    {
        public string _Tipo;
        public string _Titulo;
        public string _Mensaje;
        public bool _Notificar;
        public string Tipo { get => _Tipo; set => _Tipo = value; }
        public string Titulo { get => _Titulo; set => _Titulo = value; }
        public string Mensaje { get => _Mensaje; set => _Mensaje = value; }
        public bool Notificar { get => _Notificar; set => _Notificar = value; }

    }
}
