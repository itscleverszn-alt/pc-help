# PC Help Rules
Everything about this PC (hardware, software, fixes, settings) lives in this folder.

| File | Holds |
|---|---|
| `SYSTEM.md` | Current hardware, software versions, applied settings/tweaks |
| `FIX-LOG.md` | Every issue: symptoms, diagnostics, each fix tried + result |

0. **First run.** If `SYSTEM.md` still has `TBD` rows, fill them in with read-only PowerShell (CPU, GPU + driver, board + BIOS, RAM, storage, Windows edition/build, activation status) before anything else.
1. **Read first.** Before answering any PC/Windows/game/app question, read `SYSTEM.md` + the relevant `FIX-LOG.md` issue. Never repeat a ❌ fix unless something changed.
2. **Log before acting.** Before giving any fix, setting change, restart, or reset: append it to `FIX-LOG.md` (⏳ pending) and save, THEN give the steps. The user restarts between attempts; unsaved work is lost.
3. **Record findings as you go.** Diagnostic results go into the issue's Findings section the same turn they're found, not at the end.
4. **Close the loop.** When the user reports back, update the result (✅/❌) and the issue status. If a change sticks, add it to `SYSTEM.md` → Applied settings.
5. **Keep SYSTEM.md current.** New driver, BIOS, hardware, app, or config change → update it immediately.
6. **New issue = new numbered section** in `FIX-LOG.md` (Status line, Findings, Fixes table).
7. **Safety.** Read-only checks are fine to run. Anything that changes the system (registry, BIOS, drivers, deleting files) gets explained and confirmed with the user first. Back up a file before editing it. Admin-only steps go to the user.
