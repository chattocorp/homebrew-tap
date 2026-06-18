class Chatto < Formula
  desc "Real-time chat app CLI and server"
  homepage "https://github.com/chattocorp/chatto"
  version "0.3.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Darwin_arm64.tar.gz"
      sha256 "81a4ab55ee8b3961915832af9d4b0378ca1ea5700cef4749a73fcdc1e197bea0"
    end

    on_intel do
      odie "Chatto currently provides Homebrew builds for Apple Silicon macOS only."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_arm64.tar.gz"
      sha256 "80c3b37289b8b4ad81360e653ecf56638a4044c3dd80bd700e8beb6fbd17fde4"
    end

    on_intel do
      url "https://github.com/chattocorp/chatto/releases/download/v#{version}/chatto_Linux_x86_64.tar.gz"
      sha256 "661d29276c360ec825a43caf197e15c871bb9bcd12263795e6b3ce36f31e62be"
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
