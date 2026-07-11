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
- **Today** smart view — everything due today or overdue, across every notebook, in one place.
- **Tags** (`#urgent`, `#client`, …) shown as chips; click a tag to filter instantly.
- **Search** across titles, notes, tags, and checklist items (press `/` to jump to search).

### ⚡ Natural-language quick add
Type everything into the title box and it's parsed automatically — no need to open the detail fields:

- `#tag` → adds tags
- `@notebook` → files it in that notebook (matches by name or prefix, e.g. `@per` → Personal)
- `!high` / `!med` / `!low` (or `!!!` / `!!`) → sets priority
- natural dates → sets the deadline, e.g. **tomorrow 5pm**, **by Friday**, **Jan 15**, **in 3 days**
- repeats → **every Monday**, **daily**, **weekly**, **monthly**

Example: `Pay rent tomorrow 5pm #home !high @Personal` becomes a High-priority task in Personal, tagged `home`, due tomorrow at 5pm. (Anything you set in the detail fields still wins.)

### 📷 Scan tasks from a screenshot (OCR)
Turn an image into tasks — great for emails, meeting notes, or numbered/bulleted lists.

- Click **Scan** (in the add-task bar), then **drop an image, browse, or paste** (Ctrl/⌘+V) a screenshot.
- The app reads the text in your browser (via [Tesseract.js](https://tesseract.js.org/) — no upload to any server) and **splits it into separate tasks**, handling `1.`, `1)`, `-`, `*`, `•`, and checkbox markers, while ignoring email headers and greetings.
- Each task is **auto-assigned a notebook** (from keywords / matching notebook names), a **priority** (e.g. "urgent"/"asap" → High), a **deadline** when a date/time is present (e.g. "by Friday", "tomorrow at 9am", "Jan 15 5pm", "2026-04-15", "in 3 days", "tonight"), and a **repeat** when detected (e.g. "every Monday" → weekly).
- A review step lets you **edit each title, change the notebook/priority/deadline, include or exclude lines**, or tweak the raw recognized text and re-parse — then create them all at once.

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
- **Clear completed** — tidy a view in one click (with an **Undo**).

### 🔔 Reminders & productivity polish
- **Due reminders** — flip on the bell in the top bar to get a browser notification when a task falls due (opt-in; runs while the app is open).
- **Undo** — deleting a task (or clearing completed) shows an **Undo** for a few seconds; nothing is removed from Google until the window passes.
- **Confetti** 🎉 — a little celebration when you finish everything in a view.
- **Keyboard shortcuts** — `/` to search, `n` for a new task, `Esc` to close dialogs.

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

Everything runs locally in your browser. Your tasks are stored only in your browser's local storage. Data leaves your device only when you explicitly push to Google (Tasks/Calendar), open a pre-filled calendar event, or export a file. Your Google OAuth Client ID is stored locally and used only to talk to Google's APIs directly from your browser. **OCR runs entirely on your device** — screenshots are never uploaded anywhere.

## Tech

Plain HTML, CSS, and vanilla JavaScript in one self-contained file — no build step and no backend. Optional Google sync uses Google's official client libraries (loaded only when online) with the Tasks and Calendar APIs. Screenshot OCR uses Tesseract.js, loaded on demand from a CDN (needs internet the first time you scan).
