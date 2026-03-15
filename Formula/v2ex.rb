class V2ex < Formula
  desc "V2EX command line client"
  homepage "https://github.com/adevjoe/v2ex-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adevjoe/v2ex-cli/releases/download/v#{version}/v2ex-aarch64-apple-darwin.tar.gz"
      sha256 "fef793517bee216f9274c0ec892f146c7f6fec51ad8491a2124c98195e7fda54"
    else
      url "https://github.com/adevjoe/v2ex-cli/releases/download/v#{version}/v2ex-x86_64-apple-darwin.tar.gz"
      sha256 "d7b212e254d6bde9ca9e046714377ab719233a5a0278d2718f81d1a4eaa2d749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/adevjoe/v2ex-cli/releases/download/v#{version}/v2ex-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e43be1a4a5d92c9ddbb8fec1a596ed7bcac94d02e848c001fa8c2d92ca079d0"
    else
      url "https://github.com/adevjoe/v2ex-cli/releases/download/v#{version}/v2ex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c7bb2b9b60b369b28ef866e5713d5e5372a044fa755b3b8db7b24c1877db53c"
    end
  end

  def install
    bin.install "v2ex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/v2ex --version")
  end
end
