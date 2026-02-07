# DTO Dashboard | Digital Transformation Office

A comprehensive, self-contained interactive dashboard for managing and orchestrating a Digital Transformation Office (DTO). Built as a single-page application with modern web technologies, featuring multi-level page navigation, AI Agent orchestration, and LLM integration points.

## Features

### Multi-Level SPA Architecture (v3.0)
- **Left Sidebar Navigation** — Collapsible sidebar with 7 main sections
- **Hash-based Routing** — Deep-linkable URLs (`#/projects/3`, `#/agents/agent-001`)
- **Breadcrumb Navigation** — Context-aware path display
- **Responsive Design** — Sidebar auto-collapses on mobile

### Core Dashboard
- **7 Major Transformation Projects** tracking 53+ action items
- **4 KPI Cards** — Total items, completion rate, at-risk count, active projects
- **4 Interactive Charts** — Project progress, status distribution, workload, monthly trends
- **Full-Year Gantt Timeline** — 12-month view with color-coded status bars
- **Team Workload Analysis** — Per-owner completion breakdown
- **Drill-Down Detail Pages** — Project → Action Item → Edit

### AI Agent Control Center
Inspired by [Mission Control](https://x.com/pbteja1998/status/2017662163540971756), [Nebula.gg](https://www.nebula.gg/), and [CrewAI](https://www.crewai.com/):

- **Squad Overview** — 6 agent cards with status indicators, global stats, quick actions
- **Agent Detail Pages** — Full CRUD with task queues, performance metrics, activity history
- **Workflow Management** — Visual flow diagrams (Trigger → Agent → Action → Output)
- **Global Activity Log** — Filterable timeline across all agents
- **LLM Integration Points** — Per-agent and global LLM configuration:
  - OpenAI API / Anthropic Claude API
  - Ollama / vLLM local model deployment
  - CrewAI / LangGraph / OpenAI Swarm orchestration frameworks

#### The 6 Agents
| Agent | Role | Autonomy |
|-------|------|----------|
| 🎯 Jarvis | Lead Orchestrator | Lead |
| 📊 Analyst | Data & KPI Specialist | Specialist |
| 📋 Tracker | PM & Deadline Monitor | Specialist |
| 🔔 Sentinel | Risk Detection | Specialist |
| 📝 Scribe | Documentation & Reports | Intern |
| 🔗 Connector | Integration & Data Sync | Specialist |

### Theme System
- ☀️ Light Mode / 🌙 Dark Mode / ⚙️ System (auto-detect OS preference)
- CSS custom properties with smooth transitions
- `prefers-color-scheme` media query listener
- Preference saved to localStorage

### Data Management
- **Edit Panel** — Slide-out editor with ESC/overlay close, correct data-id indexing
- **JSON Export/Import** — Full data persistence including agent configs
- **CSV Export** — Compatible with Excel and other tools
- **localStorage** — Theme and state persistence

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/glen200392/dto-dashboard.git
```

2. Open `index.html` in any modern browser:
```bash
open index.html
# or
xdg-open index.html  # Linux
start index.html      # Windows
```

No server, no dependencies, no build step required.

## Route Structure

```
#/                          → Command Center (Overview)
#/projects                  → Project List (card/table toggle)
#/projects/:id              → Project Detail (actions, timeline, team tabs)
#/projects/:id/actions/:aid → Action Item Detail
#/timeline                  → Full-Year Gantt Chart
#/agents                    → Agent Squad Overview
#/agents/:id                → Agent Detail (config, tasks, metrics, history)
#/agents/workflows          → Workflow Management
#/agents/activity           → Global Activity Log
#/team                      → Team Workload Overview
#/team/:name                → Individual Member Detail
#/actions                   → All Action Items Table
#/settings                  → Theme, LLM Config, Import/Export
```

## Architecture

```
dto-dashboard/
├── index.html          # Complete self-contained SPA (4600+ lines)
├── README.md           # This file
├── ARCHITECTURE.md     # Technical architecture documentation
├── CHANGELOG.md        # Version history
├── LICENSE             # MIT License
└── docs/
    ├── PM_GUIDE.md     # PM maintenance guide (中文)
    └── AI_AGENTS.md    # AI Agent & LLM integration documentation
```

## Technology Stack

- **HTML5** — Semantic markup with SPA structure
- **CSS3** — Custom properties, Grid, Flexbox, animations, responsive breakpoints
- **JavaScript (ES6+)** — Vanilla JS with hash-based SPA router
- **Chart.js 4.4.0** — Interactive charts (CDN)
- **Zero Dependencies** — No framework, no build tools, no server

## Update Workflow (for PMs)

1. Navigate to **#/projects** or **#/actions**
2. Click any action item to drill down to detail
3. Click **Edit** to open the slide-out panel
4. Update status, progress, timeline, notes
5. All charts and KPIs update automatically
6. Go to **#/settings** → **Export JSON** to save your data

See [docs/PM_GUIDE.md](docs/PM_GUIDE.md) for detailed instructions.

## Future Roadmap

### Phase 1 — Current (v3.0)
- [x] Multi-level SPA with sidebar navigation
- [x] Hash-based routing with breadcrumbs
- [x] AI Agent Control Center with full CRUD
- [x] LLM configuration UI (global + per-agent)
- [x] Workflow visual designer
- [x] Dark/Light/System themes
- [x] JSON/CSV data management

### Phase 2 — Planned
- [ ] Google Sheets API integration for cloud sync
- [ ] WebSocket-based real-time collaboration
- [ ] Email/Teams notification integration
- [ ] Automated risk alerts (deadline - 7 days)

### Phase 3 — Vision
- [ ] LLM-powered agent actions (via OpenAI/Claude/Ollama API)
- [ ] CrewAI/LangGraph backend orchestration
- [ ] Jira/Asana two-way sync
- [ ] Power BI embedded analytics
- [ ] Mobile PWA support

## Inspired By

- [Mission Control by pbteja1998](https://x.com/pbteja1998/status/2017662163540971756) — Multi-agent orchestration concept
- [Nebula.gg](https://www.nebula.gg/) — No-code AI workforce builder
- [CrewAI](https://www.crewai.com/) — Role-based agent teams
- [OpenAI Swarm](https://github.com/openai/swarm) — Multi-agent framework

## License

MIT License — See [LICENSE](LICENSE) for details.

## Author

Built for Digital Transformation Office (DTO) management.
