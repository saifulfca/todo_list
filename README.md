# TaskNest — Professional To-Do

A polished, single-file to-do app that runs **entirely offline in your browser**. No build step, no server, no dependencies — just open `index.html`.

> Organize. Prioritize. Done.

## Getting started

**Use it online (recommended):** once GitHub Pages finishes its first deploy, the app is live at
**https://saifulfca.github.io/todo_list/** — this is required for Google sign-in, reminders, and installing it as an app.

**Run it seamlessly on Windows (best for local use — no installs, data never lost):**
1. Download this repo (**Code → Download ZIP**) and unzip it to a folder you'll keep (e.g. `Documents\TaskNest`).
2. Double-click **`Start TaskNest.bat`**.
3. Your browser opens the app and it just works. Your tasks are saved to **`tasknest-data.json`** in that folder, and reload automatically every time.

**Optional — put an icon on your Desktop:** double-click **`Create Desktop Shortcut.bat`** once. It adds a **TaskNest** icon to your Desktop; from then on just double-click that to launch the app like any normal program.

Because your data lives in a real file on disk (managed by the launcher, not the browser), **clearing your browsing data has no effect at all** — the app reopens with everything intact, no re-linking, no clicks. The launcher uses only Windows' built-in PowerShell (no Node, Python, or any install). Keep the small black window open while you use the app; close it to stop.

