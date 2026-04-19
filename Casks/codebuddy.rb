cask "codebuddy" do
  version "0.1.0"
  sha256 "2d32c1b52040d3b109e3973db160f2208e4e8c4824d4cbfd6c0d1778fa81e881"

  url "https://github.com/timothymhowe/codebuddy/releases/download/v#{version}/CodeBuddy-#{version}.zip"
  name "CodeBuddy"
  desc "Floating 3D desktop companion for Claude Code"
  homepage "https://github.com/timothymhowe/codebuddy"

  depends_on macos: ">= :ventura"

  app "CodeBuddy.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodeBuddy.app"],
                   sudo: false
  end

  zap trash: ["~/.codebuddy"]
end
