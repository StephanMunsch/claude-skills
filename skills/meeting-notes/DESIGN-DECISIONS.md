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

When the transcript is a file, notes go to `<yyyy-mm-dd>_<transcript-basename>-summary.md` in the same directory and are shown in the chat. The date is the meeting date the user confirmed. Pasted transcripts produce chat output only, with an offer to save.
**Closed by:** user decision, 2026-10-26; file name changed from `<transcript-basename>-notes.md` by user decision, 2026-10-29.

## Date and participants are confirmed by the user before extraction

The skill shows the date it found (with its source) and the participant list, and asks for confirmation in one `AskUserQuestion` call. Nothing is extracted or written before both answers.
**Closed by:** user decision, 2026-10-29.

## Unclear points are asked before the notes file is written

Garbled terms, ambiguous owners or due dates, decision-vs-proposal doubts and passages whose meaning is unclear are put to the user, up to four per `AskUserQuestion` call. A user answer counts as a source alongside the transcript; points the user leaves open keep their marker. This supersedes the earlier "save without asking" autonomy.
**Closed by:** user decision, 2026-10-29.

## Language follows the transcript

**Closed by:** user decision, 2026-10-26.

## Deployment range: Claude Code only

The skill may use Claude Code features (AskUserQuestion for the confirmation, clarification and overwrite questions).
**Closed by:** user decision, 2026-10-26.

## Profile standalone, role capability-generator

The skill produces one artefact (the notes) and assumes no surrounding quality harness.
**Closed by:** q-skill-and-instruction-writer Step 0c default; no caller set another profile.

## No bundled script

Reading a transcript and writing notes is judgement work; no step would be written identically by three independent agents (Pattern 14 three-agents test).
**Closed by:** writer analysis, 2026-10-26.

## No process tracker

The skill has four short sequential steps; the steps are listed in order in SKILL.md and need no separate tracker.
**Closed by:** writer analysis, 2026-10-26. ARTEFACT_QUALITY-CRITERION-09 is satisfied by the numbered step order the skill text names as its checklist.
