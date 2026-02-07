# Changelog

## [3.0.0] - 2026-02-08

### Added
- **Multi-level SPA architecture** with hash-based router (13 routes)
- **Left sidebar navigation** (collapsible, 7 main sections)
- **Breadcrumb navigation** with context-aware path display
- **Project drill-down pages** — List → Detail → Action Item
- **AI Agent Control Center** with 4 sub-pages:
  - Squad Overview with global stats and quick actions
  - Agent Detail with full CRUD, task queue, metrics, activity history
  - Workflow Management with visual flow diagrams
  - Global Activity Log with filters
- **LLM integration points** — Global and per-agent configuration:
  - Provider selection (OpenAI, Anthropic, Ollama, vLLM, custom)
  - API endpoint, key, model name, local model path
  - Token limit and temperature settings
- **Team workload pages** with per-member drill-down
- **Full Action Items table** with multi-filter and sortable columns
- **Settings page** with theme, LLM config, and import/export
- **Toast notification system** with auto-dismiss

### Changed
- **Complete architectural rebuild** — Single tab page → Multi-level SPA
- **Navigation** — Top tabs replaced with left sidebar + breadcrumbs
- **Edit panel** — Fixed data-id indexing, added ESC close, overlay click close
- **Theme system** — Added `prefers-color-scheme` change listener
- **Import function** — Uses in-memory re-render instead of `location.reload()`
- **Filter comparisons** — Changed to strict equality where appropriate
- **Responsive design** — Sidebar auto-collapses on mobile (< 768px)

### Removed
- All company-specific branding (致伸集團 / Primax references)
- Tab-based navigation system
- Dependency map view (consolidated into project detail)

## [2.0.0] - 2026-02-07

### Added
- Dark mode, light mode, and system theme detection
- AI Agent Orchestrator tab with 6 specialized agents
- Activity feed for agent actions
- Workflow templates (Weekly Report, Risk Alert, Progress Update)
- Agent configuration panel
- Enhanced responsive design for mobile devices

### Changed
- Complete UI redesign with CSS custom properties for theming
- Improved Gantt chart with current month indicator
- Better filter system with search capability
- Smoother animations and transitions

## [1.0.0] - 2026-02-07

### Added
- Initial dashboard with 7 projects and 53 action items
- Overview with KPI cards and 4 interactive charts
- Project detail cards with progress tracking
- Gantt timeline visualization
- Owner workload analysis
- Full action items table with filters
- Dependency map
- Edit mode with slide-out panel
- JSON export/import for data persistence
- CSV export for Excel compatibility
- Toast notifications for user feedback
- Print-friendly styles
