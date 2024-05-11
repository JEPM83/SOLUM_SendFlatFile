using System;
using System.Collections.Generic;
using System.Text;

namespace SolumInfraestructure.Domain.Entities
{
    public class eKardex
    {
        public string _Fecha;
        public string _TipoDocumento;
        public string _NumeroDocumento;
        public string _NumeroReferencia;
        public string _Referencia;
        public string _CodAlmacen;
        public string _Almacen;
        public string _Linea;
        public string _CodArticulo;
        public string _Articulo;
        public string _Ingreso;
        public string _Salida;
        public string _Saldoacumulado;
        
        public string Fecha { get => _Fecha; set => _Fecha = value; }
        public string TipoDocumento { get => _TipoDocumento; set => _TipoDocumento = value; }
        public string NumeroDocumento { get => _NumeroDocumento; set => _NumeroDocumento = value; }
        public string NumeroReferencia { get => _NumeroReferencia; set => _NumeroReferencia = value; }
        public string Referencia { get => _Referencia; set => _Referencia = value; }
        public string CodAlmacen { get => _CodAlmacen; set => _CodAlmacen = value; }
        public string Almacen { get => _Almacen; set => _Almacen = value; }
        public string Linea { get => _Linea; set => _Linea = value; }
        public string CodArticulo { get => _CodArticulo; set => _CodArticulo = value; }
        public string Articulo { get => _Articulo; set => _Articulo = value; }
        public string Ingreso { get => _Ingreso; set => _Ingreso = value; }
        public string Salida { get => _Salida; set => _Salida = value; }
        public string Saldoacumulado { get => _Saldoacumulado; set => _Saldoacumulado = value; }
    }
}