> First run: if Windows SmartScreen warns about the `.bat`, click **More info → Run anyway** (it's your own file). This is normal for downloaded scripts.

**Or just open the file (simplest):**
1. Download or clone this repo.
2. Double-click **`index.html`** in Chrome or Edge.

This works, but data is kept in the browser's local storage (wiped if you clear browsing data). To keep it safe in this mode, use **💾 Save to a file** (see below).

## Install it as an app (PWA)

Open the live URL and either use the **⬇️ Install app** button in the sidebar, or your browser's **Install / Add to Home Screen** option. TaskNest then runs in its own window, has an app icon, and **works offline** thanks to a service worker that caches the app shell.

## Features

### Organization (OneNote-style notebooks)
- Separate **notebooks** for **Office**, **Personal**, **Other** — and create your own with custom colors.
- **All Tasks** view aggregates everything, with a source-notebook label on each task.
- **Today** smart view — everything due today or overdue, across every notebook, in one place.
- **Archiving** 📦 — notebooks whose tasks are all completed **auto-archive** (so the sidebar stays tidy), and you can archive any notebook by hand. Archived notebooks live in a collapsible **Archived** section, are hidden from All Tasks/Today, and can be restored in one click. Reopening or adding a task un-archives an auto-archived notebook automatically. Toggle auto-archive on/off inside the Archived section, which also **remembers whether it's expanded** between sessions.
- **Tags** (`#urgent`, `#client`, …) shown as chips; click a tag to filter instantly.
- **Search** across titles, notes, tags, and checklist items (press `/` to jump to search).

### ⚡ Natural-language quick add
Type everything into the title box and it's parsed automatically — no need to open the detail fields:

- `#Notebook` → files it in that notebook, **creating it if it doesn't exist** (use `#{Two Words}` for multi-word names; `@Notebook` works too)
- `+tag` → adds a tag (`+{multi word}` for multi-word tags)
- `!high` / `!med` / `!low` (or `!!!` / `!!`) → sets priority
- natural dates → sets the deadline, e.g. **by today 4pm**, **tomorrow 5pm**, **by Friday**, **Jan 15**, **in 3 days** (the "by …" phrase is trimmed from the title)
- repeats → **every Monday**, **daily**, **weekly**, **monthly**

Example: `I will finish the report by today 4 PM #Marketing !high` becomes a High-priority task titled "I will finish the report", filed in the **Marketing** notebook (created if new), due today at 4:00 PM. (Anything you set in the detail fields still wins.)

### 📷 Scan tasks from a screenshot (OCR)
Turn an image into tasks — great for emails, meeting notes, or numbered/bulleted lists.

- Click **Scan** (in the add-task bar), then **drop an image, browse, or paste** (Ctrl/⌘+V) a screenshot.
- The app reads the text in your browser (via [Tesseract.js](https://tesseract.js.org/) — no upload to any server) and **splits it into separate tasks**, handling `1.`, `1)`, `-`, `*`, `•`, and checkbox markers, while ignoring email headers and greetings.
- Each task is **auto-assigned a notebook** (from keywords / matching notebook names), a **priority** (e.g. "urgent"/"asap" → High), a **deadline** when a date/time is present (e.g. "by Friday", "tomorrow at 9am", "Jan 15 5pm", "2026-04-15", "in 3 days", "tonight"), and a **repeat** when detected (e.g. "every Monday" → weekly).
- A review step lets you **edit each title, change the notebook/priority/deadline, include or exclude lines**, or tweak the raw recognized text and re-parse — then create them all at once.

### Tasks & Projects 📊
Use the **Task / Project toggle** in the add bar:
- A **Task** has a single **deadline** (the default).
- A **Project** has a **start** and an **end** date. Projects show a live **time-progress bar** (percent of the timeline elapsed) with a "starts in / days left / ended" label, a date range, and a distinct blue accent. Use the checklist as project milestones.

Both live together under their notebook and on the calendar.

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

### 🗓 Calendar view
A full **month calendar** (in the sidebar) that shows your whole plan at a glance:
- **Tasks** appear as chips on their due date, colored by notebook (with "+N more" when a day is busy).
- **Projects** render as **bars that span across their start→end days** — including across week boundaries — stacked into lanes like a Gantt/Google-Calendar timeline.
- Navigate months with ‹ / › or jump to **Today**; today's cell is highlighted.
- Click any **task or project** to jump to it (and flash-highlight it); click a **day** to see everything happening that day.

### 📊 Insights dashboard
A dedicated **Insights** view (in the sidebar) with:
- KPIs — active, completed, overdue, and done-this-week.
- A **completion-rate ring** and a **7-day completions** bar chart.
- **Streaks** — your current daily-completion streak and personal best 🔥.
- Breakdowns **by notebook** and **active by priority**.
All rendered with pure HTML/CSS — no external chart libraries.

**Click any number to drill in:** every stat — on the Insights dashboard *and* the Today/All Tasks headers (Active, Overdue, Completed, Done-this-week, the 7-day bars, priority rows) — is clickable. Clicking it opens a list of exactly those tasks; click a task there to **jump straight to it and flash-highlight it**. Long lists get a **filter box** to quickly narrow them down. Clicking a notebook in the breakdown opens that notebook.

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

## Signing in with Google

The app has a **"Sign in with Google"** button (top bar → **Connect Google**). Click it, pick your Gmail account, approve access, and your tasks sync with Google Tasks & Calendar — just like signing into any other app.

**Why a one-time setup is still needed:** every "Sign in with Google" button (even Facebook's) is backed by a Google **OAuth Client ID** that the app owner registers once. To make the button truly one-click for everyone, create that Client ID once and paste it into the `GOOGLE_CLIENT_ID` constant near the top of `index.html` — then no one ever sees a setup screen again.

**Create the Client ID once (free):**
1. Open the [Google Cloud Console](https://console.cloud.google.com/) and create a project.
2. Enable the **Google Tasks API** and **Google Calendar API**.
3. Configure the **OAuth consent screen** (External) and add your Gmail as a **test user**.
4. Create an **OAuth client ID** → application type **Web application**.
5. Under **Authorized JavaScript origins**, add the exact origin where the app is served, e.g.
   - `https://saifulfca.github.io` (GitHub Pages), or
   - `http://localhost:8000` (local server).
6. Either **paste it into `GOOGLE_CLIENT_ID` in `index.html`** (best — makes the button one-click for everyone), **or** open the app → **Connect Google → ⚙ One-time setup** and paste it there (saved on your device).

> Note: Google sign-in doesn't work from `file://` — use the hosted URL or a local server.

### Hosting options
- **GitHub Pages:** In the repo, go to **Settings → Pages → Build and deployment → Source: Deploy from a branch**, pick `main` / `/ (root)`, save. Your app will be live at `https://YOUR-USERNAME.github.io/todo_list/`.
- **Local server:** from the project folder run `python -m http.server 8000`, then open `http://localhost:8000`.

### Data & appearance
- **Auto-save to a real file (recommended)** — link a file on your PC and every change is written to it automatically. See below.
- **Auto-save** to browser local storage (default cache).
- **Backup / Restore** — export all data to a JSON file and re-import it on any machine.
- **Dark mode** 🌙.
- **Responsive** — works on desktop and mobile with a slide-out sidebar.

## Never lose your data (save to a file on your PC)

By default the app stores data in the browser's local storage — which **gets wiped when you clear browsing data**. To keep your tasks safe permanently, link a real file on disk:

1. In the sidebar, click **💾 Save to a file**.
2. Click **Create / choose a data file** and save e.g. `tasknest-data.json` (put it in Documents).
3. That's it — TaskNest now **auto-saves every change to that file**.

Because the file lives on your disk (not in the browser), **clearing browsing data no longer deletes your tasks**. If you ever open the app and it looks empty (e.g. after clearing data or on a new browser), click **💾 Save to a file → Open an existing data file**, pick your `tasknest-data.json`, and everything is restored — then it keeps auto-saving there.

> This uses the File System Access API — available in **Chrome and Edge** on Windows (recommended for local use). In other browsers, use **⬇ Backup / ⬆ Restore** to save/load the JSON manually. For the smoothest experience, open the app from the hosted URL or a local server rather than `file://`.

## Privacy

Everything runs locally in your browser. Your tasks are stored only in your browser's local storage. Data leaves your device only when you explicitly push to Google (Tasks/Calendar), open a pre-filled calendar event, or export a file. Your Google OAuth Client ID is stored locally and used only to talk to Google's APIs directly from your browser. **OCR runs entirely on your device** — screenshots are never uploaded anywhere.

## Tech

Plain HTML, CSS, and vanilla JavaScript in one self-contained file — no build step and no backend. Optional Google sync uses Google's official client libraries (loaded only when online) with the Tasks and Calendar APIs. Screenshot OCR uses Tesseract.js, loaded on demand from a CDN (needs internet the first time you scan).
