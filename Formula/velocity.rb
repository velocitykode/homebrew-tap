class Velocity < Formula
  desc "CLI for the Velocity Go web framework"
  homepage "https://github.com/velocitykode/velocity-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.4/velocity-darwin-arm64.tar.gz"
      sha256 "0bd479c7e5c4be7e9da5f588264df6f99655f8262ba3bb04eefde470f400014d"
    end
    on_intel do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.4/velocity-darwin-amd64.tar.gz"
      sha256 "4600befa1ef33ab9fec7a89a3c478aa396fcf989bc6a3baccd17af51debba713"
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
