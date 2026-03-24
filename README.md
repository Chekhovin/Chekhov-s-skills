# Chekhov's Skills

[中文](./README.zh-CN.md) | English

A compact skill repository for AI coding agents and research workflows.

This repo packages reusable `SKILL.md` specs, portable prompt files, reference documents, and automation scripts so the same workflow can be reused across Codex-style agents, Claude Code-style setups, and other prompt-driven tools.

## What is inside

### `api-quality-check`

Validate whether a coding-model API is usable for coding CLIs, terminal agents, or OpenClaw-style workflows.

It covers:

- capability smoke tests
- LT-lite baseline and drift detection
- B3IT-lite baseline and drift detection
- batch checks across multiple endpoints
- daily archived checks for a single endpoint

Key files:

- `api-quality-check/SKILL.md`
- `api-quality-check/scripts/api_quality_check.py`
- `api-quality-check/scripts/run_batch_checks.sh`
- `api-quality-check/scripts/run_daily_check.sh`

### `llm-benchmark-analyst`

Research and analyze LLM benchmark evidence within a fixed benchmark universe, then turn it into structured reports.

It is designed for:

- model strength and weakness analysis
- domain leader comparisons
- benchmark explanation and trustworthiness analysis
- predecessor vs current-generation comparisons

Key files:

- `llm-benchmark-analyst/SKILL.md`
- `llm-benchmark-analyst/AGENTS.md`
- `llm-benchmark-analyst/CLAUDE.md`
- `llm-benchmark-analyst/PORTABLE_PROMPT.md`
- `llm-benchmark-analyst/references/`

## Why this repo

- Workflow-first: reusable operating instructions instead of one-off prompts
- Script-first where possible: repeatable checks instead of manual steps
- Portable by design: one skill can be adapted to multiple agent runtimes
- Evidence-oriented: model analysis keeps exact versions, sources, dates, and caveats

## Quick Start

### Use as a Codex/OpenAI-style skill

Clone the repo and place the relevant skill folder under your local skills directory if your runtime supports skill discovery.

```bash
git clone https://github.com/Chekhovin/Chekhov-s-skills.git
export CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
```

Then follow the skill entrypoint:

- `api-quality-check/SKILL.md`
- `llm-benchmark-analyst/SKILL.md`

### Run the API quality checker

```bash
export APIQ="$CODEX_HOME/skills/api-quality-check/scripts/api_quality_check.py"

python "$APIQ" smoke \
  --provider "OpenAI-Compatible" \
  --base-url "https://example.com/v1/chat/completions" \
  --api-key "$API_KEY" \
  --model-id "example-model" \
  --html-output ./smoke.html
```

### Use the benchmark analyst in other tools

If your tool does not support skill folders directly, use one of these files as the entrypoint:

- `SKILL.md` for the full skill definition
- `AGENTS.md` for generic coding-agent workflows
- `CLAUDE.md` for Claude Code-style workflows
- `PORTABLE_PROMPT.md` for a vendor-neutral prompt pack

## Repository Layout

```text
.
├── api-quality-check/
│   ├── SKILL.md
│   ├── agents/
│   ├── references/
│   └── scripts/
└── llm-benchmark-analyst/
    ├── SKILL.md
    ├── README.md
    ├── AGENTS.md
    ├── CLAUDE.md
    ├── PORTABLE_PROMPT.md
    ├── agents/
    └── references/
```

## Who this is for

- developers evaluating coding-model API compatibility and drift
- researchers writing benchmark-based model reports
- teams building a reusable internal skill library for AI agents

## Notes

- The repository currently focuses on workflow assets, references, and scripts rather than packaging or release tooling.
- A top-level `LICENSE` file is not present yet. Add one if you want clearer reuse terms.

