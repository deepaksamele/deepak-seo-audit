#!/usr/bin/env bash
set -euo pipefail

main() {
    SKILL_DIR="${HOME}/.claude/skills/seo-audit"
    REPO_URL="https://github.com/deepaksamele/deepak-seo-audit"

    echo "════════════════════════════════════════════════"
    echo "║   Deepak's SEO / AEO / GEO Audit Skill      ║"
    echo "║   Claude Code Installer                      ║"
    echo "════════════════════════════════════════════════"
    echo ""

    command -v python3 >/dev/null 2>&1 || { echo "✗ Python 3 required. Visit https://python.org"; exit 1; }
    command -v git >/dev/null 2>&1 || { echo "✗ Git required. Visit https://git-scm.com"; exit 1; }

    PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    echo "✓ Python ${PYTHON_VERSION} detected"

    mkdir -p "${SKILL_DIR}/references"
    echo "✓ Created skill directory"

    TEMP_DIR=$(mktemp -d)
    trap "rm -rf ${TEMP_DIR}" EXIT

    echo "↓ Downloading Deepak's SEO Audit Skill..."
    git clone --depth 1 "${REPO_URL}" "${TEMP_DIR}/repo" 2>/dev/null
    echo "✓ Downloaded successfully"

    echo "→ Installing skill files..."
    cp -r "${TEMP_DIR}/repo/seo/"* "${SKILL_DIR}/"
    cp -r "${TEMP_DIR}/repo/references/"* "${SKILL_DIR}/references/"
    echo "✓ Skill files installed"

    echo "→ Installing Python dependencies..."
    pip install --quiet --break-system-packages -r "${TEMP_DIR}/repo/requirements.txt" 2>/dev/null || \
    pip install --quiet -r "${TEMP_DIR}/repo/requirements.txt" 2>/dev/null || \
    echo "⚠  Run manually: pip install reportlab"

    echo ""
    echo "════════════════════════════════════════════════"
    echo "✓ Installation complete!"
    echo ""
    echo "How to use:"
    echo "  1. Open Claude Code:  claude"
    echo "  2. Say: 'Audit my website: https://yoursite.com'"
    echo "  3. Get a full PDF SEO audit report!"
    echo "════════════════════════════════════════════════"
}

main "$@"
