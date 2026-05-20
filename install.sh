#!/usr/bin/env bash
# Installer for the "walk-with-socrates" Claude Code skill.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/pvminh17/walk-with-socrates/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/pvminh17/walk-with-socrates/main/install.sh | bash -s -- --project
#
# Flags:
#   --project   Install into ./.claude/skills/ instead of ~/.claude/skills/
#   --force     Overwrite an existing installation
#   -h, --help  Show this help

set -euo pipefail

REPO_URL="https://github.com/pvminh17/walk-with-socrates.git"
SKILL_NAME="walk-with-socrates"

SCOPE="user"
FORCE=0

print_help() {
  sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) SCOPE="project"; shift ;;
    --user)    SCOPE="user"; shift ;;
    --force)   FORCE=1; shift ;;
    -h|--help) print_help; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; print_help; exit 1 ;;
  esac
done

if [[ "$SCOPE" == "user" ]]; then
  TARGET="$HOME/.claude/skills/$SKILL_NAME"
else
  TARGET="$(pwd)/.claude/skills/$SKILL_NAME"
fi

if [[ -e "$TARGET" ]]; then
  if [[ "$FORCE" -eq 1 ]]; then
    echo "Removing existing $TARGET (--force)"
    rm -rf "$TARGET"
  else
    echo "Already installed at: $TARGET"
    echo "Use --force to overwrite, or run: cd \"$TARGET\" && git pull"
    exit 0
  fi
fi

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required but not installed." >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"

echo "Installing $SKILL_NAME → $TARGET"
git clone --depth 1 "$REPO_URL" "$TARGET"

echo
echo "Done. Open Claude Code and run /skills — you should see '$SKILL_NAME'."
echo "Try saying: \"walk with Socrates — I want to stress-test an idea\""
