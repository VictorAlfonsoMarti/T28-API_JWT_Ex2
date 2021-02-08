using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace T28_API_JWT_Ex2.Models
{
    public partial class AsignadoA
    {
        public string Cientifico { get; set; }
        public string Proyecto { get; set; }

        public virtual Cientificos CientificoNavigation { get; set; }
        public virtual Proyecto ProyectoNavigation { get; set; }
    }
}
