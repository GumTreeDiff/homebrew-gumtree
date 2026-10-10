class Gumtree < Formula
  desc "Tree differencing tool for source code"
  homepage "https://github.com/GumTreeDiff/gumtree"
  url "https://github.com/GumTreeDiff/gumtree/releases/download/v4.1.0/gumtree-4.1.0.zip"
  sha256 "8c7104c4da5019551a92246a0973f67f48d9655425b3241e1b5203b1d4191552"
  license "LGPL-3.0-or-later"

  depends_on "openjdk@17"

  def install
    libexec.install "gumtree-#{version}"

    (bin/"gumtree").write <<~SH
      #!/bin/sh
      PATH="#{Formula["openjdk@17"].opt_bin}:${PATH}"
      export PATH
      exec "#{libexec}/gumtree-#{version}/bin/gumtree" "$@"
    SH
    chmod 0755, bin/"gumtree"
  end

  test do
    system bin/"gumtree", "list"
  end
end
