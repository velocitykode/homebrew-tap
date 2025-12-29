class Velocity < Formula
  desc "CLI for the Velocity Go web framework"
  homepage "https://github.com/velocitykode/velocity-cli"
  url "https://github.com/velocitykode/velocity-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2d4209bba010d38604535cd9cf4b20de612af55162b8f6a4ce1a31cb3f928e05"
  license "MIT"
  head "https://github.com/velocitykode/velocity-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"velocity"
  end

  test do
    assert_match "VELOCITY CLI", shell_output("#{bin}/velocity version")
  end
end
