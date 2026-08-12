#!/usr/bin/env bash
# Reinstalls every Claude Code marketplace + plugin added to this machine.
# Safe to re-run: `claude plugin marketplace add`/`claude plugin install` are idempotent.
set -euo pipefail

echo "== Adding marketplaces =="
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace add cathrynlavery/diagram-design
claude plugin marketplace add https://github.com/obra/superpowers
claude plugin marketplace add oliver-kriska/claude-elixir-phoenix

echo "== Installing plugins =="
claude plugin install gopls-lsp@claude-plugins-official
claude plugin install frontend-design@claude-plugins-official
claude plugin install mattpocock-skills@claude-plugins-official
claude plugin install diagram-design@diagram-design
claude plugin install superpowers@superpowers-dev
claude plugin install elixir-phoenix@oliver-kriska

# These use the `skills` CLI (github.com/vercel-labs/skills) instead of the
# Claude Code plugin marketplace mechanism above — it copies a standalone
# SKILL.md into ~/.claude/skills/ rather than registering a marketplace.
echo "== Installing standalone skills (via npx skills) =="
npx --yes skills add Kadajett/agent-nestjs-skills -g -a claude-code -y
npx --yes skills add nutlope/hallmark -g -a claude-code -y

echo "== Done. Restart Claude Code to load the plugins/skills. =="
