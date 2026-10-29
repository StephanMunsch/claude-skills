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

When the transcript is a file, notes go to `<yyyy-mm-dd>_<transcript-basename>-summary.md` in the same directory and are shown in the chat. The date is the meeting date the user confirmed. A pasted transcript is saved verbatim as `<yyyy-mm-dd>_<topic-slug>-transcript.txt` beside `<yyyy-mm-dd>_<topic-slug>-summary.md` in the current working directory: the raw input would otherwise exist only in the conversation.
**Closed by:** user decision, 2026-10-26; file name changed from `<transcript-basename>-notes.md` by user decision, 2026-10-29; pasted input saved with its raw transcript instead of chat-only by user decision, 2026-10-29 (the current working directory as location: writer default, as a pasted transcript has no directory of its own).

## Date and participants are confirmed by the user before extraction

The skill shows the date it found (with its source) and the participant list, and asks for confirmation in one `AskUserQuestion` call. Nothing is extracted or written before both answers.
**Closed by:** user decision, 2026-10-29.

## Unclear points are asked before the notes file is written

Garbled terms, ambiguous owners or due dates, decision-vs-proposal doubts and passages whose meaning is unclear are put to the user, up to four per `AskUserQuestion` call. A user answer counts as a source alongside the transcript; points the user leaves open keep their marker. This supersedes the earlier "save without asking" autonomy.
**Closed by:** user decision, 2026-10-29.

## Notion publishing: asked after the notes exist, never by default

One `AskUserQuestion` after Step 4. Not a flag, and not part of the Step 2 confirmation: the user decides with the finished notes in front of them.
**Closed by:** user decision, 2026-10-29.

## Notion destination: project config line, else the user picks from a Notion listing

The target is read from a `meeting-notes notion target: <url>` line in the project's `AGENTS.md` or `CLAUDE.md`, keeping the personal skill neutral between projects. Without the line, the skill lists the user's teamspaces and the databases and pages in them that fit, the user picks, and the skill offers to write the line. The target may be a database (the page becomes a row) or a page (the meeting becomes a subpage).
**Closed by:** user decision, 2026-10-29.

## Publishing runs in a subagent that follows a bundled reference

The main skill does everything that needs the user: the question, resolving the destination. A subagent cannot ask the user. The subagent gets the notes, the transcript path and the confirmed target, and follows `references/notion-publishing.md`. That keeps the page layout in one place and the Notion tool output out of the main conversation.
**Closed by:** user decision, 2026-10-29 (subagent publishes using the skill itself); split of asking vs publishing by writer analysis, same day. Re-examined the same day after the first test run: publishing inline was weighed (the subagent cannot ask, and it costs more on short notes) and rejected, because the team's meeting notes will be very long and the subagent keeps their page content and Notion output out of the main conversation.

## Transcript is uploaded to the published page

The subagent uploads the transcript file to the meeting page itself, so summary and source live together. Pasted transcripts are uploaded too, from the file Step 4 saved.
**Closed by:** user decision, 2026-10-29.

## Notion MCP server is a declared prerequisite, checked in the preflight

The Input Interface lists the Notion MCP server as an optional dependency, and the preflight records whether it is connected. Without it the skill says, at Step 5, that no Notion MCP server was found and the step is skipped, never asks the publish question, saves locally only, and names the missing server in the report. A local-only run is a complete result, not a degraded failure.
**Closed by:** user decision, 2026-10-29 (review finding: the prerequisite was not stated; the skip is announced, never silent).

## Notion tools are not pre-granted in `allowed-tools`

The Notion MCP tool names carry the server's connection name as a prefix (`mcp__<server>__notion-…`), which differs between setups. The skill names the tools by function, and the permission prompts on first use are acceptable for an outward-facing action.
**Closed by:** writer analysis, 2026-10-29.

## Language follows the transcript

**Closed by:** user decision, 2026-10-26.

## Deployment range: Claude Code only

The skill may use Claude Code features (AskUserQuestion for the confirmation, clarification, overwrite and publish questions; the Agent tool and `${CLAUDE_SKILL_DIR}` for the publishing subagent).
**Closed by:** user decision, 2026-10-26.

## Profile standalone, role capability-generator

The skill produces one artefact (the notes) and assumes no surrounding quality harness.
**Closed by:** q-skill-and-instruction-writer Step 0c default; no caller set another profile.

## No bundled script

Reading a transcript and writing notes is judgement work; no step would be written identically by three independent agents (Pattern 14 three-agents test).
**Closed by:** writer analysis, 2026-10-26.

## No process tracker

The skill has five short sequential steps; the steps are listed in order in SKILL.md and need no separate tracker.
**Closed by:** writer analysis, 2026-10-26; re-checked with the fifth step (Notion), 2026-10-29. ARTEFACT_QUALITY-CRITERION-09 is satisfied by the numbered step order the skill text names as its checklist.
