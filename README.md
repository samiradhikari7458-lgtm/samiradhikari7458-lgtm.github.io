# Samir Adhikari — Portfolio Website

**🌐 Live URL:** [https://samiradhikari7458-lgtm.github.io](https://samiradhikari7458-lgtm.github.io)

**GitHub:** [github.com/samiradhikari7458-lgtm](https://github.com/samiradhikari7458-lgtm)

> Premium responsive portfolio — AI Engineer & Master's student at KCGI, Kyoto, Japan.

---

## 🗂 Repository Structure

```
samiradhikari7458-lgtm.github.io/
├── index.html              ← Main page (all sections)
├── css/
│   └── style.css           ← Full stylesheet (tokens, layout, components)
├── js/
│   └── script.js           ← All interactivity
├── images/
│   └── samir.jpg           ← Profile photo
└── README.md               ← This file
```

---

## ✨ Features

| Feature | Detail |
|---|---|
| Custom cursor | Smooth lag ring, enlarges on hover |
| Scroll reveal | All sections animate in on scroll |
| Active nav links | Highlights current section while scrolling |
| Animated skill bars | Trigger when entering viewport |
| Rotating hero badge | Cycles 4 status messages every 3.5s |
| Mobile hamburger menu | Smooth slide-in, closes on link click |
| Contact form | Validation + success/error feedback |
| Marquee strip | Scrolling skills ticker |
| Scroll-to-top button | Appears after 450px scroll |
| Sticky blur navbar | Glass effect on scroll |
| Grain texture | Subtle noise overlay for depth |
| Responsive | All breakpoints: desktop, tablet, mobile |

---

## 🏗 Website Build Process

This section documents how the portfolio was designed and built — useful for the thesis project and for demonstrating technical capability.

### Phase 1 — Architecture Planning

The site follows a strict **Separation of Concerns** pattern:
- `index.html` — structure only (semantic HTML5, no inline styles)
- `css/style.css` — all visual design (CSS variables, Grid, animations)
- `js/script.js` — all interactivity (scroll, cursor, form, reveals)

Design decisions made upfront:
- **Dark luxury theme** — navy `#080b10` background, teal `#2dd4bf` accent, amber `#f59e0b` highlight
- **Typography** — Playfair Display (display serif) + Outfit (UI sans) + Fira Code (mono)
- **Layout** — CSS Grid for all major sections, Flexbox for components
- **No frameworks** — pure HTML/CSS/JS, zero build step, GitHub Pages compatible

### Phase 2 — HTML Structure

Semantic sections in order:
```
<nav>          — Fixed navigation with blur on scroll
<section#hero> — Full-viewport hero with grid lines + orbs
.marquee-strip — Scrolling skills ticker
<section#about>     — Two-column: portrait + bio text
<section#projects>  — Featured card + 3-column grid
<section#skills>    — Skill cards + animated bars + languages
<section#education> — Timeline with current/past entries
<section#contact>   — Split layout: info + contact form
<footer>       — Links, branding, credit
#scrollTop     — Fixed button, appears on scroll
```

### Phase 3 — CSS System

CSS custom properties (variables) defined in `:root` for full theming control:
```css
--bg, --surface, --surface2     /* Background layers */
--teal, --teal-dim, --teal-glow /* Primary accent */
--amber, --amber-dim            /* Secondary accent */
--cream, --muted, --muted2      /* Typography */
--font-display, --font-ui, --font-mono
--ease                          /* Cubic-bezier animation curve */
```

Key CSS techniques used:
- `CSS Grid` — about, projects, skills, contact layouts
- `CSS custom properties` — full theme in one place
- `@keyframes` — fadeUp, pulse, marqueeScroll, shake
- `IntersectionObserver` (in JS) — triggers `.visible` class for reveal animations
- `backdrop-filter: blur()` — glass nav + scroll-to-top button
- `clip-path` / `mask-image` — hero grid fade
- `transition` on all interactive elements
- `clamp()` — fluid typography that scales with viewport

### Phase 4 — JavaScript Interactions

All JS is wrapped in an IIFE `(function(){ 'use strict'; })()` for scope safety.

Modules implemented:
```
1. Custom cursor       — requestAnimationFrame loop, lag ring, hover enlarge
2. Nav scroll          — classList.toggle('scrolled') on window.scroll
3. Active nav links    — IntersectionObserver on all section[id]
4. Hero animations     — .reveal-instant elements get .go class on DOMContentLoaded
5. Scroll reveal       — IntersectionObserver adds .visible to .reveal elements
6. Skill bar animation — IntersectionObserver triggers width transition on .br-fill
7. Mobile menu         — hamburger toggle + outside-click close
8. Contact form        — validation + success/error states + field clear
9. Smooth scroll       — all anchor[href^="#"] use scrollIntoView
10. Hero badge rotator  — setInterval cycles 4 status messages with fade
```

### Phase 5 — Deployment

Deployed via **GitHub Pages** — free static hosting directly from the repository.

Git workflow for updates:
```bash
git add .
git commit -m "describe your change"
git push origin main
# Site updates automatically within ~60 seconds
```

---

## 🛠 Technology Stack

| Layer | Technology |
|---|---|
| Structure | HTML5 (semantic) |
| Styling | CSS3 (Grid, Variables, Animations, clamp) |
| Interaction | Vanilla JavaScript ES6+ (IIFE, IntersectionObserver, rAF) |
| Fonts | Google Fonts — Playfair Display, Outfit, Fira Code |
| Hosting | GitHub Pages (free) |
| Version Control | Git + GitHub |
| Images | JPEG (optimised, 600×800px portrait) |

---

## 📌 Projects Featured

| # | Project | Status | Stack |
|---|---|---|---|
| 01 | **Manifest Agent** | ✅ Completed | Python, LangChain, Claude API |
| 02 | **CorpMind AI** | 🔄 Active | Claude API, Python, Streamlit |
| 03 | **Civic Complaint Platform** | 🔄 Active | React, Node.js, PostgreSQL |
| 04 | **Bureaucracy Navigator** | 🔄 Active · Thesis | LangGraph, Claude API, Chroma, FastAPI |

---

## ✏️ How to Edit

| What to change | Where |
|---|---|
| Personal info, section text | `index.html` |
| Colors, fonts, spacing | `css/style.css` — edit `:root` variables |
| Animations, form logic | `js/script.js` |
| Profile photo | Replace `images/samir.jpg` |
| Project links | Find `href="#"` in project cards in `index.html` |

---

## 👤 About

**Samir Adhikari** · `M26W0842`
Master's student at KCGI (Kyoto College of Graduate Studies for Informatics)
AI Concentration · Kyoto, Japan

📧 samiradhikari654@gmail.com
🐙 [github.com/samiradhikari7458-lgtm](https://github.com/samiradhikari7458-lgtm)

---

*Built 2026 · Kyoto, Japan · Pure HTML/CSS/JS · Zero dependencies*
