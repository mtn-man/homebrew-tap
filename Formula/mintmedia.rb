class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.6"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.6/mintmedia_v0.1.6_darwin_amd64.tar.gz"
      sha256 "a78abbab1cc78637b8de35326bd8044e54477e7164724b6c26cfa0c67a30919e"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.6/mintmedia_v0.1.6_darwin_arm64.tar.gz"
      sha256 "18101f77207a24d2154aeb763bad59c33e2085abfa392dde59e0737adc536bbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.6/mintmedia_v0.1.6_linux_amd64.tar.gz"
      sha256 "24843768bf360b0fde066b93cbc7abef639be38537dee64a7e7c59f0565c4fc3"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.6/mintmedia_v0.1.6_linux_arm64.tar.gz"
      sha256 "3e6bda4ceb14c658a8d854ee486d19a6a7c5243b3b2188fd6cb0cc8c4a97ad2d"
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
    assert_match "mintmedia v0.1.6", shell_output("#{bin}/mintmedia --version")
  end
end
