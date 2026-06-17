class Chatto < Formula
  desc "Real-time chat app CLI and server"
  homepage "https://github.com/chattocorp/chatto"
  version "0.2.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Darwin_arm64.tar.gz"
      sha256 "011916295cefa093b4c011e3b5bead97abb806b5ad52cda7077540e90b20fa87"
    end

    on_intel do
      odie "Chatto currently provides Homebrew builds for Apple Silicon macOS only."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_arm64.tar.gz"
      sha256 "c8a2eb23ff9a3686d2817d6b5284e8770be85ff7c67290da611da9d6660f17ee"
    end

    on_intel do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_x86_64.tar.gz"
      sha256 "69eb5409090ab52323ebad4f51ca4bc8368029f7d7174b9b460d194bd1813ac9"
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
