# meeting-notes

Turns a meeting transcript into meeting notes a person can act on: what the meeting was about, who was there, what was decided, and who does what by when.

## Purpose

After a meeting, someone has a raw transcript and needs the short version.
The notes answer four questions for a reader who was not there: what was it about, who took part, what was decided, and what is now on whose plate.

## Guarantees

- **Fixed sections, fixed order.** Every note set carries: TL;DR, topic, date, participants, key points, decisions, open questions and risks, tasks, next meeting.
  A section with nothing in the transcript says so in one line ("none mentioned") instead of disappearing.
- **Nothing is invented.** Every participant, decision and task traces back to something said in the transcript.
  A task whose owner or due date was not stated carries the marker `open` (German notes: `offen`), never a guessed name or date.
- **Decisions are kept apart from proposals.** Something counts as a decision only where the transcript shows agreement or a final call.
  A suggestion nobody confirmed lands in open questions, or as a task marked `proposed`.
- **Speaker labels are not turned into names by guessing.** "Speaker 1" stays "Speaker 1" unless the transcript itself ties the label to a name.
  A name taken from the transcript that way is marked as inferred.
- **The whole transcript is read.** Notes from the first half of a long transcript are a defect, not a summary.
- **The notes are written in the transcript's language**, unless the user asks for another one.
- **Output location:** the notes always appear in the chat.
  When the transcript came from a file, they are also saved as `<transcript-name>-notes.md` next to it.
  An existing file of that name is not overwritten without asking.

## Audience and assumptions

- Runs in Claude Code (CLI) as a personal skill under `~/.claude/skills/`.
- The user brings the transcript: a file path, or text pasted into the chat.
  Any plain-text form works — with or without timestamps and speaker labels, exported from Teams, Zoom, Meet or another recorder.
- The reader of the notes is a person who did not attend, or attended and wants the checklist.

## Questions this skill refuses

- **Does it record or transcribe audio?** No. It starts from text. Transcription is the recorder's job, and a skill that guesses at audio quality adds errors it cannot see.
- **Does it send the notes anywhere — mail, Slack, Confluence, Jira?** No. Publishing is an outward-facing act the user decides on separately. The notes stay in the chat and in the local file.
- **Does it create tickets from the tasks?** No, for the same reason: a ticket is a commitment in another system. The task table is shaped so it can be copied into one.
- **Does it judge the meeting — was it productive, who talked too much?** No. The notes report what was said, not an assessment of the people saying it.
- **Does it fill in missing owners or dates from context or common sense?** No. A guessed owner is worse than an `open` one, because nobody notices it is wrong.
- **Does it fix transcription errors by guessing what was meant?** No. A term that looks garbled is kept and marked `[unclear]`. A silent correction would make an error look like a fact.

## Where the implementation lives

`SKILL.md` in this directory is one realisation of the specification above.
Correctness is measured against this README, not against the current `SKILL.md`.
`DESIGN-DECISIONS.md` records why each closed question was closed the way it was.
