class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/mtn-man/after"
  license "MIT"
  version "1.9.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.9.0/after_v1.9.0_darwin_amd64.tar.gz"
      sha256 "f7aed221be55247491eaf81deecf4a1279d057317d8075a14cc688e83ccf495e"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.9.0/after_v1.9.0_darwin_arm64.tar.gz"
      sha256 "7ba682e16f79567d43487f57af53cee88c697013f406cdae1aaa5ea5310a7b6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.9.0/after_v1.9.0_linux_amd64.tar.gz"
      sha256 "d9e85e04c2c3ce67b1580b30327a97c993ee8e90244946c90bb76604c120728c"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.9.0/after_v1.9.0_linux_arm64.tar.gz"
      sha256 "cf1f1c507195de0515a7b455798a3c277e60636cfb61a80b8cfe789d352442b1"
    end
  end

  def install
    bin_name =
      if OS.mac? && Hardware::CPU.intel?
        "after_darwin_amd64"
      elsif OS.mac? && Hardware::CPU.arm?
        "after_darwin_arm64"
      elsif OS.linux? && Hardware::CPU.intel?
        "after_linux_amd64"
      elsif OS.linux? && Hardware::CPU.arm?
        "after_linux_arm64"
      else
        odie "Unsupported platform"
      end

    bin.install bin_name => "after"
  end

  test do
    assert_match "after v1.9.0", shell_output("#{bin}/after --version")
  end
end
