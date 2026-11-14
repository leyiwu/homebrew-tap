cask "close-in-mission-control" do
  version "0.1.7"
  sha256 "eae0cdc8b4c68d46b6608d811fe79c0d9af00b5d286247d85a2d6b6689932ca8"

  url "https://github.com/leyiwu/close-in-mission-control/releases/download/v#{version}/Close-in-Mission-Control-#{version}.zip"
  name "Close in Mission Control"
  desc "Adds a close button to window thumbnails in Mission Control"
  homepage "https://github.com/leyiwu/close-in-mission-control"

  depends_on macos: :sonoma

  app "Close in Mission Control.app"

  zap trash: [
    "~/Library/Logs/CloseInMissionControl",
    "~/Library/Preferences/org.closeinmissioncontrol.app.plist",
  ]

  caveats <<~EOS
    #{token} is not notarized by Apple, so macOS blocks its first launch.
    Open it once, then allow it in System Settings → Privacy & Security → Open Anyway,
    or run:
      xattr -dr com.apple.quarantine "#{appdir}/Close in Mission Control.app"

    It then asks for Accessibility access, which it needs to work.
  EOS
end
