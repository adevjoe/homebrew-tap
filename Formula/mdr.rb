class Mdr < Formula
  desc "Render Markdown in the terminal with CJK-aware wrapping and tables"
  homepage "https://github.com/adevjoe/mdr"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.3/mdr-aarch64-apple-darwin.tar.gz"
      sha256 "b54957dd68fd9a6f5de68e058b843625c03feb8e1733fc0773ccbdbaf4e51ffa"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.3/mdr-x86_64-apple-darwin.tar.gz"
      sha256 "9c75abd043783c103b9e526b7a2e6ee36d20a15504edb8470b54fb37216188b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.3/mdr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "684b792fa178c9d5fa94c20fa10ad06f4ca09cb939edf9f688b35b61d1fb4570"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.3/mdr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a5291eeb866a2520c429471d0ba485a608e964c8806288df84a3a33b58e64a23"
    end
  end

  def install
    bin.install "mdr"
  end

  test do
    (testpath/"t.md").write <<~MD
      # 你好

      | 名称 | 值 |
      |------|----|
      | 中文 | 1  |
    MD
    output = shell_output("#{bin}/mdr --no-color --width 40 t.md")
    assert_match "你好", output
    assert_match "│ 中文 │ 1  │", output
    assert_match version.to_s, shell_output("#{bin}/mdr --version")
  end
end
