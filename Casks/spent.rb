# Spent: a menu bar app showing Claude Code and Codex plan usage, renew times and spend.
# Homebrew downloads the zip below, checks it against this SHA-256 fingerprint, and refuses it if it doesn't
# match. The app goes in Applications and adds itself to Login Items the first time it opens.
cask "spent" do
  version "2026.10.20.74"
  sha256 "3de36144307f757e6b14092f9152388a989a0bc1f2715ae09d8638f1df7e1e3e"

  url "https://github.com/bharathshaw/homebrew-tap/releases/download/spent-#{version}/Spent.zip"
  name "Spent"
  desc "Menu bar app for Claude Code and Codex plan usage, renew times and spend"
  homepage "https://github.com/bharathshaw/homebrew-tap"

  depends_on macos: :sonoma

  app "Spent.app"

  # Homebrew has checked the download's fingerprint, so the app opens straight away: macOS's "can't check this
  # app" stop is cleared, and the app is opened, so the first-run panel appears right after the install line.
  # (Opening has to use the older hook: the newer sandboxed steps can't launch an app. Homebrew prints a
  # deprecation warning for it.)
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Spent.app"]
  end

  postflight do
    system_command "/usr/bin/open", args: ["#{appdir}/Spent.app"]
  end

  uninstall quit: "com.bharath.spent"

  zap trash: [
    "~/.cache/spent",
    "~/Library/Caches/com.bharath.spent",
    "~/Library/HTTPStorages/com.bharath.spent",
    "~/Library/Preferences/com.bharath.spent.plist",
  ]

  caveats <<~TEXT
    Spent is open: look up at your menu bar. macOS will ask to let "security" (its own keychain tool,
    which Spent uses) read your Claude Code login, once per account: choose Always Allow.
    It starts at login from then on (turn that off in System Settings > General > Login Items).
  TEXT
end
