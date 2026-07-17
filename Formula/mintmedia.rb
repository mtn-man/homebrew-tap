class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.3"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.3/mintmedia_v0.1.3_darwin_amd64.tar.gz"
      sha256 "86a4edcc834b04027f36aa6c080aece925b1c672e16faa087f58a366866bbada"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.3/mintmedia_v0.1.3_darwin_arm64.tar.gz"
      sha256 "8aeb55606b9c5d009327d685ee67611da90b9f3946cf4defa37e22cfef4bd650"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.3/mintmedia_v0.1.3_linux_amd64.tar.gz"
      sha256 "83fc87326609e7756210a9af6c607957631e9b6ddda643e749dee899d263571e"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.3/mintmedia_v0.1.3_linux_arm64.tar.gz"
      sha256 "7cca229e61716cbcf53ef2a7ff86b67ba18aede81b7b31e3c64eecc0094ddc45"
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
    assert_match "mintmedia v0.1.3", shell_output("#{bin}/mintmedia --version")
  end
end
