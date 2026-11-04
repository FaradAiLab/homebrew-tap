class Faradaiwire < Formula
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "dbdd3ae2112f04c6b3e3057106b0d9740985b6a182c37716d9ec278b64ef1619"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "d62b0491173be5b562ffcdce5985f9a4fb3c7774572206330ffb1ccdc4f094d5"
    end
  end

  on_linux do
    url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
    sha256 "802c8071894605e09a767d6386bb069c41f3d83d1c37edf6dd15dcf7db03eabc"
  end

  def install
    bin.install "faradaiwire"
  end

  # macOS Background Daemon Service (launchd)
  service do
    run [opt_bin/"faradaiwire"]
    keep_alive true
    log_path var/"log/faradaiwire.log"
    error_log_path var/"log/faradaiwire.error.log"
    working_dir var
  end

  test do
    system "#{bin}/faradaiwire", "--help"
  end
end

