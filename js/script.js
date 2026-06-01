/* ═══════════════════════════════════════
   SAMIR ADHIKARI — PORTFOLIO SCRIPT
   script.js — All interactivity
   ═══════════════════════════════════════ */

(function () {
  'use strict';

  /* ── CUSTOM CURSOR ──────────────────────── */
  const dot  = document.getElementById('cursor-dot');
  const ring = document.getElementById('cursor-ring');
  let mx = 0, my = 0, rx = 0, ry = 0;
  let cursorVisible = false;

  document.addEventListener('mousemove', (e) => {
    mx = e.clientX;
    my = e.clientY;
    if (!cursorVisible) {
      dot.style.opacity = '1';
      ring.style.opacity = '1';
      cursorVisible = true;
    }
  });

  document.addEventListener('mouseleave', () => {
    dot.style.opacity = '0';
    ring.style.opacity = '0';
    cursorVisible = false;
  });

  // Smooth ring lag
  (function animateCursor() {
    rx += (mx - rx) * 0.13;
    ry += (my - ry) * 0.13;
    if (dot) {
      dot.style.left = mx + 'px';
      dot.style.top  = my + 'px';
    }
    if (ring) {
      ring.style.left = rx + 'px';
      ring.style.top  = ry + 'px';
    }
    requestAnimationFrame(animateCursor);
  })();

  // Hover enlarge
  document.querySelectorAll('a, button, .pcard, .skill-card, .pill').forEach(el => {
    el.addEventListener('mouseenter', () => document.body.classList.add('cursor-hover'));
    el.addEventListener('mouseleave', () => document.body.classList.remove('cursor-hover'));
  });


  /* ── NAV: SCROLL BEHAVIOUR ───────────────── */
  const navbar     = document.getElementById('navbar');
  const scrollBtn  = document.getElementById('scrollTop');

  window.addEventListener('scroll', () => {
    const y = window.scrollY;
    // Sticky blur
    navbar.classList.toggle('scrolled', y > 50);
    // Scroll-to-top visibility
    scrollBtn.classList.toggle('visible', y > 450);
  }, { passive: true });

  // Scroll to top
  scrollBtn.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });


  /* ── ACTIVE NAV LINK ON SCROLL ───────────── */
  const sections = document.querySelectorAll('section[id]');
  const navLinks  = document.querySelectorAll('.nav-links a');

  const sectionObs = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const id = entry.target.id;
        navLinks.forEach(a => {
          a.classList.toggle('active', a.getAttribute('href') === `#${id}`);
        });
      }
    });
  }, { rootMargin: '-45% 0px -50% 0px' });

  sections.forEach(s => sectionObs.observe(s));


  /* ── HERO INSTANT ANIMATIONS ─────────────── */
  window.addEventListener('DOMContentLoaded', () => {
    // Trigger all reveal-instant elements
    requestAnimationFrame(() => {
      document.querySelectorAll('.reveal-instant').forEach(el => {
        el.classList.add('go');
      });
    });
  });


  /* ── SCROLL REVEAL ───────────────────────── */
  const revealObs = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        revealObs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.reveal').forEach(el => revealObs.observe(el));


  /* ── SKILL BAR ANIMATION ──────────────────── */
  const barObs = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const fill = entry.target;
        const width = fill.dataset.w;
        // slight delay for cinematic effect
        setTimeout(() => { fill.style.width = width + '%'; }, 200);
        barObs.unobserve(fill);
      }
    });
  }, { threshold: 0.3 });

  document.querySelectorAll('.br-fill').forEach(b => barObs.observe(b));


  /* ── MOBILE MENU ─────────────────────────── */
  const hamburger  = document.getElementById('hamburger');
  const mobileMenu = document.getElementById('mobileMenu');
  let menuOpen = false;

  hamburger.addEventListener('click', () => {
    menuOpen = !menuOpen;
    mobileMenu.classList.toggle('open', menuOpen);
    // Animate hamburger lines
    const spans = hamburger.querySelectorAll('span');
    if (menuOpen) {
      spans[0].style.transform = 'translateY(7px) rotate(45deg)';
      spans[1].style.opacity   = '0';
      spans[2].style.transform = 'translateY(-7px) rotate(-45deg)';
    } else {
      spans[0].style.transform = '';
      spans[1].style.opacity   = '';
      spans[2].style.transform = '';
    }
  });

  // Close on link click
  document.querySelectorAll('.mob-link').forEach(link => {
    link.addEventListener('click', () => {
      menuOpen = false;
      mobileMenu.classList.remove('open');
      hamburger.querySelectorAll('span').forEach(s => {
        s.style.transform = '';
        s.style.opacity   = '';
      });
    });
  });

  // Close on outside click
  document.addEventListener('click', (e) => {
    if (menuOpen && !mobileMenu.contains(e.target) && !hamburger.contains(e.target)) {
      menuOpen = false;
      mobileMenu.classList.remove('open');
      hamburger.querySelectorAll('span').forEach(s => {
        s.style.transform = '';
        s.style.opacity   = '';
      });
    }
  });


  /* ── CONTACT FORM HANDLER ────────────────── */
  const submitBtn = document.getElementById('cfSubmit');
  const btnText   = document.getElementById('cfBtnText');

  if (submitBtn) {
    submitBtn.addEventListener('click', (e) => {
      e.preventDefault();
      const name    = document.getElementById('cf-name')?.value.trim();
      const email   = document.getElementById('cf-email')?.value.trim();
      const message = document.getElementById('cf-message')?.value.trim();

      if (!name || !email || !message) {
        // Shake animation
        submitBtn.style.animation = 'shake 0.4s ease';
        submitBtn.style.background = '#ef4444';
        btnText.textContent = 'Fill all fields';
        setTimeout(() => {
          submitBtn.style.animation = '';
          submitBtn.style.background = '';
          btnText.textContent = 'Send Message';
        }, 2000);
        return;
      }

      // Success state
      submitBtn.disabled = true;
      submitBtn.style.background = '#4ade80';
      btnText.textContent = 'Message Sent ✓';
      submitBtn.querySelector('svg').style.display = 'none';

      setTimeout(() => {
        submitBtn.disabled = false;
        submitBtn.style.background = '';
        btnText.textContent = 'Send Message';
        submitBtn.querySelector('svg').style.display = '';
        // Clear fields
        ['cf-name','cf-email','cf-subject','cf-message'].forEach(id => {
          const el = document.getElementById(id);
          if (el) el.value = '';
        });
      }, 3500);
    });
  }

  // Shake keyframe (injected)
  const style = document.createElement('style');
  style.textContent = `
    @keyframes shake {
      0%,100% { transform: translateX(0); }
      20%      { transform: translateX(-6px); }
      40%      { transform: translateX(6px); }
      60%      { transform: translateX(-4px); }
      80%      { transform: translateX(4px); }
    }
  `;
  document.head.appendChild(style);


  
  /* ── INLINE EXPAND PANELS ───────────────── */
  window.toggleExpand = function(id) {
    const panel = document.getElementById(id);
    const isOpen = panel.classList.contains('open');
    document.querySelectorAll('.expand-panel').forEach(p => p.classList.remove('open'));
    document.querySelectorAll('.inline-expand-btn').forEach(b => b.setAttribute('aria-expanded','false'));
    if (!isOpen) {
      panel.classList.add('open');
      document.querySelectorAll('.inline-expand-btn').forEach(b => {
        if (b.getAttribute('onclick') && b.getAttribute('onclick').includes(id)) {
          b.setAttribute('aria-expanded','true');
        }
      });
      setTimeout(() => panel.scrollIntoView({ behavior:'smooth', block:'nearest' }), 150);
    }
  };

  /* ── SMOOTH SECTION SCROLL ON NAV CLICK ───── */
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth' });
      }
    });
  });


  /* ── TYPEWRITER for hero subtitle (optional) */
  // Subtle text swap on hero badge to show different states
  const badge = document.querySelector('.hero-badge');
  if (badge) {
    const states = [
      '● Available for opportunities · Kyoto, Japan',
      '● AI Engineer · KCGI Master\'s Student',
      '● Building Multi-Agent Systems',
      '● Nepal → Kyoto → The World',
    ];
    let stateIdx = 0;
    setInterval(() => {
      stateIdx = (stateIdx + 1) % states.length;
      badge.style.opacity = '0';
      setTimeout(() => {
        badge.lastChild.textContent = states[stateIdx];
        badge.style.opacity = '1';
      }, 300);
    }, 3500);
    badge.style.transition = 'opacity 0.3s ease';
  }

})();
