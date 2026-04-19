cask "codebuddy" do
  version "0.1.1"
  sha256 "5bd02a17ed90341ea0a9895264ad00673be9b9d53615d9f48b253f86ccd8c462"

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
