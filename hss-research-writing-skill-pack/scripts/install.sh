#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${2:-}"

copy_skill_dir() {
  src="$1"
  dest="$2"
  mkdir -p "$dest"
  cp -R "$src" "$dest/"
  echo "Installed: $src -> $dest/"
}

case "${1:-}" in
  claude)
    copy_skill_dir "$ROOT_DIR/packages/claude-code/.claude/skills/hss-research-writing" "$HOME/.claude/skills"
    ;;
  qwen)
    copy_skill_dir "$ROOT_DIR/packages/qwen-code/.qwen/skills/hss-research-writing" "$HOME/.qwen/skills"
    ;;
  gemini)
    copy_skill_dir "$ROOT_DIR/packages/gemini-cli/.gemini/skills/hss-research-writing" "$HOME/.gemini/skills"
    ;;
  agents)
    if [ -z "$TARGET" ]; then
      TARGET="$(pwd)/.agents/skills"
    fi
    copy_skill_dir "$ROOT_DIR/packages/agents-standard/.agents/skills/hss-research-writing" "$TARGET"
    ;;
  codex)
    if [ -z "$TARGET" ]; then
      echo "Usage: bash scripts/install.sh codex /path/to/project"
      exit 1
    fi
    mkdir -p "$TARGET/.agents/skills"
    cp -R "$ROOT_DIR/packages/agents-standard/.agents/skills/hss-research-writing" "$TARGET/.agents/skills/"
    cp -R "$ROOT_DIR/packages/codex/AGENTS.md" "$TARGET/"
    cp -R "$ROOT_DIR/packages/codex/references" "$TARGET/"
    cp -R "$ROOT_DIR/packages/codex/templates" "$TARGET/"
    echo "Installed Codex package into $TARGET"
    ;;
  aider)
    if [ -z "$TARGET" ]; then
      echo "Usage: bash scripts/install.sh aider /path/to/project"
      exit 1
    fi
    cp -R "$ROOT_DIR/packages/aider/CONVENTIONS.md" "$TARGET/"
    cp -R "$ROOT_DIR/packages/aider/references" "$TARGET/"
    cp -R "$ROOT_DIR/packages/aider/templates" "$TARGET/"
    echo "Installed aider package into $TARGET"
    ;;
  *)
    echo "Usage: bash scripts/install.sh {claude|qwen|gemini|agents|codex|aider} [target]"
    exit 1
    ;;
esac
