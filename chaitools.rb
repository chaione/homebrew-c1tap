class Chaitools < Formula
  desc "Brew some great software with chaitools"
  homepage "https://github.com/chaione/chaitools"
  url "https://github.com/chaione/chaitools/archive/0.5.1.tar.gz"
  version "0.5.1"
  sha256 "c1e46fbf0cf6c5f53978fa96c976a665d90b94c72528b51331caa1db4af597f4"

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
