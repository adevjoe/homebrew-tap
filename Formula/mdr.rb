class Mdr < Formula
  desc "Render Markdown in the terminal with CJK-aware wrapping and tables"
  homepage "https://github.com/adevjoe/mdr"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.0/mdr-aarch64-apple-darwin.tar.gz"
      sha256 "2b14626cfaaca0448d498895fa327d41e5d1595dbbeed60f7e0eecdec7b28cb9"
    end
    on_intel do
      url "https://github.com/adevjoe/mdr/releases/download/v0.1.0/mdr-x86_64-apple-darwin.tar.gz"
      sha256 "9a39fed1b08f9b967e3d5efceefbf0740fb8de3edda5d70c5e24588fd7140928"
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
