cask "mushroom" do
  version "0.1.1"
  sha256 "3b785232aae818d20e3673cbdc371c4760d6c4497fb83645acfe65efa2d267b4"

  url "https://api.github.com/repos/adevjoe/mushroom/releases/assets/470919301",
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
