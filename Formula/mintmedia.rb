class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.4"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.4/mintmedia_v0.1.4_darwin_amd64.tar.gz"
      sha256 "09497a6a3dc5bbb7a61f2ee9d531b78353bf2099ac4640a0938cfd5616ae6049"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.4/mintmedia_v0.1.4_darwin_arm64.tar.gz"
      sha256 "4dffd1c0f9d60f7528d05043988c90119b1c5162588fed431fb9d50c848f6ed2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.4/mintmedia_v0.1.4_linux_amd64.tar.gz"
      sha256 "77ef23f6d7e7e8cfa73bea61576a519da3d549ff930cbaa3053747c53697cbc2"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.4/mintmedia_v0.1.4_linux_arm64.tar.gz"
      sha256 "2c5f630235487abf57ee5e5bbde14d5b47e4e90ebb68b955deabe38069b84c9d"
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
    assert_match "mintmedia v0.1.4", shell_output("#{bin}/mintmedia --version")
  end
end
