class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_darwin_amd64.tar.gz"
      sha256 "c98fd0eb186bb50f6e122a6a6b81047bc012da3d58e2b8a47c647ae2fb7bfc55"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_darwin_arm64.tar.gz"
      sha256 "6f0b8b5b27cead41db53b8c17e0bb25edb5151d363e446ccc4c93e76b396968d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_linux_amd64.tar.gz"
      sha256 "b80d50d1ae3e3038951701e05790157f38d574d349d60ebc0eb27ea0f0258402"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.0/mintmedia_v0.1.0_linux_arm64.tar.gz"
      sha256 "432b7b06b2881579a681363a9429496868426f42f5fa4902dd86c9c966cbe89f"
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
