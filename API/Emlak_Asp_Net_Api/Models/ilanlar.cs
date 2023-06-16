namespace Emlak_Asp_Net_Api.Models
{
    public class ilanlar
    {
        public int id { get; set; }
        public string ilanAdi { get; set; }
        public string ilanDetay { get; set; }
        public string ilanFiyati { get; set; }
        public string ilanResim { get; set; }
        public int ilanCategoryId { get; set; }
    }
}
