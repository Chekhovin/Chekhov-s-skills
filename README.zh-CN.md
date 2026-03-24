# Chekhov's Skills

中文 | [English](./README.md)

一个面向 AI 编码助手与研究工作流的轻量技能仓库。

这个仓库把可复用的 `SKILL.md` 规范、便携提示词、参考文档和自动化脚本整理在一起，方便在 Codex 风格代理、Claude Code 风格工作流，以及其他提示词驱动工具中复用同一套流程。

## 仓库内容

### `api-quality-check`

用于验证某个 coding-model API 是否适合 coding CLI、terminal agent 或 OpenClaw 一类工作流。

覆盖能力：

- 能力 smoke test
- LT-lite 基线与漂移检测
- B3IT-lite 基线与漂移检测
- 多端点批量检测
- 单端点按日期归档的日常检测

关键文件：

- `api-quality-check/SKILL.md`
- `api-quality-check/scripts/api_quality_check.py`
- `api-quality-check/scripts/run_batch_checks.sh`
- `api-quality-check/scripts/run_daily_check.sh`

### `llm-benchmark-analyst`

用于在固定 benchmark 范围内检索、核对并分析大模型评测证据，再整理成结构化报告。

适用场景：

- 分析单个模型的强项与短板
- 比较某一能力领域的领先模型
- 解释 benchmark 测什么、可信度如何
- 对比前代模型与当前代模型

关键文件：

- `llm-benchmark-analyst/SKILL.md`
- `llm-benchmark-analyst/AGENTS.md`
- `llm-benchmark-analyst/CLAUDE.md`
- `llm-benchmark-analyst/PORTABLE_PROMPT.md`
- `llm-benchmark-analyst/references/`

## 这个仓库的特点

- 流程优先：沉淀可复用操作规范，而不是一次性提示词
- 脚本优先：能自动化的步骤尽量自动化
- 可移植：同一技能可以适配多种代理运行时
- 强调证据：模型分析保留精确版本、来源、时间点和缺陷警告

## Quick Start

### 作为 Codex / OpenAI 风格技能使用

如果你的运行时支持技能目录，可以先克隆仓库，再把需要的技能目录放到本地技能路径下。

```bash
git clone https://github.com/Chekhovin/Chekhov-s-skills.git
export CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
```

然后从技能入口开始阅读：

- `api-quality-check/SKILL.md`
- `llm-benchmark-analyst/SKILL.md`

### 运行 API 质量检测

```bash
export APIQ="$CODEX_HOME/skills/api-quality-check/scripts/api_quality_check.py"

python "$APIQ" smoke \
  --provider "OpenAI-Compatible" \
  --base-url "https://example.com/v1/chat/completions" \
  --api-key "$API_KEY" \
  --model-id "example-model" \
  --html-output ./smoke.html
```

### 在其他 AI 工具里使用 benchmark analyst

如果你的工具不直接支持技能目录，可以把下面这些文件作为入口：

- `SKILL.md`：完整技能定义
- `AGENTS.md`：通用 coding agent 入口
- `CLAUDE.md`：Claude Code 风格入口
- `PORTABLE_PROMPT.md`：中性、可粘贴的便携提示词版本

## 仓库结构

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

## 适合谁使用

- 需要评估 coding-model API 兼容性与稳定性的开发者
- 需要输出 benchmark 证据型模型分析报告的研究者
- 想建立可复用 AI 技能库的个人或团队

## 说明

- 当前仓库以流程文档、参考资料和脚本为主，不是一个强调打包发布的项目。
- 仓库根目录目前还没有 `LICENSE`；如果准备公开复用，建议补上。

