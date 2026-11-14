cask "close-in-mission-control" do
  version "0.1.5"
  sha256 "d1e01d285ee15434d2bb1370f79a102e2f4fff3afc08b8514d19380eb8a1d310"

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
