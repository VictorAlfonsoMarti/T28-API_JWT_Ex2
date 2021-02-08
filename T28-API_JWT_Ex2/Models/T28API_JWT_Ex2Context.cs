using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace T28_API_JWT_Ex2.Models
{
    public partial class T28API_JWT_Ex2Context : DbContext
    {

        public T28API_JWT_Ex2Context(DbContextOptions<T28API_JWT_Ex2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<AsignadoA> AsignadoA { get; set; }
        public virtual DbSet<Cientificos> Cientificos { get; set; }
        public virtual DbSet<Proyecto> Proyecto { get; set; }
        public virtual DbSet<UserInfo> UserInfo { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AsignadoA>(entity =>
            {
                entity.HasKey(e => new { e.Cientifico, e.Proyecto });

                entity.ToTable("Asignado_a");

                entity.Property(e => e.Cientifico)
                    .HasMaxLength(8)
                    .IsUnicode(false);

                entity.Property(e => e.Proyecto)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.HasOne(d => d.CientificoNavigation)
                    .WithMany(p => p.AsignadoA)
                    .HasForeignKey(d => d.Cientifico)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Asignado___Cient__3A81B327");

                entity.HasOne(d => d.ProyectoNavigation)
                    .WithMany(p => p.AsignadoA)
                    .HasForeignKey(d => d.Proyecto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Asignado___Proye__3B75D760");
            });

            modelBuilder.Entity<Cientificos>(entity =>
            {
                entity.HasKey(e => e.Dni)
                    .HasName("PK__Cientifi__C035B8DCEFEFE842");

                entity.Property(e => e.Dni)
                    .HasColumnName("DNI")
                    .HasMaxLength(8)
                    .IsUnicode(false);

                entity.Property(e => e.NomApels).HasMaxLength(255);
            });

            modelBuilder.Entity<Proyecto>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.Nombre).HasMaxLength(255);
            });

            modelBuilder.Entity<UserInfo>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK__UserInfo__1788CC4C6A030314");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
