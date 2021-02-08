using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace T28_API_JWT_Ex2.Models
{
    public partial class Proyecto
    {
        public Proyecto()
        {
            AsignadoA = new HashSet<AsignadoA>();
        }

        public string Id { get; set; }
        public string Nombre { get; set; }
        public int? Horas { get; set; }

        public virtual ICollection<AsignadoA> AsignadoA { get; set; }
    }
}
