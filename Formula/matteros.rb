class Matteros < Formula
  include Language::Python::Virtualenv

  desc "CLI-first legal ops orchestration with safe, auditable workflows"
  homepage "https://github.com/danielalkurdi/matteros"
  url "https://github.com/danielalkurdi/matteros/releases/download/v0.1.0/matteros-0.1.0.tar.gz"
  sha256 "b9a04b72b10a655a18267191ad4a276fe656154c21d1153880d987158acabab7"
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
