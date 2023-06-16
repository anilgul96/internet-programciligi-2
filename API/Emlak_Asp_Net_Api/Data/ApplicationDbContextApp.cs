using Emlak_Asp_Net_Api.Models;
using Microsoft.EntityFrameworkCore;

namespace Emlak_Asp_Net_Api.Data
{
    public class ApplicationDbContextApp : DbContext
    {
        public virtual DbSet<ilanlar> ilanlar { get; set; }
        public virtual DbSet<kategoriler> kategoriler { get; set; }
        public virtual DbSet<kategori_ara> kategori_ara { get; set; }
        public virtual DbSet<kullanicilar> Kullanicilar { get; set; }

        public ApplicationDbContextApp(DbContextOptions<ApplicationDbContextApp> options) : base(options) { }
    }
}
