class Mdr < Formula
  desc "Render Markdown in the terminal with CJK-aware wrapping and tables"
  homepage "https://github.com/adevjoe/mdr"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.2/mdr-aarch64-apple-darwin.tar.gz"
      sha256 "e39b6b116e2de14bd0f50ea7cf64a592b28b29305aaef2bbe6922e432dfe8703"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.2/mdr-x86_64-apple-darwin.tar.gz"
      sha256 "ce336739a3720c000234b2dfa6c19dcfdc4b35d04d193a6f284744b4cfa998c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.2/mdr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "607d1217be2b74c9351afe0aac4b96bef3c19c42ee7df89f70fa88a5310e28f2"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.2/mdr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bca17dac7d96b8200da9bbb6b69a322c0a72761453b1cddce6a0ac64fb6536a5"
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
