cask "close-in-mission-control" do
  version "0.1.1"
  sha256 "88740afadb0a68a8b7afbd6bd94cb05a9f359b62cf6befde27a114da6b250d56"

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
