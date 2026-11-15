class Faradaiwire < Formula
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "8ed01aee2ba050ff0f8067bf6473237afc06049b0629d8d93798ff4a4051990c"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "944f8e50b357242531029fb4346a166a188c70dabf685b21dbb6607c72f6714a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_arm64.tar.gz"
      sha256 "1e1a54c99681c438d2c4bf23b3e56d5be333f2f5690d952b3dd81ca844731138"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "7b9e92959db6d19f6734d1315dd529a3ae25b136b67ba6a416ae658025115ca9"
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

