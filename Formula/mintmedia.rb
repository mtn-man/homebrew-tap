class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.2/mintmedia_v0.1.2_darwin_amd64.tar.gz"
      sha256 "c446ba59ced225e8b97f8c35a1445b6aa973be231bdd045f66f650c9a79facb2"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.2/mintmedia_v0.1.2_darwin_arm64.tar.gz"
      sha256 "8c946aef576e85c8df787b2a0eaa7499991269934f70685fcc571b0093f30cc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.2/mintmedia_v0.1.2_linux_amd64.tar.gz"
      sha256 "302a3aae1ab657da3e973b55b5ba2a6d423b9c8dcdf4c55a068b52abbd136704"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.2/mintmedia_v0.1.2_linux_arm64.tar.gz"
      sha256 "2205652bfd2923f4aaa0305a3f8e1f32339ebe80d30c83e43bb28256348d285c"
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
    assert_match "mintmedia v0.1.2", shell_output("#{bin}/mintmedia --version")
  end
end
