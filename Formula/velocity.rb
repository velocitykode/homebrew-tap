class Velocity < Formula
  desc "CLI for the Velocity Go web framework"
  homepage "https://github.com/velocitykode/velocity-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.1/velocity-darwin-arm64.tar.gz"
      sha256 "73bea10efcb70abbade066e24069344dff9cb6da65ce20f353ad496b9295a45e"
    end
    on_intel do
      url "https://github.com/velocitykode/velocity-cli/releases/download/v0.1.1/velocity-darwin-amd64.tar.gz"
      sha256 "a10ac6c8827250f4ac90cc3de88ac581c7eb7ebd23d3dde7508c2c5d91ab25ca"
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
