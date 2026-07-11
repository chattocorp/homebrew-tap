class Chatto < Formula
  desc "Real-time chat app CLI and server"
  homepage "https://github.com/chattocorp/chatto"
  version "0.4.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Darwin_arm64.tar.gz"
      sha256 "d0fcb41d30a92aa352f92178449835062940e6b9aaef945ffffe5bb40a30df22"
    end

    on_intel do
      odie "Chatto currently provides Homebrew builds for Apple Silicon macOS only."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_arm64.tar.gz"
      sha256 "b0ebd5dde7bdadb78e6e2c8d3dd2b8c50809d253737c4325d85740fa6188586a"
    end

    on_intel do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_x86_64.tar.gz"
      sha256 "ffaa9f56e974fe5c38867ad6a865066b70c85b07268743b87c8d043a0b0fc0ea"
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
