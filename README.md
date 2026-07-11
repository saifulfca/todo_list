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

### Google Tasks &amp; Google Calendar sync
Each task has **two separate, branded push buttons** with a live status dot (grey = not pushed, green = synced):

- **Calendar** — pushes the task to **Google Calendar** as an event (with recurrence).
- **Tasks** — pushes the task to **Google Tasks**, including its checklist items as **subtasks**.

When you **connect Google** (see setup below), pushing creates the real item and links it. After that, **any change you make in the app — edit, complete, add/tick checklist items, or delete — syncs automatically** to Google Tasks/Calendar.

**No-setup fallbacks** (work straight from a local file, no account connection):
- The **Calendar** button opens a pre-filled Google Calendar event.
- **📆 Export .ics** downloads a standard calendar file for a task or a whole notebook (works with Apple Calendar, Outlook, etc.).

## Connecting Google (one-time, free)

Real Google **Tasks** sync requires the Google API, which needs OAuth. Because Google sign-in does **not** work from `file://`, host the app on an `http(s)` origin first (GitHub Pages or a local server), then:

1. Open the [Google Cloud Console](https://console.cloud.google.com/) and create a project.
2. Enable the **Google Tasks API** and **Google Calendar API**.
3. Configure the **OAuth consent screen** (External) and add your Google account as a **test user**.
4. Create an **OAuth client ID** → application type **Web application**.
5. Under **Authorized JavaScript origins**, add the exact origin where the app is served, e.g.
   - `https://YOUR-USERNAME.github.io` (GitHub Pages), or
   - `http://localhost:8000` (local server).
6. In the app, click **Connect Google**, paste the **Client ID**, and hit **Save & Connect**.

### Hosting options
- **GitHub Pages:** In the repo, go to **Settings → Pages → Build and deployment → Source: Deploy from a branch**, pick `main` / `/ (root)`, save. Your app will be live at `https://YOUR-USERNAME.github.io/todo_list/`.
- **Local server:** from the project folder run `python -m http.server 8000`, then open `http://localhost:8000`.

### Data & appearance
- **Auto-save** to browser local storage.
- **Backup / Restore** — export all data to a JSON file and re-import it on any machine.
- **Dark mode** 🌙.
- **Responsive** — works on desktop and mobile with a slide-out sidebar.

## Privacy

Everything runs locally in your browser. Your tasks are stored only in your browser's local storage. Data leaves your device only when you explicitly push to Google (Tasks/Calendar), open a pre-filled calendar event, or export a file. Your Google OAuth Client ID is stored locally and used only to talk to Google's APIs directly from your browser.

## Tech

Plain HTML, CSS, and vanilla JavaScript in one self-contained file — no build step and no backend. Optional Google sync uses Google's official client libraries (loaded only when online) with the Tasks and Calendar APIs.
