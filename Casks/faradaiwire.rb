cask "faradaiwire" do
  version "0.1.7"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "b3b603b0bcea3e34a1007aff578c8d4c1a57a30278e954b8f38fa54249423497"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "0a994b34a8fd0cae91d0a0fd5f87350aa4651b753c89f30e0d3e0b756e3a0dac"
    end

    postflight do
      system_command "/usr/bin/xattr",
                     args:         ["-dr", "com.apple.quarantine", "#{staged_path}/faradaiwire"],
                     must_succeed: false
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_arm64.tar.gz"
      sha256 "883424fb0b3a90b51bc481779996ee7b65a07f70732ac7eb3db6f77e6a1d043b"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "6442c5b8e7af4631406eb36bd3feeb4a46c3764799dec2695b98787f65a4c47e"
    end
  end

  name "FaradAiWire"
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"

  binary "faradaiwire"

  zap trash: "~/.faradaiwire"
end
