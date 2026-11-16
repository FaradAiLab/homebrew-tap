cask "faradaiwire" do
  version "0.1.5"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "7a7c00752714b83e2c3c07b596fc45ad9068d847b76b19bce779aed0d9fff091"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "cec3f8515b087b657db41595aa74513e5e89c9f1e87ada9cd652c05a0143db65"
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
      sha256 "06dec67ec0796617c96959a663c91d5ff17c267a8d3c2e8ea7cd52716f710255"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "a12c97ed309f1ea0a5be5a2fb605c07a2c10cd3720165bb5166f528d08669090"
    end
  end

  name "FaradAiWire"
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"

  binary "faradaiwire"

  zap trash: "~/.faradaiwire"
end
