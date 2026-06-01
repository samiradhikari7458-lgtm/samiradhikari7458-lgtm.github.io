#!/bin/bash
# Run from ~/Documents/portfolio-website
# bash patch_cover.sh

python3 << 'PYEOF'
with open('css/style.css', 'r') as f:
    css = f.read()

# Add canvas + particle styles if not already there
if 'hero-canvas' not in css:
    css += """
/* ════════════════════════════════
   HERO CANVAS BACKGROUND
   ════════════════════════════════ */
#hero-canvas {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  opacity: 0.55;
}
#hero { position: relative; overflow: hidden; }
"""
    with open('css/style.css', 'w') as f:
        f.write(css)
    print("✅ CSS updated")
else:
    print("✅ CSS already has canvas styles")

# Patch index.html — add canvas element inside hero
with open('index.html', 'r') as f:
    html = f.read()

if 'hero-canvas' not in html:
    html = html.replace(
        '<div class="hero-bg-grid"></div>',
        '<canvas id="hero-canvas"></canvas>\n  <div class="hero-bg-grid"></div>'
    )
    with open('index.html', 'w') as f:
        f.write(html)
    print("✅ index.html updated — canvas added to hero")
else:
    print("✅ index.html already has canvas")

# Patch js/script.js — add particle animation
with open('js/script.js', 'r') as f:
    js = f.read()

if 'hero-canvas' not in js:
    particle_code = """
  /* ── HERO CANVAS PARTICLE BACKGROUND ────── */
  (function initCanvas() {
    const canvas = document.getElementById('hero-canvas');
    if (!canvas) return;
    const ctx = canvas.getContext('2d');

    function resize() {
      canvas.width  = canvas.offsetWidth;
      canvas.height = canvas.offsetHeight;
    }
    resize();
    window.addEventListener('resize', resize);

    const PARTICLE_COUNT = 90;
    const TEAL  = '45,212,191';
    const AMBER = '245,158,11';

    const particles = Array.from({ length: PARTICLE_COUNT }, () => ({
      x:    Math.random() * canvas.width,
      y:    Math.random() * canvas.height,
      r:    Math.random() * 1.8 + 0.3,
      vx:   (Math.random() - 0.5) * 0.35,
      vy:   (Math.random() - 0.5) * 0.35,
      color: Math.random() > 0.85 ? AMBER : TEAL,
      alpha: Math.random() * 0.5 + 0.15,
    }));

    // Connection lines between nearby particles
    function drawConnections() {
      for (let i = 0; i < particles.length; i++) {
        for (let j = i + 1; j < particles.length; j++) {
          const dx = particles[i].x - particles[j].x;
          const dy = particles[i].y - particles[j].y;
          const dist = Math.sqrt(dx * dx + dy * dy);
          if (dist < 120) {
            const opacity = (1 - dist / 120) * 0.18;
            ctx.beginPath();
            ctx.moveTo(particles[i].x, particles[i].y);
            ctx.lineTo(particles[j].x, particles[j].y);
            ctx.strokeStyle = `rgba(${particles[i].color},${opacity})`;
            ctx.lineWidth = 0.6;
            ctx.stroke();
          }
        }
      }
    }

    function animate() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      // Draw connections first
      drawConnections();

      // Draw particles
      particles.forEach(p => {
        p.x += p.vx;
        p.y += p.vy;

        // Wrap around edges
        if (p.x < 0) p.x = canvas.width;
        if (p.x > canvas.width) p.x = 0;
        if (p.y < 0) p.y = canvas.height;
        if (p.y > canvas.height) p.y = 0;

        // Glow effect
        const grd = ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, p.r * 4);
        grd.addColorStop(0, `rgba(${p.color},${p.alpha})`);
        grd.addColorStop(1, `rgba(${p.color},0)`);

        ctx.beginPath();
        ctx.arc(p.x, p.y, p.r * 4, 0, Math.PI * 2);
        ctx.fillStyle = grd;
        ctx.fill();

        // Core dot
        ctx.beginPath();
        ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
        ctx.fillStyle = `rgba(${p.color},${p.alpha + 0.3})`;
        ctx.fill();
      });

      requestAnimationFrame(animate);
    }
    animate();
  })();

"""
    # Insert before cursor code
    js = particle_code + js
    with open('js/script.js', 'w') as f:
        f.write(js)
    with open('script.js', 'w') as f:
        f.write(js)
    print("✅ js/script.js updated — particle animation added")
else:
    print("✅ script.js already has canvas animation")

print("")
print("=== All done! Now run: ===")
print("git add .")
print('git commit -m "Add: animated particle canvas background to hero"')
print("git push origin main")
PYEOF
