cask "codepuppy" do
  version "0.2.1"
  sha256 "a6e603e4adf582d944a15834ac0f10115097c08b21eeb182b37fba601ff557d1"

  url "https://github.com/timothymhowe/codebuddy/releases/download/v#{version}/CodePuppy-#{version}.zip"
  name "CodePuppy"
  desc "Floating 3D desktop companion for Claude Code"
  homepage "https://github.com/timothymhowe/codebuddy"

  depends_on macos: ">= :ventura"

  app "CodePuppy.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodePuppy.app"],
                   sudo: false
  end

  zap trash: ["~/.codebuddy"]
end
