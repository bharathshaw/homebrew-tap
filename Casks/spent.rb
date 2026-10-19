# Spent: a menu bar app showing Claude Code and Codex plan usage, renew times and spend.
# Homebrew downloads the zip below, checks it against this SHA-256 fingerprint, and refuses it if it doesn't
# match. The app goes in Applications and adds itself to Login Items the first time it opens.
cask "spent" do
  version "2026.10.20.74"
  sha256 "9c21772b72de0075f3e9e87f8b0bc16c806e394cd191767b6eede1c2511e1a3f"

  url "https://github.com/bharathshaw/homebrew-tap/releases/download/spent-#{version}/Spent.zip"
  name "Spent"
  desc "Menu bar app for Claude Code and Codex plan usage, renew times and spend"
  homepage "https://github.com/bharathshaw/homebrew-tap"

  depends_on macos: :sonoma

  app "Spent.app"

  uninstall quit: "com.bharath.spent"

  zap trash: [
    "~/.cache/spent",
    "~/Library/Caches/com.bharath.spent",
    "~/Library/HTTPStorages/com.bharath.spent",
    "~/Library/Preferences/com.bharath.spent.plist",
  ]

  caveats <<~TEXT
    Open Spent from Applications. The first time, macOS stops it because it isn't signed by Apple:
    open System Settings > Privacy & Security, scroll down and click Open Anyway (once).
    Then macOS asks to let "security" (its own keychain tool, which Spent uses) read your Claude Code
    login, once per account: choose Always Allow.
    It starts at login from then on (turn that off in System Settings > General > Login Items).
    After brew upgrade, macOS may ask for Open Anyway once more.
  TEXT
end
