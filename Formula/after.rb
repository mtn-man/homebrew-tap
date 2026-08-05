class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/mtn-man/after"
  license "MIT"
  version "1.7.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.7.0/after_v1.7.0_darwin_amd64.tar.gz"
      sha256 "9801164d68dda6a32a63df7f596a6d8140a410ad39a9340f293db0a7895102e6"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.7.0/after_v1.7.0_darwin_arm64.tar.gz"
      sha256 "6edb798221af03fa5768e134a7a47d4d02fc5d24d3a8bec8d2e360ebe4d917e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.7.0/after_v1.7.0_linux_amd64.tar.gz"
      sha256 "b0a46e80743d679c658a344a4b11cabba1833aec21ca0f9abcf6e61a24a897fb"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.7.0/after_v1.7.0_linux_arm64.tar.gz"
      sha256 "8138ae25fbf7630c0cde7bea318f6a5cb16e63919087233de90ed6a009b802a7"
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
    assert_match "after v1.7.0", shell_output("#{bin}/after --version")
  end
end
