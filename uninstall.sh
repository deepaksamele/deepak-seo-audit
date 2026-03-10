#!/usr/bin/env bash
SKILL_DIR="${HOME}/.claude/skills/seo-audit"
echo "Uninstalling Deepak's SEO Audit Skill..."
if [ -d "${SKILL_DIR}" ]; then
    rm -rf "${SKILL_DIR}"
    echo "✓ Removed from ${SKILL_DIR}"
else
    echo "⚠  Not found — nothing to remove."
fi
echo "✓ Uninstall complete."
