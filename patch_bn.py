with open('index.html', 'r') as f:
    html = f.read()

# Check current state
if 'Active · Thesis' not in html and 'Running · Thesis' in html:
    print("Already updated!")
    exit()

# Step 1: Update status badge
html = html.replace(
    '● Active · Thesis',
    '● Running · Thesis Project'
)

# Step 2: Remove old placeholder links for BN card
html = html.replace(
    '<a href="#" class="pl">Demo ↗</a>\n            <a href="#" class="pl">GitHub ↗</a>\n          </div>\n        </div>\n\n      </div>',
    '<a href="https://github.com/samiradhikari7458-lgtm/bureaucracy-navigator" class="pl" target="_blank">GitHub ↗</a>\n          </div>\n        </div>\n\n      </div>'
)

# Step 3: Add expand button and panel before the pcard-links in BN card
expand_html = '''
          <button class="inline-expand-btn" onclick="toggleExpand('bn-panel')" aria-expanded="false" style="margin-bottom:16px;margin-top:4px">Read More &#9660;</button>
          <div class="expand-panel" id="bn-panel">
            <div class="expand-panel-inner">
              <div class="ep-header">
                <span class="ep-icon">&#129302;</span>
                <div>
                  <div class="ep-title">Bureaucracy Navigator AI</div>
                  <div class="ep-sub">Multi-Agent System · KCGI Thesis · Running</div>
                </div>
                <button class="ep-close" onclick="toggleExpand('bn-panel')">&#x2715;</button>
              </div>
              <div class="ep-grid">
                <div class="ep-stat"><span class="ep-stat-n">4</span><span class="ep-stat-l">AI Agents</span></div>
                <div class="ep-stat"><span class="ep-stat-n">JP</span><span class="ep-stat-l">Focus</span></div>
                <div class="ep-stat"><span class="ep-stat-n">RAG</span><span class="ep-stat-l">Pipeline</span></div>
                <div class="ep-stat"><span class="ep-stat-n">Live</span><span class="ep-stat-l">Running</span></div>
              </div>
              <p class="ep-text">A <strong>citizen-side multi-agent AI system</strong> helping foreign residents in Japan navigate complex bureaucratic processes — starting with address-change workflows as the beachhead use case.</p>
              <p class="ep-text">An <strong>Orchestrator Agent</strong> decomposes user intent and routes to four specialist sub-agents: <strong>Municipal</strong> (city office), <strong>Immigration</strong> (visa, residence card), <strong>Financial</strong> (bank, tax), and <strong>Employment</strong> (pension, insurance) — all over a bilingual JP/EN knowledge graph.</p>
              <div class="ep-course-label">Architecture</div>
              <div class="ep-course-grid">
                <div class="ep-course">&#129504; LangGraph Orchestrator</div>
                <div class="ep-course">&#9889; Claude API (LLM)</div>
                <div class="ep-course">&#128194; ChromaDB Vector Store</div>
                <div class="ep-course">&#127760; FastAPI Backend</div>
                <div class="ep-course">&#127963; Municipal Agent</div>
                <div class="ep-course">&#128706; Immigration Agent</div>
                <div class="ep-course">&#128180; Financial Agent</div>
                <div class="ep-course">&#128188; Employment Agent</div>
              </div>
              <div class="ep-tags">
                <span>LangGraph</span><span>Claude API</span><span>ChromaDB</span>
                <span>FastAPI</span><span>React</span><span>Bilingual JP/EN</span><span>KCGI Thesis</span>
              </div>
              <div style="margin-top:16px;display:flex;gap:12px;flex-wrap:wrap">
                <a href="https://github.com/samiradhikari7458-lgtm/bureaucracy-navigator" target="_blank" class="pf-link-primary" style="font-size:.65rem">View on GitHub &#8599;</a>
                <a href="https://github.com/samiradhikari7458-lgtm/bureaucracy-navigator#readme" target="_blank" class="pf-link-ghost" style="font-size:.65rem">Read README &#8599;</a>
              </div>
            </div>
          </div>
          <div class="pcard-links" style="margin-top:12px">
            <a href="https://github.com/samiradhikari7458-lgtm/bureaucracy-navigator" class="pl" target="_blank">GitHub &#8599;</a>
          </div>
        </div>

      </div>'''

# Insert expand panel before closing of BN card
html = html.replace(
    '          </div>\n        </div>\n\n      </div>\n    </div>\n  </section>\n\n  <!-- ══════════════ SKILLS',
    expand_html + '\n    </div>\n  </section>\n\n  <!-- ══════════════ SKILLS'
)

with open('index.html', 'w') as f:
    f.write(html)

print("Done! Bureaucracy Navigator updated:")
print("  - Status: Running · Thesis Project")
print("  - Read More button added")
print("  - Expandable panel with full architecture")
print("  - GitHub links connected")
