# HSS Research Writing Skill Pack

这是一个面向人文社会科学（Humanities & Social Sciences, HSS）的研究与论文写作技能包。

它不是“直接替你生成一篇看起来像论文的文本”的快写插件，而是一套更稳的研究工作流：先把材料吃透、整理、编码、比较、归档，再进入论证设计、提纲、初稿、修订和审稿回复。整个包尽量让 AI 在“材料台账、证据链、概念边界、写作风格、引用核验”这五件事上更可靠。

## 设计目标

1. *材料先行*：在写之前先做文献矩阵、材料卡片、证据矩阵和论证地图。
2. *证据可追溯*：核心判断都应该能回到具体材料、页码、档案号、访谈段落或数据表。
3. *适配 HSS*：适合历史学、社会学、政治学、法学、传播学、教育学、公共管理、国际关系、哲学、文学与跨学科研究。
4. *支持多方法*：文献综述、史学综述、档案研究、访谈/民族志、政策/法律/媒体分析、定量/混合方法、理论研究都能用。
5. *降低 AI 味*：保留学术严谨，同时避免空泛、宣传腔、模板腔和“看起来像会写论文但其实证据没落地”的问题。

## 你会得到什么

- `core/hss-research-writing/`：主技能目录（`SKILL.md` + 参考文档 + 模板）
- `packages/claude-code/`：可直接放入 Claude Code 的目录结构
- `packages/qwen-code/`：可直接放入 Qwen Code 的目录结构
- `packages/gemini-cli/`：可直接放入 Gemini CLI 的目录结构
- `packages/agents-standard/`：使用 `.agents/skills/` 的通用 Agent Skills 结构
- `packages/codex/`：适配 OpenAI Codex CLI 的 `AGENTS.md` + 项目级资源版本
- `packages/aider/`：适配 aider 的 `CONVENTIONS.md` 版本
- `dist/hss-research-writing.skill`：打包好的 `.skill` 文件，方便支持 zip skill 的工具直接安装
- `scripts/install.sh`：简单安装脚本

## 推荐工作方式

### 通用文件工作台

如果你在一个研究项目目录中使用本技能，建议默认建立这样的工作台：

```text
research-workbench/
  00-task-brief.md
  10-source-ledger.md
  20-reading-memos/
  30-coding/
  40-evidence-matrix.md
  50-argument-map.md
  60-outline.md
  70-draft.md
  80-revision-log.md
```

这样做的好处是：AI CLI 工具最擅长操作文件、比较版本、补充结构和持续迭代。把研究过程“落成文件”，会比只在对话里反复讨论稳得多。

## 快速安装

### 1) Claude Code

```bash
mkdir -p ~/.claude/skills
cp -R packages/claude-code/.claude/skills/hss-research-writing ~/.claude/skills/
```

### 2) Qwen Code

```bash
mkdir -p ~/.qwen/skills
cp -R packages/qwen-code/.qwen/skills/hss-research-writing ~/.qwen/skills/
```

### 3) Gemini CLI

```bash
mkdir -p ~/.gemini/skills
cp -R packages/gemini-cli/.gemini/skills/hss-research-writing ~/.gemini/skills/
```

或者直接安装打包文件：

```bash
gemini skills install dist/hss-research-writing.skill
```

### 4) 通用 Agent Skills 目录（跨 Codex / Gemini / 其他兼容 Agent Skills 的工具）

```bash
mkdir -p .agents/skills
cp -R packages/agents-standard/.agents/skills/hss-research-writing .agents/skills/
```

### 5) OpenAI Codex CLI

Codex 现在既支持 `AGENTS.md`，也支持基于 `.agents/skills/` 的 Agent Skills。这个包两种都给了：

```bash
# 项目级 Skill
mkdir -p /path/to/project/.agents/skills
cp -R packages/agents-standard/.agents/skills/hss-research-writing /path/to/project/.agents/skills/

# 可选：再加上项目级 AGENTS.md 常驻规范
cp -R packages/codex/* /path/to/project/
```

复制后，项目根目录会出现：

```text
AGENTS.md
references/
templates/
.agents/skills/hss-research-writing/
```

### 6) aider

把 `packages/aider/` 里的内容复制到你的项目根目录，然后在 aider 中读取：

```bash
cp -R packages/aider/* /path/to/project/
aider --read CONVENTIONS.md
```

## 常见使用场景

- “先把这批文献整理成矩阵，再帮我提出一个文献综述结构。”
- “把这组访谈整理成编码表、主题簇和反例清单。”
- “我有一批政策文本和判决书，先做比较网格，再写分析部分。”
- “把档案材料做成材料卡片，区分出处、语境、用途和可引页码。”
- “根据已有材料生成证据矩阵和论证地图，不要直接写结论。”
- “按 Chicago/APA/GB/T 习惯整理引文，但不要凭空补页码。”
- “对这篇草稿做 reviewer 视角诊断，再进行去 AI 味修订。”

## 内容结构

```text
hss-research-writing-skill-pack/
  README.md
  ATTRIBUTION.md
  core/
    hss-research-writing/
      SKILL.md
      references/
      templates/
  packages/
    agents-standard/
    claude-code/
    codex/
    gemini-cli/
    qwen-code/
    aider/
  dist/
    hss-research-writing.skill
  scripts/
    install.sh
```

## 适配说明

- Claude Code、Qwen Code、Gemini CLI 和 Codex 都支持基于 `SKILL.md` 的 Agent Skills 目录，所以主技能目录可以直接复用。
- Codex 额外支持 `AGENTS.md` 分层指令；本包单独给了一个偏项目规范、低噪常驻的版本。
- aider 更适合用 `CONVENTIONS.md` 作为只读规范文件，让它在编辑过程中遵循本技能的研究与写作约束。

## 使用建议

1. 不要一上来就要求“生成完整论文”，先让工具建立材料台账和证据矩阵。
2. 如果材料很多，优先让工具输出 `10-source-ledger.md`、`40-evidence-matrix.md` 和 `50-argument-map.md`。
3. 如果你已经有草稿，再让工具对照材料做“证据审计”和“引用审计”。
4. 去 AI 味放在最后一轮做，不要在证据还没扎实时先追求文风。
5. 对任何直接引语、页码、档案号、法律条款编号、统计值都要做人类复核。
