class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/mtn-man/after"
  license "MIT"
  version "1.8.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.8.0/after_v1.8.0_darwin_amd64.tar.gz"
      sha256 "80d218ee27ca1eb4c3d833ebaaa54515729321642cc749176f4868299463ea51"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.8.0/after_v1.8.0_darwin_arm64.tar.gz"
      sha256 "64cb86415a9c3d9d670498bf4bd634ea87877c86cafe1e2c37a6c8308bebd30a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.8.0/after_v1.8.0_linux_amd64.tar.gz"
      sha256 "890b66bc5bf9731ba259761ec9364702a9d37487e80cf2ccc12346bbf3006942"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.8.0/after_v1.8.0_linux_arm64.tar.gz"
      sha256 "a997399b7983d768258c1d7a857c718cf62c867132aca2e124ff45d7146e9751"
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
    assert_match "after v1.8.0", shell_output("#{bin}/after --version")
  end
end
