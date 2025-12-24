#!/usr/bin/env bash
# Install Claude Web Plugins to a target repository
#
# Usage:
#   ./install.sh /path/to/target/repo
#   ./install.sh  # prompts for path

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_CLAUDE_DIR="${SCRIPT_DIR}/.claude"

# Get target directory
if [[ $# -ge 1 ]]; then
    TARGET_DIR="$1"
else
    read -rp "Enter target repository path: " TARGET_DIR
fi

# Expand ~ if present
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

# Validate target
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: Directory does not exist: $TARGET_DIR"
    exit 1
fi

TARGET_CLAUDE_DIR="${TARGET_DIR}/.claude"

# Check for existing .claude directory
if [[ -d "$TARGET_CLAUDE_DIR" ]]; then
    echo "Warning: ${TARGET_CLAUDE_DIR} already exists."
    echo ""
    echo "Options:"
    echo "  1) Merge (add new files, skip existing)"
    echo "  2) Replace (delete existing, copy fresh)"
    echo "  3) Cancel"
    read -rp "Choice [1/2/3]: " choice

    case "$choice" in
        1)
            echo "Merging..."
            # Copy with -n (no-clobber) to skip existing files
            cp -rn "${SOURCE_CLAUDE_DIR}/"* "${TARGET_CLAUDE_DIR}/" 2>/dev/null || true
            echo "Done. New files added, existing files preserved."
            ;;
        2)
            echo "Replacing..."
            rm -rf "$TARGET_CLAUDE_DIR"
            cp -r "$SOURCE_CLAUDE_DIR" "$TARGET_CLAUDE_DIR"
            echo "Done. Fresh copy installed."
            ;;
        3)
            echo "Cancelled."
            exit 0
            ;;
        *)
            echo "Invalid choice. Cancelled."
            exit 1
            ;;
    esac
else
    # No existing directory, just copy
    echo "Installing to ${TARGET_CLAUDE_DIR}..."
    cp -r "$SOURCE_CLAUDE_DIR" "$TARGET_CLAUDE_DIR"
    echo "Done."
fi

echo ""
echo "Installed:"
echo "  - $(find "${TARGET_CLAUDE_DIR}/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ') skills"
echo "  - $(find "${TARGET_CLAUDE_DIR}/commands" -name "*.md" 2>/dev/null | wc -l | tr -d ' ') commands"
echo "  - $(find "${TARGET_CLAUDE_DIR}/agents" -name "*.md" 2>/dev/null | wc -l | tr -d ' ') agents"
echo ""
echo "Next: Commit the .claude/ directory to your repo and use it in Claude Code Web."
