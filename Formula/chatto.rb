class Chatto < Formula
  desc "Real-time chat app CLI and server"
  homepage "https://github.com/chattocorp/chatto"
  version "0.3.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Darwin_arm64.tar.gz"
      sha256 "3c3bdf958b8db16e45dae07c537f1033e339f3c7d11f95f841f73b060a153007"
    end

    on_intel do
      odie "Chatto currently provides Homebrew builds for Apple Silicon macOS only."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_arm64.tar.gz"
      sha256 "94c305c70ff2669a204a5bcc5e2de7374cf9ee72fefe7b55644407a640c149e5"
    end

    on_intel do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_x86_64.tar.gz"
      sha256 "ba643c6a3b987a03b41e9295f945e5ec621712dd3d76aa85ea0fdfefcae8c252"
    end
  end

  def install
    bin.install "chatto"
    system "codesign", "--force", "--sign", "-", bin/"chatto" if OS.mac?
  end

  test do
    assert_match "chatto version #{version}", shell_output("#{bin}/chatto version")
  end
end
