#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="${HOME}/.claude/skills/seo-audit"

echo "Uninstalling Deepak's SEO Audit Skill..."

if [ -d "${SKILL_DIR}" ]; then
    rm -rf "${SKILL_DIR}"
    echo "✓ Skill removed from ${SKILL_DIR}"
else
    echo "⚠  Skill directory not found — nothing to remove."
fi

echo "✓ Uninstall complete."
