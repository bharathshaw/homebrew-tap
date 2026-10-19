# Caliper: a menu bar app showing Claude Code and Codex plan usage, renew times and spend.
# Homebrew downloads the zip below, checks it against this SHA-256 fingerprint, and refuses it if it doesn't
# match. The app goes in Applications and adds itself to Login Items the first time it opens.
cask "caliper" do
  version "2026.10.20.64"
  sha256 "02d2f71404b4820565832d1cda178915ef260d1f8501d5181697359c3b176c58"

  url "https://github.com/bharathshaw/homebrew-tap/releases/download/caliper-#{version}/Caliper.zip"
  name "Caliper"
  desc "Menu bar app for Claude Code and Codex plan usage, renew times and spend"
  homepage "https://github.com/bharathshaw/homebrew-tap"

  depends_on macos: :sonoma

  app "Caliper.app"

  uninstall quit: "com.bharath.caliper"

  zap trash: [
    "~/.cache/caliper",
    "~/Library/Caches/com.bharath.caliper",
    "~/Library/HTTPStorages/com.bharath.caliper",
    "~/Library/Preferences/com.bharath.caliper.plist",
  ]

  caveats <<~TEXT
    Open Caliper from Applications. The first time, macOS stops it because it isn't signed by Apple:
    open System Settings > Privacy & Security, scroll down and click Open Anyway (once).
    Then macOS asks to let "security" (its own keychain tool, which Caliper uses) read your Claude Code
    login, once per account: choose Always Allow.
    It starts at login from then on (turn that off in System Settings > General > Login Items).
    After brew upgrade, macOS may ask for Open Anyway once more.
  TEXT
end
