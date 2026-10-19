# Caliper

A menu bar app that shows, for each of your Claude Code (and Codex) accounts, how much of the 5-hour plan
limit is used, when it renews, and what your usage is worth at API prices. macOS 14 or later.

```
brew install bharathshaw/tap/caliper
```

Then open **Caliper** from Applications. The first time, macOS stops it because it isn't signed by Apple:
open **System Settings > Privacy & Security**, scroll down and click **Open Anyway** (once). Then macOS asks to
let **security** (its own keychain tool, which Caliper uses) read your Claude Code login, once per account:
choose **Always Allow**. It starts at login from then on (turn that off in System Settings > General > Login Items).

Update with `brew upgrade caliper` (macOS may ask for Open Anyway once more). Remove with `brew uninstall caliper` (add `--zap` to also delete
its cache of usage numbers).

## Privacy and security

- **Your Claude login** is read from the macOS keychain only to ask Anthropic for your plan usage (the same
  numbers as `/usage` in Claude Code). It's sent only to `api.anthropic.com`, and never saved, shown or logged.
- **Spend** is worked out on your Mac from Claude Code's own log files. Only token counts are used, never your
  messages. Nothing about it leaves your Mac.
- **Codex** is read from its local log files only; nothing is sent anywhere. From Codex's login file, only the
  account name and whether it's an API key are taken: when the account is first seen, and again only if that
  login changes.
- **What's kept:** your plan usage (as Anthropic returns it), spend totals and how far each log has been read, in
  `~/.cache/caliper`, which only you can open. Never a login, never a message.
- No analytics, no tracking, no other internet use.
- Homebrew checks the app's SHA-256 fingerprint before installing, and macOS checks the app the first time it
  opens. The app isn't signed by Apple: it's a personal tool shared with friends.

This repo holds only the install recipe and the app; the source code is private.
Spend is the API-price value of your usage, not a bill. Not affiliated with Anthropic or OpenAI.
