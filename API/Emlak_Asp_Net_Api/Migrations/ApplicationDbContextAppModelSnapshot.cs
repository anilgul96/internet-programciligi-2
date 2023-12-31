﻿// <auto-generated />
using Emlak_Asp_Net_Api.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Emlak_Asp_Net_Api.Migrations
{
    [DbContext(typeof(ApplicationDbContextApp))]
    partial class ApplicationDbContextAppModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.7")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Emlak_Asp_Net_Api.Models.ilanlar", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("ilanAdi")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<int>("ilanCategoryId")
                        .HasColumnType("int");

                    b.Property<string>("ilanDetay")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("ilanFiyati")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("ilanResim")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.HasKey("id");

                    b.ToTable("ilanlar");
                });

            modelBuilder.Entity("Emlak_Asp_Net_Api.Models.kategori_ara", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("ilan_Id")
                        .HasColumnType("int");

                    b.Property<int>("kategori_Id")
                        .HasColumnType("int");

                    b.HasKey("id");

                    b.ToTable("kategori_ara");
                });

            modelBuilder.Entity("Emlak_Asp_Net_Api.Models.kategoriler", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("kategoriAdi")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.HasKey("Id");

                    b.ToTable("kategoriler");
                });

            modelBuilder.Entity("Emlak_Asp_Net_Api.Models.kullanicilar", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("RolId")
                        .HasColumnType("int");

                    b.Property<string>("kullaniciAdi")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("kullanicininAdi")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("sifre")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.HasKey("Id");

                    b.ToTable("Kullanicilar");
                });
#pragma warning restore 612, 618
        }
    }
}
