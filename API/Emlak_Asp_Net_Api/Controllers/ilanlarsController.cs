using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Emlak_Asp_Net_Api.Data;
using Emlak_Asp_Net_Api.Models;

namespace Emlak_Asp_Net_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ilanlarsController : ControllerBase
    {
        private readonly ApplicationDbContextApp _context;

        public ilanlarsController(ApplicationDbContextApp context)
        {
            _context = context;
        }

        // GET: api/ilanlars
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ilanlar>>> Getilanlar()
        {
          if (_context.ilanlar == null)
          {
              return NotFound();
          }
            return await _context.ilanlar.ToListAsync();
        }

        // GET: api/ilanlars/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ilanlar>> Getilanlar(int id)
        {
          if (_context.ilanlar == null)
          {
              return NotFound();
          }
            var ilanlar = await _context.ilanlar.FindAsync(id);

            if (ilanlar == null)
            {
                return NotFound();
            }


            return ilanlar;
        }

        // PUT: api/ilanlars/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Putilanlar(int id, ilanlar ilanlar)
        {
            if (id != ilanlar.id)
            {
                return BadRequest();
            }

            _context.Entry(ilanlar).State = EntityState.Modified;

            try
            {
                var ara = _context.kategori_ara.Where(i => i.ilan_Id == id).FirstOrDefault();
                if (ara != null)
                {
                    ara.kategori_Id = id;
                }
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ilanlarExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }



            return NoContent();
        }

        // POST: api/ilanlars
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ilanlar>> Postilanlar(ilanlar ilanlar)
        {
          if (_context.ilanlar == null)
          {
              return Problem("Entity set 'ApplicationDbContextApp.ilanlar'  is null.");
          }
            _context.ilanlar.Add(ilanlar);
            await _context.SaveChangesAsync();



            kategori_ara ara = new kategori_ara();
            ara.ilan_Id = ilanlar.id;
            ara.kategori_Id = ilanlar.ilanCategoryId;
            _context.kategori_ara.Add(ara);
            _context.SaveChanges();

            return CreatedAtAction("Getilanlar", new { id = ilanlar.id }, ilanlar);
        }

        // DELETE: api/ilanlars/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Deleteilanlar(int id)
        {
            if (_context.ilanlar == null)
            {
                return NotFound();
            }
            var ilanlar = await _context.ilanlar.FindAsync(id);
            if (ilanlar == null)
            {
                return NotFound();
            }

            _context.ilanlar.Remove(ilanlar);

            var delete_ara_ = _context.kategori_ara.Where(i => i.ilan_Id == ilanlar.id);
            _context.kategori_ara.RemoveRange(delete_ara_);

            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ilanlarExists(int id)
        {
            return (_context.ilanlar?.Any(e => e.id == id)).GetValueOrDefault();
        }
    }
}
