# 致伸集團 數位轉型儀表板 | Primax DTO Dashboard

A comprehensive, self-contained interactive dashboard for managing and orchestrating the Digital Transformation Office (DTO) of Primax Group (致伸集團). Built with modern web technologies, featuring AI Agent orchestration capabilities inspired by Mission Control and Nebula.gg.

## Features

### Core Dashboard
- **7 Major Transformation Projects** tracking 53+ action items
- **6 KPI Cards** with real-time metrics
- **4 Interactive Charts** (project progress, status distribution, workload, trends)
- **Gantt Timeline** for full-year visualization
- **Owner Workload Analysis** with stacked bar charts
- **Dependency Map** showing inter-project relationships

### AI Agent Orchestrator (Mission Control)
Inspired by [pbteja1998's Mission Control](https://x.com/pbteja1998/status/2017662163540971756) and [Nebula.gg](https://www.nebula.gg/):

- **6 AI Agents** with specialized roles:
  - 🎯 Jarvis — Lead Orchestrator
  - 📊 Analyst — Data & KPI Specialist
  - 📋 Tracker — PM & Deadline Monitor
  - 🔔 Sentinel — Risk Detection
  - 📝 Scribe — Documentation & Reports
  - 🔗 Connector — Integration & Data Sync
- **Activity Feed** — Real-time agent action log
- **Workflow Templates** — Pre-built automation workflows
- **Autonomy Levels** — Intern / Specialist / Lead

### Theme System
- ☀️ Light Mode
- 🌙 Dark Mode
- ⚙️ System (auto-detect OS preference)
- Smooth transitions with CSS custom properties
- Preference saved to localStorage

### PM Smart Maintenance
- **Edit Mode** — Click to update any action item's status, progress, timeline, notes
- **JSON Export/Import** — Full data persistence and version control
- **CSV Export** — Compatible with Excel and other tools
- **Data Reset** — Return to original baseline

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

## Architecture

```
dto-dashboard/
├── index.html          # Complete self-contained dashboard
├── README.md           # This file
├── ARCHITECTURE.md     # Technical architecture documentation
├── CHANGELOG.md        # Version history
├── LICENSE             # MIT License
└── docs/
    ├── PM_GUIDE.md     # PM maintenance guide (中文)
    └── AI_AGENTS.md    # AI Agent orchestrator documentation
```

## Technology Stack

- **HTML5** — Semantic markup
- **CSS3** — Custom properties, Grid, Flexbox, animations
- **JavaScript (ES6+)** — Vanilla JS, no framework dependencies
- **Chart.js 4.5.1** — Interactive charts (CDN)
- **Responsive Design** — Mobile, tablet, desktop support

## Data Structure

All data is embedded as JavaScript objects and can be exported/imported as JSON:

```json
{
  "version": "2.0",
  "exported": "2026-02-07T...",
  "items": [
    {
      "project_id": 1,
      "action": "定義DTO的角色、組織R&R",
      "unit": "HR",
      "owner": "Vicky",
      "status": "in_progress",
      "progress": 60,
      "start_month": 1,
      "end_month": 2,
      "notes": "Q1 priority"
    }
  ],
  "agents": [...]
}
```

## Update Workflow (for PMs)

1. Open dashboard → Click **✏️ 編輯模式**
2. Navigate to **📝 全部Action Items** tab
3. Click **編輯** on any row to update status/progress
4. All charts and KPIs update automatically
5. Click **📤 匯出 JSON** to save your data
6. Name file with date: `dto_2026-02-07.json`

See [docs/PM_GUIDE.md](docs/PM_GUIDE.md) for detailed instructions.

## Future Roadmap

### Phase 1 — Current (v2.0)
- [x] Self-contained HTML dashboard
- [x] Dark/Light/System themes
- [x] AI Agent orchestrator UI
- [x] JSON/CSV data management

### Phase 2 — Planned
- [ ] Google Sheets API integration for cloud sync
- [ ] WebSocket-based real-time collaboration
- [ ] Email/Teams notification integration
- [ ] Automated risk alerts (deadline - 7 days)

### Phase 3 — Vision
- [ ] LLM-powered agent actions (via OpenAI/Claude API)
- [ ] CrewAI/LangGraph backend integration
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

Built for 致伸集團 Digital Transformation Office (DTO)
