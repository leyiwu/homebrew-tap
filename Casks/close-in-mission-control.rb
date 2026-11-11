cask "close-in-mission-control" do
  version "0.1.3"
  sha256 "c679fcb8b558fd39acf810b86230cffa5fab9e7cfbbc7750ab21caaec8c9eef7"

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
