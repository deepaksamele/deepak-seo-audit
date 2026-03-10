#!/usr/bin/env bash
set -euo pipefail

# Deepak's SEO / AEO / GEO Audit Skill - Installer
# One-command install for Mac, Linux, and Unix systems

main() {
    SKILL_DIR="${HOME}/.claude/skills/seo-audit"
    REPO_URL="https://github.com/deepaksamele/deepak-seo-audit"

    echo "════════════════════════════════════════════════"
    echo "║   Deepak's SEO / AEO / GEO Audit Skill      ║"
    echo "║   Claude Code Installer                      ║"
    echo "════════════════════════════════════════════════"
    echo ""

    # Check prerequisites
    command -v python3 >/dev/null 2>&1 || { echo "✗ Python 3 is required but not installed. Visit https://python.org"; exit 1; }
    command -v git >/dev/null 2>&1 || { echo "✗ Git is required but not installed. Visit https://git-scm.com"; exit 1; }

    PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    echo "✓ Python ${PYTHON_VERSION} detected"

    # Create skill directory
    mkdir -p "${SKILL_DIR}"
    mkdir -p "${SKILL_DIR}/references"
    echo "✓ Created skill directory: ${SKILL_DIR}"

    # Clone repo to temp directory
    TEMP_DIR=$(mktemp -d)
    trap "rm -rf ${TEMP_DIR}" EXIT

    echo "↓ Downloading Deepak's SEO Audit Skill..."
    git clone --depth 1 "${REPO_URL}" "${TEMP_DIR}/deepak-seo-audit" 2>/dev/null
    echo "✓ Downloaded successfully"

    # Copy skill files
    echo "→ Installing skill files..."
    cp -r "${TEMP_DIR}/deepak-seo-audit/seo/"* "${SKILL_DIR}/"
    cp -r "${TEMP_DIR}/deepak-seo-audit/references/"* "${SKILL_DIR}/references/"
    echo "✓ Skill files installed"

    # Install Python dependencies
    echo "→ Installing Python dependencies..."
    pip install --quiet --break-system-packages -r "${TEMP_DIR}/deepak-seo-audit/requirements.txt" 2>/dev/null || \
    pip install --quiet -r "${TEMP_DIR}/deepak-seo-audit/requirements.txt" 2>/dev/null || \
    echo "⚠  Could not auto-install packages. Run manually: pip install reportlab"

    echo ""
    echo "════════════════════════════════════════════════"
    echo "✓ Installation complete!"
    echo ""
    echo "How to use:"
    echo "  1. Open Claude Code:  claude"
    echo "  2. Say: 'Audit my website: https://yoursite.com'"
    echo "  3. Claude will run the full SEO audit and deliver a PDF!"
    echo ""
    echo "For local business:"
    echo "  'Audit https://myshop.com — I'm based in Mumbai'"
    echo "════════════════════════════════════════════════"
}

main "$@"
