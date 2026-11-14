class Faradaiwire < Formula
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "c7be28e8d777db64205786e89be1fdb44e92f8ca9a103dcae2ac7000f6d2e410"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "395cfc21e51a38c01c1ccb3124f9b305b5ff1e57e1b4046751239ba8efce9b25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_arm64.tar.gz"
      sha256 "5c63727bfa61b0d00649b7d4d42fc130da27a5ad46a542ad47e60119c596dd6c"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "7db8847d17eb348775f5a95004b36abf5643a54ae68a6794940b1676be10e818"
    end
  end

  def install
    bin.install "faradaiwire"
  end

  # macOS Background Daemon Service (launchd)
  service do
    run [opt_bin/"faradaiwire", "run"]
    keep_alive true
    log_path var/"log/faradaiwire.log"
    error_log_path var/"log/faradaiwire.error.log"
    working_dir var
  end

  test do
    system "#{bin}/faradaiwire", "--help"
  end
end

