#!/bin/bash
# Run this from inside your portfolio-website folder
# cd ~/Documents/portfolio-website && bash patch_portfolio.sh

echo "=== Patching index.html ==="

# Use Python to do the replacement safely
python3 << 'PYEOF'
with open('index.html', 'r') as f:
    html = f.read()

old = '''          <p class="body-text reveal d2">
            I'm Samir Adhikari — a Master's student at <strong>Kyoto College of Graduate Studies for Informatics (KCGI)</strong>, pursuing an AI concentration. My academic journey started with a Bachelor\'s in Social Science, which gave me a unique lens for understanding technology\'s human impact.
          </p>'''

new = '''          <p class="body-text reveal d2">
            I\'m Samir Adhikari — a Master\'s student at <button class="inline-expand-btn" onclick="toggleExpand(\'kcgi-panel\')" aria-expanded="false">Kyoto College of Graduate Studies for Informatics (KCGI) <span class="expand-arrow">▾</span></button>, pursuing an <button class="inline-expand-btn" onclick="toggleExpand(\'ai-panel\')" aria-expanded="false">AI concentration <span class="expand-arrow">▾</span></button>. My academic journey started with a Bachelor\'s in Social Science, which gave me a unique lens for understanding technology\'s human impact.
          </p>

          <!-- KCGI Expandable Panel -->
          <div class="expand-panel" id="kcgi-panel">
            <div class="expand-panel-inner">
              <div class="ep-header">
                <span class="ep-icon">🏛️</span>
                <div>
                  <div class="ep-title">Kyoto College of Graduate Studies for Informatics</div>
                  <div class="ep-sub">KCGI · Established 2004 · Kyoto, Japan</div>
                </div>
                <button class="ep-close" onclick="toggleExpand(\'kcgi-panel\')">✕</button>
              </div>
              <div class="ep-grid">
                <div class="ep-stat"><span class="ep-stat-n">2004</span><span class="ep-stat-l">Established</span></div>
                <div class="ep-stat"><span class="ep-stat-n">1st</span><span class="ep-stat-l">IT Grad School in Japan</span></div>
                <div class="ep-stat"><span class="ep-stat-n">1963</span><span class="ep-stat-l">KCG Founded</span></div>
                <div class="ep-stat"><span class="ep-stat-n">RIT</span><span class="ep-stat-l">US Partnership</span></div>
              </div>
              <p class="ep-text">KCGI was established in <strong>2004</strong> as <strong>Japan\'s first IT professional graduate school</strong>, built on the legacy of Kyoto Computer Gakuin (KCG) — Japan\'s first private computer education institution founded in <strong>1963</strong>. Located near Kyoto Station in Minami Ward, KCGI is approved by Japan\'s Ministry of Education and accredited by JABEE.</p>
              <p class="ep-text">KCGI collaborates globally with the <strong>Rochester Institute of Technology (RIT)</strong> and <strong>MIT</strong>. Its mission is to train highly skilled IT professionals — CIOs and applied technology leaders — combining rigorous computer science with business and management education.</p>
              <div class="ep-tags"><span>Founded 2004</span><span>Ministry Approved</span><span>JABEE Accredited</span><span>RIT Partnership</span><span>MIT Collaboration</span><span>Kyoto Station · Minami Ward</span></div>
            </div>
          </div>

          <!-- AI Concentration Expandable Panel -->
          <div class="expand-panel" id="ai-panel">
            <div class="expand-panel-inner">
              <div class="ep-header">
                <span class="ep-icon">🤖</span>
                <div>
                  <div class="ep-title">AI Concentration</div>
                  <div class="ep-sub">M.S. Information Technology · KCGI</div>
                </div>
                <button class="ep-close" onclick="toggleExpand(\'ai-panel\')">✕</button>
              </div>
              <div class="ep-grid">
                <div class="ep-stat"><span class="ep-stat-n">M.S.</span><span class="ep-stat-l">Degree</span></div>
                <div class="ep-stat"><span class="ep-stat-n">AI</span><span class="ep-stat-l">Concentration</span></div>
                <div class="ep-stat"><span class="ep-stat-n">2yr</span><span class="ep-stat-l">Program</span></div>
                <div class="ep-stat"><span class="ep-stat-n">JP+EN</span><span class="ep-stat-l">Bilingual</span></div>
              </div>
              <p class="ep-text">The <strong>AI Concentration</strong> is a Master of Science in Information Technology program focused on applied artificial intelligence — bridging theoretical foundations with real-world deployment of intelligent systems.</p>
              <div class="ep-course-label">Core Subjects</div>
              <div class="ep-course-grid">
                <div class="ep-course">🧠 Fundamentals of AI</div>
                <div class="ep-course">🐍 Computer Programming (Python)</div>
                <div class="ep-course">📊 Machine Learning</div>
                <div class="ep-course">🔍 Pattern Recognition</div>
                <div class="ep-course">💬 Natural Language Processing</div>
                <div class="ep-course">⚙️ Combinatorial Optimization</div>
                <div class="ep-course">🤖 Multi-Agent Systems</div>
                <div class="ep-course">📐 Applied Information Technology</div>
              </div>
              <div class="ep-tags"><span>LangGraph</span><span>Claude API</span><span>RAG Pipelines</span><span>Vector Databases</span><span>Agentic AI</span></div>
            </div>
          </div>'''

if '<strong>Kyoto College of Graduate Studies for Informatics (KCGI)</strong>' in html:
    html = html.replace(old, new)
    with open('index.html', 'w') as f:
        f.write(html)
    print("✅ index.html patched successfully")
