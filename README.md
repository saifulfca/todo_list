# TaskNest — Professional To-Do

A polished, single-file to-do app that runs **entirely offline in your browser**. No build step, no server, no dependencies — just open `index.html`.

> Organize. Prioritize. Done.

## Getting started

1. Download or clone this repo.
2. Double-click **`index.html`** (or open it in any modern browser).

That's it. All your data is saved automatically in the browser's local storage on your machine.

## Features

### Organization (OneNote-style notebooks)
- Separate **notebooks** for **Office**, **Personal**, **Other** — and create your own with custom colors.
- **All Tasks** view aggregates everything, with a source-notebook label on each task.
- **Tags** (`#urgent`, `#client`, …) shown as chips; click a tag to filter instantly.
- **Search** across titles, notes, tags, and checklist items (press `/` to jump to search).

### Task management
- **Priority**: High / Medium / Low, with colored accents and priority-aware sorting.
- **Deadlines** with date + time, and smart labels — **Overdue**, **Today**, **Tomorrow**.
- **Mark complete** with a click; done tasks grey out and **auto-sink to the bottom**.
- **Recurring tasks** 🔁 — Daily / Weekly / Monthly. Completing one auto-schedules the next occurrence.
- **Subtasks / checklists** ☑ — each with its own checkbox and a live progress bar.
- **Inline editing** — double-click a title to rename; expand a task to edit priority, deadline, repeat, tags, and notes.

### Sorting & views
- **Smart sort** — automatic ordering by priority, then deadline.
- **Manual order** — drag and drop tasks into any order you like.
- Filters: **All / Active / Completed / High priority / Due soon**.

### Calendar integration
- **📅 Add to Google Calendar** — opens a pre-filled event (title, notes, priority, deadline, recurrence). No API keys or setup required.
- **📆 Export .ics** — download a standard calendar file for a single task or for every scheduled task in a notebook (works with Apple Calendar, Outlook, etc.).

### Data & appearance
- **Auto-save** to browser local storage.
- **Backup / Restore** — export all data to a JSON file and re-import it on any machine.
- **Dark mode** 🌙.
- **Responsive** — works on desktop and mobile with a slide-out sidebar.

## Privacy

Everything runs locally in your browser. No data ever leaves your device (except when you explicitly open Google Calendar or export a file).

## Tech

Plain HTML, CSS, and vanilla JavaScript in one self-contained file — no frameworks, no network calls.
