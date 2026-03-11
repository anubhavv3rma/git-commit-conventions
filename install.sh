#!/usr/bin/env bash

# =============================================================================
# install.sh
# Installs the commit-msg hook into a Git repository.
#
# Usage:
#   From inside your target project:
#     /path/to/git-commit-conventions/install.sh
#
#   Or via curl (one-liner):
#     curl -fsSL https://raw.githubusercontent.com/anubhavv3rma/git-commit-conventions/main/install.sh | bash
# =============================================================================

set -e

HOOK_NAME="commit-msg"
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
SOURCE_HOOK="$REPO_ROOT/$HOOK_NAME"
TARGET_DIR=".git/hooks"
TARGET_HOOK="$TARGET_DIR/$HOOK_NAME"


# --- Guards ------------------------------------------------------------------

if [[ ! -d ".git" ]]; then
    echo "Error: Not a Git repository. Run this from the root of your project."
    exit 1
fi

if [[ ! -f "$SOURCE_HOOK" ]]; then
    echo "Error: Hook source not found at $SOURCE_HOOK"
    exit 1
fi


# --- Backup existing hook if present -----------------------------------------

if [[ -f "$TARGET_HOOK" ]]; then
    BACKUP="$TARGET_HOOK.bak"
    cp "$TARGET_HOOK" "$BACKUP"
    echo "Existing hook backed up to $BACKUP"
fi


# --- Install -----------------------------------------------------------------

mkdir -p "$TARGET_DIR"
cp "$SOURCE_HOOK" "$TARGET_HOOK"
chmod +x "$TARGET_HOOK"

echo "Installed: $TARGET_HOOK"
echo ""
echo "Next step: open $TARGET_HOOK and set HOOK_STYLE to your preferred style."
echo "  Options: imperative | conventional | linux"
