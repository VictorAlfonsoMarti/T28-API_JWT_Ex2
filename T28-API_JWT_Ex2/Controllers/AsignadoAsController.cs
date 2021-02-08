﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using T28_API_JWT_Ex2.Models;
using Microsoft.AspNetCore.Authorization;

namespace T28_API_JWT_Ex2.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AsignadoAsController : ControllerBase
    {
        private readonly T28API_JWT_Ex2Context _context;

        public AsignadoAsController(T28API_JWT_Ex2Context context)
        {
            _context = context;
        }

        // GET: api/AsignadoAs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AsignadoA>>> GetAsignadoA()
        {
            return await _context.AsignadoA.ToListAsync();
        }

        // GET: api/AsignadoAs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AsignadoA>> GetAsignadoA(string id)
        {
            var asignadoA = await _context.AsignadoA.FindAsync(id);

            if (asignadoA == null)
            {
                return NotFound();
            }

            return asignadoA;
        }

        // PUT: api/AsignadoAs/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAsignadoA(string id, AsignadoA asignadoA)
        {
            if (id != asignadoA.Cientifico)
            {
                return BadRequest();
            }

            _context.Entry(asignadoA).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AsignadoAExists(id))
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

        // POST: api/AsignadoAs
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<AsignadoA>> PostAsignadoA(AsignadoA asignadoA)
        {
            _context.AsignadoA.Add(asignadoA);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (AsignadoAExists(asignadoA.Cientifico))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetAsignadoA", new { id = asignadoA.Cientifico }, asignadoA);
        }

        // DELETE: api/AsignadoAs/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<AsignadoA>> DeleteAsignadoA(string id)
        {
            var asignadoA = await _context.AsignadoA.FindAsync(id);
            if (asignadoA == null)
            {
                return NotFound();
            }

            _context.AsignadoA.Remove(asignadoA);
            await _context.SaveChangesAsync();

            return asignadoA;
        }

        private bool AsignadoAExists(string id)
        {
            return _context.AsignadoA.Any(e => e.Cientifico == id);
        }
    }
}
