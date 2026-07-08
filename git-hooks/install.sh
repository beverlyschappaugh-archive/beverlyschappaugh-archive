#!/bin/bash
# Installs git hooks from git-hooks/ into .git/hooks/ for beverlyschappaugh-archive.github.io repo.
# Run from the repo root: bash git-hooks/install.sh

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [[ -z "$REPO_ROOT" ]]; then
    echo "Error: not inside a git repository."
    exit 1
fi

HOOKS_DIR="$REPO_ROOT/.git/hooks"
SOURCE_DIR="$REPO_ROOT/git-hooks"

for hook in "$SOURCE_DIR"/*; do
    name=$(basename "$hook")
    [[ "$name" == "install.sh" ]] && continue
    cp "$hook" "$HOOKS_DIR/$name"
    chmod +x "$HOOKS_DIR/$name"
    echo "Installed: $name"
done

echo "Git hooks installed."
