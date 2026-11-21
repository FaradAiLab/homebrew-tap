cask "faradaiwire" do
  version "0.1.6"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "30fd6cfc099656019ab403548adba2cf73ba3e40183a86f067bf050fd0759f34"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "1bf3dbcd718ccc59023adf244464553f006d20b82ef31cb7d833d30ad7b93571"
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
      sha256 "4295de7caaedac38e99f68fa81f8b7e3d1f5ae3b28208791b661e1ed93f748c6"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "699ba55d75b9dd644d22792025779c14810dc5314baa0b0b78185b36eb960491"
    end
  end

  name "FaradAiWire"
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"

  binary "faradaiwire"

  zap trash: "~/.faradaiwire"
end
