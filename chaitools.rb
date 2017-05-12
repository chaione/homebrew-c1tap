class Chaitools < Formula
  desc "Brew some great software with chaitools"
  homepage "https://github.com/chaione/chaitools"
  url "https://github.com/chaione/chaitools/archive/0.4.2.tar.gz"
  version "0.4.2"
  sha256 "b34a2810c6584f926ca72f378217f2ee2845459e90fa5a44d6387f37da09314f"

  # bottle do
  #   root_url "https://github.com/chaione/chaitools/releases/download/0.2.0"
  #   cellar :any
  #   sha256 "f7213a4f7e349b15593d5d7fe672f1a125701056903c19b9f7afaeee9a5942ff" => :sierra
  # end

  depends_on :xcode => ["8.3", :build]

  def install
    Dir.chdir("src")
    system "ln", "-s", "/usr/local/Homebrew/Library/Homebrew/shims/super/clang", "."
    system "swift", "build", "-c", "release"
    bin.install ".build/release/chaitools"
  end

  test do
    system "chaitools"
  end
end
