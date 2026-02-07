# AI Agent Control Center Documentation

## Overview

The AI Agent module provides a complete management interface for orchestrating AI agents within the DTO Dashboard. Version 3.0 introduces dedicated pages for agent management, workflow design, and LLM integration configuration.

### Inspiration
1. **[Mission Control](https://x.com/pbteja1998/status/2017662163540971756)** by Bhanu Teja P — Multi-agent squad coordination
2. **[Nebula.gg](https://www.nebula.gg/)** — No-code AI workforce builder
3. **[CrewAI](https://www.crewai.com/)** — Role-based agent teams with visual studio
4. **[OpenAI Swarm](https://github.com/openai/swarm)** — Multi-agent handoff framework

## Page Structure

### Squad Overview (`#/agents`)
- Agent card grid with status indicators (active/idle/paused/error)
- Quick actions: Add Agent, Pause All, Activate All, Trigger Standup
- Global statistics: active count, today's tasks, alerts
- Recent activity feed (latest 5 entries)

### Agent Detail (`#/agents/:id`)
- **Identity Section**: Name, emoji, role, description (editable)
- **Configuration**: Status toggle, autonomy level, schedule, project assignments, tools
- **LLM Config**: Per-agent provider, model, endpoint, temperature (or use global)
- **Task Queue Tab**: In-progress, pending, completed tasks with add/status-change
- **Metrics Tab**: Weekly completions, avg response time, reliability score, 4-week trend
- **Activity History Tab**: Date-grouped timeline with type/severity filters

### Workflow Management (`#/agents/workflows`)
- Visual flow diagrams: Trigger → Agent → Action → Output
- 3 built-in templates: Weekly Report, Risk Alert, Progress Update
- CRUD for custom workflows
- Future integration info: CrewAI, LangGraph, OpenAI Swarm, Local LLM

### Global Activity Log (`#/agents/activity`)
- Merged timeline from all agents
- Filters: Agent, Type (info/alert/success/error), Date range
- Summary statistics with auto-refresh capability

## Agent Definitions

### 🎯 Jarvis — Lead Orchestrator
- **Role**: Coordinates all agents, generates daily standups, manages priorities
- **Autonomy**: Lead
- **Schedule**: Daily at 08:00
- **LLM**: Anthropic Claude (default)
- **Future**: LLM-powered daily briefing generation, task delegation

### 📊 Analyst — Data & KPI Specialist
- **Role**: Monitors KPI trends, generates insights, identifies patterns
- **Autonomy**: Specialist
- **Schedule**: Weekly (Monday)
- **LLM**: OpenAI GPT-4 (default)
- **Future**: Automated trend analysis, anomaly detection

### 📋 Tracker — PM & Deadline Monitor
- **Role**: Tracks progress, flags delays, sends deadline reminders
- **Autonomy**: Specialist
- **Schedule**: Daily scan
- **LLM**: Anthropic Claude (default)
- **Future**: Calendar API + Slack notifications

### 🔔 Sentinel — Risk Detection
- **Role**: Detects anomalies, flags at-risk items, monitors dependencies
- **Autonomy**: Specialist
- **Schedule**: Continuous monitoring
- **LLM**: Local model via Ollama (default)
- **Future**: ML-based risk scoring model

### 📝 Scribe — Documentation & Reports
- **Role**: Generates meeting notes, weekly reports, change logs
- **Autonomy**: Intern (requires approval)
- **Schedule**: On-demand + weekly summary
- **LLM**: Not configured (default)
- **Future**: LLM-powered report generation

### 🔗 Connector — Integration & Data Sync
- **Role**: Manages API connections, syncs data with external systems
- **Autonomy**: Specialist
- **Schedule**: Hourly sync
- **LLM**: Not configured (default)
- **Future**: Google Sheets API, Jira, Power BI integration

## LLM Integration

### Global Configuration (`#/settings`)

```javascript
{
  provider: 'anthropic',        // openai | anthropic | ollama | vllm | custom | none
  apiEndpoint: 'https://api.anthropic.com/v1',
  apiKey: 'sk-ant-...',         // Stored locally, masked in UI
  modelName: 'claude-sonnet-4-5-20250929',
  localModelPath: '',           // For Ollama: /path/to/model
  maxTokens: 4096,
  temperature: 0.7
}
```

### Per-Agent Override
Each agent can either use the global LLM config or override with its own settings. This allows mixing cloud and local models based on sensitivity and performance needs.

### Supported Providers

| Provider | Type | Use Case |
|----------|------|----------|
| OpenAI | Cloud API | General purpose, GPT-4/GPT-4o |
| Anthropic | Cloud API | Claude models, long context |
| Ollama | Local | Privacy-sensitive, on-premise |
| vLLM | Local | High-throughput local inference |
| Custom | Any | Custom API endpoints |

### Future Orchestration Frameworks

The dashboard UI is designed to integrate with these backend frameworks:

**CrewAI**
```python
from crewai import Agent, Task, Crew

jarvis = Agent(
    role='Lead Orchestrator',
    goal='Coordinate all DTO transformation tracking',
    llm='claude-sonnet-4-5-20250929'
)

crew = Crew(agents=[jarvis, analyst, tracker], tasks=[weekly_report])
```

**LangGraph**
```python
from langgraph.graph import StateGraph

graph = StateGraph(AgentState)
graph.add_node("jarvis", jarvis_node)
graph.add_node("analyst", analyst_node)
graph.add_edge("jarvis", "analyst")
```

**OpenAI Swarm**
```python
from swarm import Swarm, Agent

jarvis = Agent(name="Jarvis", instructions="Coordinate DTO agents...")
client = Swarm()
response = client.run(agent=jarvis, messages=[...])
```

**Local Deployment (Ollama/vLLM)**
```bash
# Ollama
ollama run llama3.2
curl http://localhost:11434/api/generate -d '{"model":"llama3.2","prompt":"..."}'

# vLLM
python -m vllm.entrypoints.openai.api_server --model meta-llama/Llama-3.2-8B
curl http://localhost:8000/v1/completions -d '{"model":"llama3.2","prompt":"..."}'
```

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

## Autonomy Levels

| Level | Label | Behavior | Use Case |
|-------|-------|----------|----------|
| 1 | Intern | Requires approval for all actions | New or untested agents |
| 2 | Specialist | Acts independently in assigned domain | Proven, domain-specific agents |
| 3 | Lead | Full autonomy, can delegate | Orchestration agents only |

## Activity Log Format

```json
{
  "time": "09:30",
  "type": "alert",
  "message": "偵測到項目6延遲風險",
  "agent": "Sentinel"
}
```

Types: `info`, `alert`, `success`, `error`
