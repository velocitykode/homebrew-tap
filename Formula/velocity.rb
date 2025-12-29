class Velocity < Formula
  desc "CLI for the Velocity Go web framework"
  homepage "https://github.com/velocitykode/velocity-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.2/velocity-darwin-arm64.tar.gz"
      sha256 "aaf0d2102e59424cc9911a13a5a9ea651e1d5041c0c0b7366305e387e0a20bd5"
    end
    on_intel do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.2/velocity-darwin-amd64.tar.gz"
      sha256 "2457c7fffa06646284aefad73a292d10ee44544b93aa40d69fbd0fe487948dd6"
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
