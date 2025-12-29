class Velocity < Formula
  desc "CLI for the Velocity Go web framework"
  homepage "https://github.com/velocitykode/velocity-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.3/velocity-darwin-arm64.tar.gz"
      sha256 "9cb6e3bcd87bf04ad28412fe6e64715e2e5be7b962db8303589c5d353fed4918"
    end
    on_intel do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.3/velocity-darwin-amd64.tar.gz"
      sha256 "277b2a10c9b196e072c445275796ce879538e2ae093abfbfaaba0b79385f946e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "velocity-darwin-arm64" => "velocity"
    else
      bin.install "velocity-darwin-amd64" => "velocity"
    end
  end

  test do
    assert_match "VELOCITY CLI", shell_output("#{bin}/velocity version")
  end
end
