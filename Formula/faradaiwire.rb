class Faradaiwire < Formula
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "80435cab246d96d6778da83b2b979150c823786ce4027b979adc73a6d99eba9d"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "65ab86c945ae13a2f518c98c36f36bb5386fe276071ff379112ea8a3978c4b37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_arm64.tar.gz"
      sha256 "86e7fdf0afea80ac2bbe2999c4923f8ad9618dd7e1c23034d6c4cb92e99b4a18"
    else
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "f265d0b598b1e0a22b6fa9c7a4535ca1ffcad6a3caf41321592c15d6530c91c0"
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

