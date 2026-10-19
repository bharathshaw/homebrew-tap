# Spent: a menu bar app showing Claude Code and Codex plan usage, renew times and spend.
# Homebrew downloads the zip below, checks it against this SHA-256 fingerprint, and refuses it if it doesn't
# match. The app goes in Applications and adds itself to Login Items the first time it opens.
cask "spent" do
  version "2026.10.20.69"
  sha256 "d903e4ccf2156e7d920fb1fc2e6da56adb1615f552e8297e63f82cddad8d0c94"

  url "file:///private/tmp/claude-501/-Users-bharathlayerpath/c75dc966-020b-425e-9d70-a5c6e7445bc2/scratchpad/Spent.zip"
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
