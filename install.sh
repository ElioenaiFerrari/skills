#!/usr/bin/env bash
# Reinstalls every Claude Code marketplace + plugin added to this machine.
# Safe to re-run: `claude plugin marketplace add`/`claude plugin install` are idempotent.
set -euo pipefail

echo "== Adding marketplaces =="
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace add cathrynlavery/diagram-design
claude plugin marketplace add https://github.com/obra/superpowers

echo "== Installing plugins =="
claude plugin install gopls-lsp@claude-plugins-official
claude plugin install frontend-design@claude-plugins-official
claude plugin install mattpocock-skills@claude-plugins-official
claude plugin install diagram-design@diagram-design
claude plugin install superpowers@superpowers-dev

echo "== Done. Restart Claude Code to load the plugins. =="
