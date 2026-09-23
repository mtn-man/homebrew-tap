class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.9"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.9/mintmedia_v0.1.9_darwin_amd64.tar.gz"
      sha256 "d5d304cf6c107c92beb03545f148868defb9f97c29b444b025d1055c1caf53f8"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.9/mintmedia_v0.1.9_darwin_arm64.tar.gz"
      sha256 "b8f08d52d3f12e39a4ec1e6ae6c96b02dd587f6d4cd394294bc3bb445e3bf9d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.9/mintmedia_v0.1.9_linux_amd64.tar.gz"
      sha256 "e00ec458c2d6f53d3043da301ae666c67a98342b7fae201d0c079f84ef2e990c"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.9/mintmedia_v0.1.9_linux_arm64.tar.gz"
      sha256 "128b3523cbd1dae3f54f0c8a09d29cebae8f3674d45e8cc671b873ace1b50ee1"
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
    assert_match "mintmedia v0.1.9", shell_output("#{bin}/mintmedia --version")
  end
end
