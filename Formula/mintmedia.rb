class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.8"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.8/mintmedia_v0.1.8_darwin_amd64.tar.gz"
      sha256 "7b594be814ba08842726f6ade67bc42b2512400ccf4d687197d7e01f83fbd048"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.8/mintmedia_v0.1.8_darwin_arm64.tar.gz"
      sha256 "22d081d77b767baa7d060ec005b28535d99912a31a1deba0843175e57f80b3c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.8/mintmedia_v0.1.8_linux_amd64.tar.gz"
      sha256 "7e3f8c659194160b34e47d526bc5f6a6e65c462def426bcc7d9e5b490ac03347"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.8/mintmedia_v0.1.8_linux_arm64.tar.gz"
      sha256 "e9f0fc648bee378ee7793bff8a780c55539b2fb84de1a57a0731185036e97eff"
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
    assert_match "mintmedia v0.1.8", shell_output("#{bin}/mintmedia --version")
  end
end
