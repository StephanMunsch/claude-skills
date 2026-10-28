#!/usr/bin/env bash
# Symlinks every skill in skills/ into ~/.claude/skills (idempotent).
set -euo pipefail
src="$(cd "$(dirname "$0")" && pwd)/skills"
dest="$HOME/.claude/skills"
mkdir -p "$dest"
for skill in "$src"/*/; do
  name="$(basename "$skill")"
  target="$dest/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "skip $name: $target exists and is not a symlink" >&2
    continue
  fi
  ln -sfn "${skill%/}" "$target"
  echo "linked $name"
done
