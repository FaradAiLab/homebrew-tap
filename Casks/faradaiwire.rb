cask "faradaiwire" do
  version "0.1.7"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_arm64.tar.gz"
      sha256 "a4e2f898d1345a3dbc781e06cd87c0f63a1aa387d0438aee652fa7107a458547"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_darwin_amd64.tar.gz"
      sha256 "e69078749ae7f43149b3eafe62f2900321658ca1439760ed7dddaecca7e0b41d"
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
      sha256 "0dc4c4c91e5c0953d70ed63539f41c1f0d9381de6a157f654cd73958bc1c2494"
    end

    on_intel do
      url "https://github.com/FaradAiLab/FaradAiWire/releases/download/v#{version}/faradaiwire_#{version}_linux_amd64.tar.gz"
      sha256 "170296adb9d08b4b9724703803c944901100bf405aa810550637c3c01548ba8a"
    end
  end

  name "FaradAiWire"
  desc "Zero-trust security gateway for AI agents & MCP"
  homepage "https://github.com/FaradAiLab/FaradAiWire"

  binary "faradaiwire"

  zap trash: "~/.faradaiwire"
end
