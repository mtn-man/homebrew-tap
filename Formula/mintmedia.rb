class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.1/mintmedia_v0.1.1_darwin_amd64.tar.gz"
      sha256 "87185f2cca6d3498ac998dceb80247233d81d91446b9874556e0a7e78f1e211c"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.1/mintmedia_v0.1.1_darwin_arm64.tar.gz"
      sha256 "cee4844a88a065081aa58540380e7cc96e35062ffa7bf1da909d10ba86228535"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.1/mintmedia_v0.1.1_linux_amd64.tar.gz"
      sha256 "07283c12c3718e25563c2e194d525675a66fe48e59cfd6866bc7820e726dde62"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.1/mintmedia_v0.1.1_linux_arm64.tar.gz"
      sha256 "28810a5cc0c4b987192ffd4852422f6c16e30080c39d257d33487d915f8276e9"
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
    assert_match "mintmedia v0.1.1", shell_output("#{bin}/mintmedia --version")
  end
end
