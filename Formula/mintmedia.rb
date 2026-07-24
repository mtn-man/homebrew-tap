class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.5"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.5/mintmedia_v0.1.5_darwin_amd64.tar.gz"
      sha256 "01c36d9357511c49f17365f485fde12f4b0aa19b3dbaf17e9f32060c1e8cdc6d"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.5/mintmedia_v0.1.5_darwin_arm64.tar.gz"
      sha256 "affcb3c64672c4b893e455a3125d97d7b76efb04b6fb643bedc1ab1fda7da0d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.5/mintmedia_v0.1.5_linux_amd64.tar.gz"
      sha256 "8f14592f93a1aaaa947cd02c90fa9bbab288b5887b8d8db8e69eba80c3876592"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.5/mintmedia_v0.1.5_linux_arm64.tar.gz"
      sha256 "990aa323c43730520bd98295526391fd5f1b3c1c01ba5366af219cb98adf3eaa"
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
    assert_match "mintmedia v0.1.5", shell_output("#{bin}/mintmedia --version")
  end
end
