class Chatto < Formula
  desc "Real-time chat app CLI and server"
  homepage "https://github.com/chattocorp/chatto"
  version "0.3.4"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Darwin_arm64.tar.gz"
      sha256 "d80d6b4756674ae9fe045d0892096bf3e0b07f1d48b81c1ef0e394cd4a327f5a"
    end

    on_intel do
      odie "Chatto currently provides Homebrew builds for Apple Silicon macOS only."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_arm64.tar.gz"
      sha256 "3979ea00f2ca95f7b1c2a164610f95ced61dd627ef794cf501acad13c2c9647a"
    end

    on_intel do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_x86_64.tar.gz"
      sha256 "fc88a08b7df6d229283050ee975ca97a5dbe0a17743543014c8977eef5789ce4"
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
