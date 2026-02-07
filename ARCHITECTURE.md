# Architecture Documentation

## System Overview

The DTO Dashboard is designed as a **self-contained, offline-first** web application that runs entirely in the browser with no server requirements.

```
┌─────────────────────────────────────────────────────────┐
│                    Browser (Client)                      │
│                                                         │
│  ┌─────────────┐  ┌──────────────┐  ┌───────────────┐  │
│  │  Theme       │  │  Data Layer   │  │  Chart.js     │  │
│  │  Engine      │  │  (JSON Store) │  │  (CDN)        │  │
│  └──────┬──────┘  └──────┬───────┘  └───────┬───────┘  │
│         │                │                   │          │
│  ┌──────┴────────────────┴───────────────────┴───────┐  │
│  │              Rendering Engine                      │  │
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────────┐  │  │
│  │  │Overview│ │Projects│ │Timeline│ │AI Agents   │  │  │
│  │  │ KPIs   │ │ Cards  │ │ Gantt  │ │Orchestrator│  │  │
│  │  └────────┘ └────────┘ └────────┘ └────────────┘  │  │
│  └───────────────────────────────────────────────────┘  │
│                                                         │
│  ┌───────────────────────────────────────────────────┐  │
│  │              Persistence Layer                     │  │
│  │  localStorage (theme) ←→ JSON Export/Import (data) │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

## Component Architecture

### 1. Theme Engine
- CSS Custom Properties (`--bg`, `--card`, `--text`, etc.)
- Three modes: `light`, `dark`, `system`
- `prefers-color-scheme` media query for system detection
- localStorage persistence key: `dto-theme`

### 2. Data Layer
- All project/action data stored as JS arrays
- Agent data stored separately
- Computed properties (KPIs, aggregations) calculated on-demand
- No database — JSON export/import for persistence

### 3. Tab Router
- Hash-based tab switching
- Each tab has dedicated render function
- Charts destroyed and recreated on tab switch to prevent memory leaks

### 4. AI Agent Module
- Agent definitions with role, status, autonomy level
- Activity feed with timestamp-based entries
- Workflow templates as configuration objects
- Future: WebSocket integration for real-time agent communication

## Data Flow

```
User Action → Event Handler → Update DATA Array → renderAll()
                                                    ├── renderKPIs()
                                                    ├── renderCharts()
                                                    ├── renderProjects()
                                                    ├── renderGantt()
                                                    ├── renderOwners()
                                                    ├── renderDetailTable()
                                                    ├── renderAgents()
                                                    └── renderDependencies()
```

## Theme Architecture

```css
[data-theme="light"] {
  --bg: #f0f2f5;
  --card: #ffffff;
  --text: #1a202c;
  /* ... */
}

[data-theme="dark"] {
  --bg: #0f172a;
  --card: #1e293b;
  --text: #f1f5f9;
  /* ... */
}
```

## AI Agent Design Pattern

Inspired by Mission Control's multi-agent architecture:

```
Jarvis (Lead) ─── coordinates ───► All Agents
    │
    ├── Analyst ── monitors ──► KPIs, Data Quality
    ├── Tracker ── watches ───► Deadlines, Progress
    ├── Sentinel ─ detects ───► Risks, Anomalies
    ├── Scribe ─── generates ─► Reports, Docs
    └── Connector ─ syncs ────► APIs, External Systems
```

### Autonomy Levels
- **Intern**: Requires approval for all actions
- **Specialist**: Acts independently within assigned domain
- **Lead**: Full autonomy, can delegate to other agents

## Future Integration Points

### Phase 2: Cloud Sync
```
Dashboard ←→ Google Sheets API ←→ Shared Spreadsheet
         ←→ Webhook endpoints ←→ Slack/Teams notifications
```

### Phase 3: AI Backend
```
Dashboard ←→ REST API ←→ CrewAI/LangGraph Backend
                      ←→ LLM Provider (Claude/GPT)
                      ←→ Vector DB (agent memory)
```
