# Design decisions — meeting-notes

One entry per closed question, each with what closed it.
Changing an entry needs new evidence, not a new argument.

## Sections and their order

TL;DR, topic, date, participants, key points, decisions, open questions and risks, tasks, next meeting.
**Closed by:** user decision, 2026-10-26. The user named topic, participants and tasks as the core; the remaining sections were proposed and accepted.

## Empty sections stay visible

A section with nothing in the transcript prints one line saying so instead of being dropped.
**Closed by:** design reasoning, 2026-10-26. A missing "Decisions" section is indistinguishable from a forgotten one; "none mentioned" is a finding the reader can trust.

## Missing owner or due date → `open`, never guessed

**Closed by:** user decision, 2026-10-26 (task list with assignment, gaps marked rather than filled).

## Output location: chat, plus a file next to the transcript

When the transcript is a file, notes go to `<transcript-basename>-notes.md` in the same directory and are shown in the chat. Pasted transcripts produce chat output only, with an offer to save.
**Closed by:** user decision, 2026-10-26.

## Language follows the transcript

**Closed by:** user decision, 2026-10-26.

## Deployment range: Claude Code only

The skill may use Claude Code features (AskUserQuestion for the overwrite question).
**Closed by:** user decision, 2026-10-26.

## Profile standalone, role capability-generator

The skill produces one artefact (the notes) and assumes no surrounding quality harness.
**Closed by:** q-skill-and-instruction-writer Step 0c default; no caller set another profile.

## No bundled script

Reading a transcript and writing notes is judgement work; no step would be written identically by three independent agents (Pattern 14 three-agents test).
**Closed by:** writer analysis, 2026-10-26.

## No process tracker

The skill has three short sequential steps in one turn; the steps are listed in order in SKILL.md and need no separate tracker.
**Closed by:** writer analysis, 2026-10-26. ARTEFACT_QUALITY-CRITERION-09 is satisfied by the numbered step order the skill text names as its checklist.
