# claude-skills

Personal Claude Code user skills.

## Install

Run `install.sh` it creates symlinks for each directory under `skills/` into `~/.claude/skills/`, so edits in the repo are live immediately. It finds `skills/` relative to its own location, not your current directory.

Re-run it when you:

- add a new skill, or
- move the repo folder (the existing symlinks would otherwise point to the old location; re-running replaces them).

Existing entries in `~/.claude/skills/` that are not symlinks are left untouched and reported as `skip`.


```bash
./install.sh
```