else:
    print("⚠️  Pattern not found — index.html may already be patched or has different formatting")
    print("Searching for KCGI text...")
    import re
    matches = re.findall(r'.{50}KCGI.{50}', html)
    for m in matches[:3]:
        print(" ->", m)
PYEOF

echo ""
echo "=== Patching css/style.css ==="

# Check if already patched
if grep -q "inline-expand-btn" css/style.css; then
    echo "✅ style.css already has expand panel styles"
else
cat >> css/style.css << 'CSSEOF'

/* ════════════════════════════════
   INLINE EXPAND BUTTONS & PANELS
   ════════════════════════════════ */
.inline-expand-btn {
  display: inline-flex; align-items: center; gap: 5px;
  background: var(--teal-dim); color: var(--teal);
  border: 1px solid rgba(45,212,191,0.3);
  padding: 2px 10px 2px 8px; border-radius: 4px;
  font-family: var(--font-ui); font-size: inherit;
  font-weight: 600; cursor: pointer;
  transition: background .2s, border-color .2s, transform .15s;
  vertical-align: baseline; line-height: 1.6;
}
.inline-expand-btn:hover { background: rgba(45,212,191,0.2); border-color: var(--teal); transform: translateY(-1px); }
.inline-expand-btn[aria-expanded="true"] { background: rgba(45,212,191,0.25); border-color: var(--teal); }
.inline-expand-btn[aria-expanded="true"] .expand-arrow { transform: rotate(180deg); }
.expand-arrow { font-size: .75rem; display: inline-block; transition: transform .3s var(--ease); }
.expand-panel { max-height: 0; overflow: hidden; transition: max-height .5s var(--ease), opacity .4s ease, margin .4s ease; opacity: 0; margin: 0; }
.expand-panel.open { max-height: 900px; opacity: 1; margin: 16px 0; }
.expand-panel-inner { background: var(--surface2); border: 1px solid rgba(45,212,191,0.2); border-left: 3px solid var(--teal); padding: 24px 24px 20px; border-radius: 4px; }
.ep-header { display: flex; align-items: flex-start; gap: 14px; margin-bottom: 20px; }
.ep-icon { font-size: 1.6rem; flex-shrink: 0; margin-top: 2px; }
.ep-title { font-family: var(--font-display); font-size: 1.1rem; font-weight: 700; color: var(--cream); line-height: 1.2; }
.ep-sub { font-family: var(--font-mono); font-size: .62rem; letter-spacing: .1em; text-transform: uppercase; color: var(--teal); margin-top: 4px; }
.ep-close { margin-left: auto; background: none; border: none; color: var(--muted); cursor: pointer; font-size: .85rem; padding: 2px 6px; flex-shrink: 0; transition: color .2s; font-family: var(--font-ui); }
.ep-close:hover { color: var(--cream); }
.ep-grid { display: grid; grid-template-columns: repeat(4,1fr); gap: 1px; background: var(--border); margin-bottom: 18px; }
.ep-stat { background: var(--surface); padding: 12px 10px; text-align: center; }
.ep-stat-n { display: block; font-family: var(--font-display); font-size: 1.3rem; font-weight: 700; color: var(--teal); line-height: 1; }
.ep-stat-l { display: block; font-family: var(--font-mono); font-size: .55rem; letter-spacing: .08em; text-transform: uppercase; color: var(--muted); margin-top: 4px; }
.ep-text { font-size: .83rem; color: var(--muted2); line-height: 1.8; margin-bottom: 12px; }
.ep-text strong { color: var(--cream); }
.ep-tags { display: flex; flex-wrap: wrap; gap: 6px; margin-top: 14px; }
.ep-tags span { font-family: var(--font-mono); font-size: .58rem; letter-spacing: .06em; text-transform: uppercase; padding: 4px 10px; border: 1px solid var(--border2); color: var(--muted2); border-radius: var(--r); }
.ep-course-label { font-family: var(--font-mono); font-size: .62rem; letter-spacing: .12em; text-transform: uppercase; color: var(--teal); margin-bottom: 10px; margin-top: 14px; }
.ep-course-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 6px; margin-bottom: 14px; }
.ep-course { font-size: .78rem; color: var(--muted2); padding: 8px 12px; background: var(--surface); border: 1px solid var(--border); border-radius: var(--r); }
@media (max-width: 600px) { .ep-grid { grid-template-columns: repeat(2,1fr); } .ep-course-grid { grid-template-columns: 1fr; } }
CSSEOF
    echo "✅ style.css patched"
fi

echo ""
echo "=== Patching js/script.js ==="

if grep -q "toggleExpand" js/script.js; then
    echo "✅ script.js already has toggleExpand"
else
# Insert before the smooth scroll section
python3 << 'PYEOF'
with open('js/script.js', 'r') as f:
    js = f.read()

insert = '''
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

'''

target = "/* ── SMOOTH SECTION SCROLL ON NAV CLICK"
if target in js:
    js = js.replace(target, insert + "  " + target)
    with open('js/script.js', 'w') as f:
        f.write(js)
    # Sync root script.js
    with open('script.js', 'w') as f:
        f.write(js)
    print("✅ js/script.js patched and synced to script.js")
else:
    # append to end
    js += insert
    with open('js/script.js', 'w') as f:
        f.write(js)
    with open('script.js', 'w') as f:
        f.write(js)
    print("✅ toggleExpand appended to js/script.js")
PYEOF
fi

echo ""
echo "=== All done! Now run: ==="
echo "git add ."
echo 'git commit -m "Add: KCGI and AI concentration expandable panels"'
echo "git push origin main"
