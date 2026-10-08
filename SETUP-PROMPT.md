# Workspace setup prompt
Paste everything below the line into Claude Code (or tell Claude: "Fetch and follow https://raw.githubusercontent.com/itscleverszn-alt/pc-help/main/SETUP-PROMPT.md").

---

Set up my personal Claude Code workspace. Don't ask me anything first, just build it; I'll do the getting-to-know-me part later with `/onboard`. Do these in order:

## 2. Create the workspace
Root: `%USERPROFILE%\Documents\AI-workspace\`. Create these folders, each with a one-line `README.md` saying what goes in it:

| Folder | Purpose |
|---|---|
| `Projects/` | One subfolder per active project |
| `Projects/PC/` | Everything about my PC: hardware, software, fixes |
| `agents/` | Agent definitions and configs I build or save |
| `skills/` | Reusable Claude skills |
| `ideas/` | Raw ideas for later. Not active work |
| `brain files/` | Claude config and instruction files |
| `connections/` | `connections.md` (one section per service I connect) + `.env` for API keys |

Create `connections/connections.md` (empty heading) and an empty `connections/.env`.

## 3. Move my PC files in
Copy `CLAUDE.md`, `SYSTEM.md`, `FIX-LOG.md` from `%USERPROFILE%\Documents\PC-Help\` into `Projects/PC/`. Show me they copied correctly, then ask before deleting the old `PC-Help` folder.

## 4. Write the root `CLAUDE.md`
Create `AI-workspace/CLAUDE.md` with exactly these sections:

```markdown
# CLAUDE.md
Coding and working guidelines. Bias toward caution over speed; use judgment on trivial tasks.

## 1. Think Before Acting
State assumptions. If a request has more than one meaning, say so instead of guessing. If something is unclear, stop and ask, all questions in one message. Suggest a simpler approach when there is one.

## 2. Simplicity First
Do the minimum that solves the problem. No extra features, files, or settings that weren't asked for.

## 3. Surgical Changes
Only touch what the request needs. Don't rewrite or "improve" things that work. If you spot an unrelated problem, mention it instead of fixing it.

## 4. Goal-Driven
Before a multi-step task, give a short plan: `[Step] → check: [how we'll know it worked]`. Check each step before moving on.

## 5. Response Style
Short and direct. No filler ("Great!", "Certainly!"). Plain language, explain jargon the first time.

## 6. Safety
- Read-only commands are fine. Before anything that changes my system (installing, deleting, registry, settings), say what it does and wait for my OK.
- Never delete files without asking. Back up a file before editing it.
- Never show API keys or passwords in replies.
- Warn me when a conversation is getting long and a fresh one would help.

## 7. Know Me
Update this section + memory as soon as you learn something new about me.
Not filled in yet. If it's still empty, remind me once per session (one line, at the end of a reply) that I can run `/onboard`.

## 8. API Keys
Stored in `connections/.env`. Check there before asking me for a key. When I give one, save it there right away.

## 9. Memory
Save useful patterns about how I like to work as memories. Update existing ones instead of making duplicates.

## 10. Workspace Folders
Root: `%USERPROFILE%\Documents\AI-workspace\`. Keep each folder's contents matching its purpose.

| Folder | Purpose |
|---|---|
| `Projects/` | Active projects, one subfolder each. `Projects/PC/` = my PC (see 10a) |
| `agents/` | Agent definitions and configs |
| `skills/` | Reusable Claude skills |
| `ideas/` | Raw ideas, not active work |
| `brain files/` | Claude config and instruction files |
| `connections/` | `connections.md` (add a section per new service) + `.env` for keys |

## 10a. PC Project
For any PC/Windows/game/app question, follow `Projects/PC/CLAUDE.md` and read `Projects/PC/FIX-LOG.md` before suggesting anything.
@Projects/PC/CLAUDE.md
@Projects/PC/SYSTEM.md

## 11. Maintenance
Keep this file short. Use tables and one-line bullets. When a section grows, compact it.
```

## 4b. Turn on bypass permissions
In `%USERPROFILE%\.claude\settings.json` (create it if missing; if it exists, merge, don't overwrite other settings), set:
```json
{ "permissions": { "defaultMode": "bypassPermissions" } }
```
Tell me in one sentence what this means: Claude runs commands without asking me each time, so section 6 (Safety) of CLAUDE.md is what keeps it careful. The first time Claude starts in this mode it shows a warning screen. I accept it by pressing the number next to "Yes, I accept" (not Enter, which picks "No").

## 5. Create the `/onboard` command
Create `%USERPROFILE%\.claude\commands\onboard.md` with exactly this:

```markdown
---
description: Get to know me and fill in my CLAUDE.md "Know Me" section + memory
---
Interview me so you can work with me better. Ask all of these in ONE message, numbered, and tell me I can skip any:
1. Name, age, where I live (province/country)
2. What I do: school, job, hours per week, how much free time I have
3. What I want to use Claude for: goals, projects, hobbies, things I want to learn
4. Games and apps I use most, and my PC setup if not already in Projects/PC/SYSTEM.md
5. How I like answers: short and direct, or more explained? Any pet peeves?

After I answer:
- Fill in section 7 "Know Me" of `Documents/AI-workspace/CLAUDE.md` (one-line bullets, remove the "Not filled in yet" reminder line).
- If I gave a style preference, update section 5 "Response Style".
- If I named goals or projects, ask if I want a folder in `Projects/` or a note in `ideas/` for each, and create the ones I say yes to.
- Save a memory about me.
- Show me what you changed in a short list.
```

## 5b. Save memory
Save a memory: workspace set up on today's date; "Know Me" not filled yet, `/onboard` will do it.

## 6. Finish
Show me the folder tree, then tell me: close this session, in VS Code do File → Open Folder → `Documents\AI-workspace`, open the terminal (Ctrl + `), and run `claude`. From then on, always start Claude from that folder.
