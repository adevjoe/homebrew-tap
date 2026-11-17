class Mdr < Formula
  desc "Render Markdown in the terminal with CJK-aware wrapping and tables"
  homepage "https://github.com/adevjoe/mdr"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.1/mdr-aarch64-apple-darwin.tar.gz"
      sha256 "ced9c8841dd97c4e5d90ecf095a720537d55ee746dc0d6be9726f777ee53ede0"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.1/mdr-x86_64-apple-darwin.tar.gz"
      sha256 "81ede7564c51c332911428d989cc79b8fd186e9c41f0cf8a51cbbcbf7ddc6939"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.1/mdr-aarch64-unknown-linux-musl.tar.gz"
      sha256 "157ea7cc1034824a41a317396da58e9ab97fc3dea572e7512af9a4533e22db3a"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.1/mdr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dbac69258867df2670660aa2e829e8a84722ecd5641185d571c7f14954f2e087"
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
