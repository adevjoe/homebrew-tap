cask "mushroom" do
  version "0.1.0"
  sha256 "f3c3881ed3411668a4495805f791979c52387d5e2f04efa5325f1b7812e38d85"

  url "https://api.github.com/repos/adevjoe/mushroom/releases/assets/469100546",
      verified: "api.github.com/repos/adevjoe/mushroom/",
      header: [
        "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
        "Accept: application/octet-stream",
      ]
  name "mushroom"
  desc "Control panel for AI coding agent assets"
  homepage "https://github.com/adevjoe/mushroom"

  app "mushroom.app"

  zap trash: [
    "~/.mushroom",
    "~/Library/Application Support/dev.mushroom.desktop",
  ]
end
