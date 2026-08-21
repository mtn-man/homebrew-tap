class Mintmedia < Formula
  desc "Organize downloaded media into clean Movies and Shows libraries"
  homepage "https://github.com/mtn-man/mintmedia"
  version "0.1.7"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.7/mintmedia_v0.1.7_darwin_amd64.tar.gz"
      sha256 "a599e53ed6d2927ca42c6474257a5eaedf5736e73f0bc68798207667804b4be6"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.7/mintmedia_v0.1.7_darwin_arm64.tar.gz"
      sha256 "e293af21ffdd01c076b1dbe1c39d3490a8d947a694365d1c7a7ae4060a489073"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.7/mintmedia_v0.1.7_linux_amd64.tar.gz"
      sha256 "027a91dc3754c3bffac29524811ac1357267d358a8eb0ac6e27fa825c23ecb4f"
    end

    on_arm do
      url "https://github.com/mtn-man/mintmedia/releases/download/v0.1.7/mintmedia_v0.1.7_linux_arm64.tar.gz"
      sha256 "151242271e4366eaf4afca80be37ad3d079704148c48f0b4c18e3c7d30ac2cee"
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
    assert_match "mintmedia v0.1.7", shell_output("#{bin}/mintmedia --version")
  end
end
