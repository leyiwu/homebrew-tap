cask "close-in-mission-control" do
  version "0.1.6"
  sha256 "93f5290e32864e76a3a8fd15a258ae7c22a7a985843898ebdeff7d7dcd01e991"

  url "https://github.com/leyiwu/close-in-mission-control/releases/download/v#{version}/Close-in-Mission-Control-#{version}.zip"
  name "Close in Mission Control"
  desc "Adds a close button to window thumbnails in Mission Control"
  homepage "https://github.com/leyiwu/close-in-mission-control"

  depends_on macos: :sonoma

  app "Close in Mission Control.app"

  zap trash: "~/Library/Logs/CloseInMissionControl"

  caveats <<~EOS
    #{token} is not notarized by Apple, so macOS blocks its first launch.
    Open it once, then allow it in System Settings → Privacy & Security → Open Anyway,
    or run:
      xattr -dr com.apple.quarantine "#{appdir}/Close in Mission Control.app"

    It then asks for Accessibility access, which it needs to work.
  EOS
end
