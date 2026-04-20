cask "codepuppy" do
  version "0.2.0"
  sha256 "e26a6a2bf88bc514f1d682f0b90f931b9d01e0c767aa357a77418005f03734d1"

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
