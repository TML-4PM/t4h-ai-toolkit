# T4H AI Toolkit

Curated skills, agents, and references grabbed 2026-03-15.

## Skills (drop in ~/.claude/skills/)
- `skills/obsidian/` — kepano/obsidian-skills (5 skills)
- `skills/n8n/` — czlonkowski/n8n-skills (7 skills)  
- `skills/context-engineering/` — muratcankoylan/Agent-Skills-for-Context-Engineering (8 skills)

## Agents (drop in ~/.claude/agents/)
- `agents/engineering/` — backend-architect, devops-automator, ai-engineer, autonomous-optimization-architect, incident-response-commander
- `agents/specialized/` — agents-orchestrator, compliance-auditor, accounts-payable-agent
- `agents/support/` — finance-tracker, analytics-reporter, infrastructure-maintainer, legal-compliance-checker
- `agents/product/` — sprint-prioritizer
- `agents/marketing/` — linkedin-content-creator

## Reference Repos
- `reference/deer-flow/` — bytedance/deer-flow (SuperAgent harness)
- `reference/mirofish/` — 666ghj/MiroFish (swarm intelligence prediction)
- `reference/open-viking/` — volcengine/OpenViking (context database)
- `reference/lightpanda/` — lightpanda-io/browser (headless browser for AI)
- `reference/openclaw/` — openclaw/openclaw (307k star agent OS)

## Install
```bash
cp -r skills/* ~/.claude/skills/
cp -r agents/* ~/.claude/agents/
```

## Source Repos
- n8n MCP: `npx n8n-mcp` (czlonkowski/n8n-mcp)
- claude-mem: `/plugin marketplace add thedotmack/claude-mem`
- supermemory: `/plugin marketplace add supermemoryai/claude-supermemory`
- obsidian-plugin: `/plugin marketplace add kepano/obsidian-skills`

## GSD (Get Shit Done)
- `gsd/commands/` — all slash commands: new-project, discuss-phase, plan-phase, execute-phase, verify-work, etc.
- Install: `npx get-shit-done-cc@latest`
- Usage: `/gsd:new-project`, `/gsd:plan-phase`, `/gsd:execute-phase <N>`

## UI/UX Pro Max (41k star skill)
- `skills/ui-ux-pro-max/SKILL.md` — 44k char design intelligence skill
- `skills/ui-ux-pro-max/scripts/` — BM25 search engine (search.py, core.py)
- `skills/ui-ux-pro-max/data/` — 8 CSV databases (styles, colors, typography, UX, charts, etc.)
- Install: `npx uipro@latest init` or copy SKILL.md + data + scripts to `~/.claude/skills/ui-ux-pro-max/`
- Usage: auto-triggers on any UI/UX request; `python3 skills/ui-ux-pro-max/scripts/search.py "query" --design-system`

## Superpowers (obra)
- `skills/superpowers/collaboration/` — 10 skills: brainstorming, parallel agents, git worktrees, code review, plans
- `skills/superpowers/testing/` — TDD, anti-patterns, condition-based-waiting
- `skills/superpowers/debugging/` — systematic-debugging, root-cause-tracing, verification, defense-in-depth
- `skills/superpowers/problem-solving/` — 6 skills: inversion, meta-pattern, scale-game, when-stuck
- `skills/superpowers/architecture/` — preserving-productive-tensions
- Install: `/plugin marketplace add obra/superpowers-marketplace` then `/plugin install superpowers@superpowers-marketplace`

## Awesome Claude Code (hesreallyhim)
- `reference/awesome-claude-code/README.md` — 28k star curated list
- Browse for: hooks, slash-commands, CLAUDE.md files, orchestrators, status lines
