class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_AMD64_SHA256"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64_SHA256"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
  end

  def install
    bin_name =
      if OS.mac? && Hardware::CPU.intel?
        "mintmedia_darwin_amd64"
      elsif OS.mac? && Hardware::CPU.arm?
        "mintmedia_darwin_arm64"
      elsif OS.linux? && Hardware::CPU.intel?
        "mintmedia_linux_amd64"
      elsif OS.linux? && Hardware::CPU.arm?
        "mintmedia_linux_arm64"
      else
        odie "Unsupported platform"
      end

    bin.install bin_name => "mintmedia"
  end

  test do
    assert_match "mintmedia v0.1.0", shell_output("#{bin}/mintmedia --version")
  end
end
