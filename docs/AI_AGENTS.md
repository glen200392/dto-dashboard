# AI Agent Orchestrator Documentation

## Overview

The AI Agent module is inspired by three industry-leading approaches:

1. **[Mission Control](https://x.com/pbteja1998/status/2017662163540971756)** by Bhanu Teja P — Multi-agent squad coordination using OpenClaw/Clawdbot
2. **[Nebula.gg](https://www.nebula.gg/)** — No-code AI workforce builder
3. **[CrewAI](https://www.crewai.com/)** — Role-based agent teams with visual studio

## Agent Definitions

### 🎯 Jarvis — Lead Orchestrator
- **Role**: Coordinates all agents, generates daily standups, manages priorities
- **Autonomy**: Lead
- **Schedule**: Daily at 08:00
- **Future Integration**: LLM-powered daily briefing generation

### 📊 Analyst — Data & KPI Specialist
- **Role**: Monitors KPI trends, generates insights, identifies patterns
- **Autonomy**: Specialist
- **Schedule**: Weekly (Monday)
- **Future Integration**: Automated trend analysis via Python backend

### 📋 Tracker — PM & Deadline Monitor
- **Role**: Tracks progress, flags delays, sends deadline reminders
- **Autonomy**: Specialist
- **Schedule**: Daily scan
- **Future Integration**: Calendar API + Slack notifications

### 🔔 Sentinel — Risk Detection
- **Role**: Detects anomalies, flags at-risk items, monitors dependencies
- **Autonomy**: Specialist
- **Schedule**: Continuous monitoring
- **Future Integration**: ML-based risk scoring model

### 📝 Scribe — Documentation & Reports
- **Role**: Generates meeting notes, weekly reports, change logs
- **Autonomy**: Intern (requires approval)
- **Schedule**: On-demand + weekly summary
- **Future Integration**: LLM-powered report generation

### 🔗 Connector — Integration & Data Sync
- **Role**: Manages API connections, syncs data with external systems
- **Autonomy**: Specialist
- **Schedule**: Hourly sync
- **Future Integration**: Google Sheets API, Jira, Power BI

## Workflow Templates

### Weekly Report (週報告)
```
Trigger: Every Monday 09:00
Flow: Analyst → collects KPI data
      Tracker → flags overdue items
      Scribe → generates report draft
      Jarvis → reviews and distributes
```

### Risk Alert (風險警報)
```
Trigger: Real-time (on status change to 'delayed' or 'at_risk')
Flow: Sentinel → detects risk condition
      Analyst → assesses impact scope
      Jarvis → determines severity
      Connector → sends notification
```

### Progress Update (進度更新)
```
Trigger: On data change
Flow: Tracker → calculates delta
      Analyst → updates KPI metrics
      Scribe → logs change entry
      Connector → syncs to external store
```

## Integration Roadmap

### Phase 1 (Current) — UI Layer
- Agent status visualization
- Activity feed display
- Workflow template viewer
- Manual agent configuration

### Phase 2 — API Layer
```javascript
// Future: Connect to backend API
const AGENT_API = 'https://api.dto-dashboard.com/agents';

async function triggerAgent(agentId, action) {
  const response = await fetch(`${AGENT_API}/${agentId}/trigger`, {
    method: 'POST',
    body: JSON.stringify({ action, context: getCurrentData() })
  });
  return response.json();
}
```

### Phase 3 — LLM Integration
```python
# Future: CrewAI backend example
from crewai import Agent, Task, Crew

jarvis = Agent(
    role='Lead Orchestrator',
    goal='Coordinate all DTO transformation tracking',
    backstory='Senior PM with 15 years experience in digital transformation',
    llm='claude-sonnet-4-5-20250929'
)

analyst = Agent(
    role='KPI Analyst',
    goal='Monitor and analyze transformation KPIs',
    backstory='Data analyst specializing in organizational metrics',
    llm='claude-sonnet-4-5-20250929'
)

weekly_report = Task(
    description='Generate weekly DTO progress report',
    agent=jarvis,
    expected_output='Structured weekly report with KPIs and recommendations'
)

crew = Crew(
    agents=[jarvis, analyst],
    tasks=[weekly_report],
    verbose=True
)
```

## Autonomy Levels

| Level | Label | Behavior | Use Case |
|-------|-------|----------|----------|
| 1 | Intern | Requires approval for all actions | New or untested agents |
| 2 | Specialist | Acts independently in assigned domain | Proven, domain-specific agents |
| 3 | Lead | Full autonomy, can delegate | Orchestration agents only |

## Activity Feed Format

```json
{
  "timestamp": "2026-02-07T09:30:00",
  "agent": "Tracker",
  "type": "alert",
  "message": "項目3 API/ETL建置 進度落後預期 15%",
  "severity": "warning",
  "project_id": 3,
  "action_id": 13
}
```
