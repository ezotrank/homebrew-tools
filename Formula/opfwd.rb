class Opfwd < Formula
  desc "1Password CLI Forwarding tool for seamless access from remote Linux machines"
  homepage "https://github.com/ezotrank/opfwd"
  version "0.1.4"

  # TODO: Replace the SHA256 value below with the actual checksum before submitting:
  # You can get it by running:
  # curl -sL https://github.com/ezotrank/opfwd/releases/download/v0.1.4/opfwd_0.1.4_darwin_arm64.tar.gz | shasum -a 256

  url "https://github.com/ezotrank/opfwd/releases/download/v0.1.4/opfwd_Darwin_arm64.tar.gz"
  sha256 "46bd5963366529386d6ef2c12b1c8351f83e1d172dfd22c40beefd59c26d97a2"

  depends_on arch: :arm64

  def install
    bin.install "opfwd"
  end

  def caveats
    <<~EOS
      To use opfwd, you'll need to:
      1. Create a config file at ~/.config/opfwd/config.yaml
      2. Configure your SSH for socket forwarding
      3. Run 'opfwd --server' on your Mac

      For detailed setup instructions, visit:
      https://github.com/ezotrank/opfwd#installation
    EOS
  end

  test do
    assert_match "opfwd version #{version}", shell_output("#{bin}/opfwd --version", 0)
  end
end
