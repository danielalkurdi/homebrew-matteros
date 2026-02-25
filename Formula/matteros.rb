class Matteros < Formula
  include Language::Python::Virtualenv

  desc "CLI-first legal ops orchestration with safe, auditable workflows"
  homepage "https://github.com/danielalkurdi/matteros"
  url "https://github.com/danielalkurdi/matteros/archive/4c0e02a45a08cdde268f735c81c6f16f30a02d68.tar.gz"
  sha256 "63da88e2515ec2255152c9001c5174ccfebeec1cf06167075adb05829a0d468a"
  license "AGPL-3.0-only"
  version "0.1.0"

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/matteros"
  end

  test do
    assert_match "MatterOS", shell_output("#{bin}/matteros --help")
  end
end
