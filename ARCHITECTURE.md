# Architecture Documentation — DTO Dashboard v3.0

## System Overview

The DTO Dashboard is a **self-contained, offline-first** single-page application (SPA) that runs entirely in the browser with no server requirements. Version 3.0 introduces a hash-based router, left sidebar navigation, and multi-level page drill-downs.

```
┌──────────────────────────────────────────────────┐
│  Top Bar: Search + Theme Toggle + User Menu      │
├─────────┬────────────────────────────────────────┤
│         │  Breadcrumb: Home > Projects > Project3 │
│ Left    ├────────────────────────────────────────┤
│ Sidebar │                                        │
│ (can    │        Main Content Area               │
│  toggle)│        (Dynamic view rendering)        │
│         │                                        │
│ 📊 Overview │                                    │
│ 📋 Projects │                                    │
│ 📅 Timeline │                                    │
│ 🤖 Agents   │                                    │
│ 👥 Team     │                                    │
│ ⚙️ Settings │                                    │
├─────────┴────────────────────────────────────────┤
│  Status Bar                                      │
└──────────────────────────────────────────────────┘
```

## Component Architecture

### 1. SPA Router (Hash-based)

```javascript
// Route definitions
const routes = {
  '/':                          renderOverview,
  '/projects':                  renderProjectsList,
  '/projects/:id':              renderProjectDetail,
  '/projects/:id/actions/:aid': renderActionDetail,
  '/timeline':                  renderTimeline,
  '/agents':                    renderAgentSquad,
  '/agents/workflows':          renderWorkflows,
  '/agents/activity':           renderAgentActivity,
  '/agents/:id':                renderAgentDetail,
  '/team':                      renderTeam,
  '/team/:name':                renderTeamMemberDetail,
  '/actions':                   renderAllActions,
  '/settings':                  renderSettings
};
```

Route parsing uses pattern matching with `:param` extraction. Static routes (like `/agents/workflows`) are checked before parameterized routes (like `/agents/:id`).

### 2. Theme Engine
- CSS Custom Properties (`--bg-primary`, `--text-primary`, `--accent`, etc.)
- Three modes: `light`, `dark`, `system`
- `prefers-color-scheme` media query with `change` event listener
- localStorage persistence key: `dto-theme`
- Smooth 0.3s transitions on theme change

### 3. Data Layer
- All project data (7 projects, 53+ action items) stored as JS objects
- Agent data stored separately with per-agent LLM configs
- Workflow templates as configuration objects
- State management via `loadState()` / `saveState()` with localStorage
- JSON/CSV export/import for full data portability

### 4. AI Agent Module
- 6 agents with role, status, autonomy level, schedule, tools
- Per-agent task queues with priority and status tracking
- Activity logs with type classification (info, alert, success, error)
- Global and per-agent LLM configuration:
  ```javascript
  llmConfig: {
    provider: 'anthropic',    // openai | anthropic | ollama | vllm | custom | none
    apiEndpoint: '',          // REST API URL
    apiKey: '',               // API key (masked in UI)
    modelName: 'claude-sonnet-4-5-20250929',
    localModelPath: '',       // For Ollama/vLLM local deployment
    maxTokens: 4096,
    temperature: 0.7
  }
  ```

### 5. Edit Panel
- Slide-out panel with overlay background
- Correct data-id indexing (uses original item IDs, not filtered indices)
- Close methods: ESC key, overlay click, close button, save button
- Immediate re-render on save (no page reload)

## Data Flow

```
URL Hash Change
  → parseRoute() extracts path + params
  → handleRoute() finds matching render function
  → render function generates HTML into #main-content
  → updateSidebarActive() highlights current nav item
  → updateBreadcrumb() shows navigation path
  → Chart.js instances created (destroyed on next route change)

User Edit
  → openEditPanel(projectId, itemId) opens slide-out
  → saveEdit() updates state.items array
  → saveState() persists to localStorage
  → Current view re-renders with updated data
```

## Theme Architecture

```css
[data-theme="light"] {
  --bg-primary: #ffffff;
  --bg-secondary: #f8fafc;
  --text-primary: #1e293b;
  --accent: #3b82f6;
  --sidebar-bg: #1e293b;
  /* ... 16 properties total */
}

[data-theme="dark"] {
  --bg-primary: #0f172a;
  --bg-secondary: #1e293b;
  --text-primary: #f1f5f9;
  --accent: #60a5fa;
  --sidebar-bg: #0f172a;
  /* ... 16 properties total */
}
```

## AI Agent Design Pattern

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

### Workflow Visualization
```
[⏰ Trigger]  →  [🤖 Agent]  →  [⚡ Action]  →  [📄 Output]
 Every Mon 9am    Analyst      Collect KPIs    Generate Report
```

## LLM Integration Architecture

### Current (v3.0) — Configuration UI
```
Settings Page (#/settings)
  └── LLM Configuration Section
      ├── Provider dropdown (OpenAI / Anthropic / Ollama / vLLM / Custom)
      ├── API Endpoint input
      ├── API Key input (password masked)
      ├── Model Name input
      ├── Local Model Path input
      ├── Max Tokens slider
      └── Temperature slider

Agent Detail Page (#/agents/:id)
  └── Per-Agent LLM Config
      ├── "Use Global Config" checkbox
      └── Override fields (same as global)
```

### Future — Backend Integration Points
```
Dashboard (Frontend)
    ├── REST API calls ──► CrewAI / LangGraph Backend
    │                       ├── Agent orchestration
    │                       ├── Task delegation
    │                       └── Report generation
    │
    ├── LLM API calls ──► Cloud Provider (OpenAI / Anthropic)
    │                       ├── Natural language processing
    │                       └── Content generation
    │
    └── Local LLM calls ─► Ollama / vLLM (on-premise)
                            ├── Privacy-sensitive operations
                            └── Offline capability
```

## Responsive Breakpoints

| Breakpoint | Behavior |
|-----------|----------|
| > 768px | Full sidebar + main content |
| ≤ 768px | Sidebar hidden, hamburger menu toggle |
| ≤ 480px | Single column layout, stacked cards |
