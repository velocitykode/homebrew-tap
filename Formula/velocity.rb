class Velocity < Formula
  desc "CLI for the Velocity Go web framework"
  homepage "https://github.com/velocitykode/velocity-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.5/velocity-darwin-arm64.tar.gz"
      sha256 "e0d302867d51121059b931e4f4d08467aa582b83c464ad733caec1f24ee6fe78"
    end
    on_intel do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.5/velocity-darwin-amd64.tar.gz"
      sha256 "a189f9354e1e69e907cdf03c0e09f306588e514c891307f6c4a94e8214dadf1e"
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
