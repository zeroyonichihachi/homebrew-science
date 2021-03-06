class Quorum < Formula
  homepage "http://www.genome.umd.edu/quorum.html"
  # doi "arXiv:1307.3515"
  # tag "bioinformatics"

  url "ftp://ftp.genome.umd.edu/pub/QuorUM/quorum-1.0.0.tar.gz"
  sha256 "ec11af84ab3887b1cb0a526d9ab295e8cde6fe2cbba3060147da9fa2f12a518d"

  depends_on "jellyfish"
  depends_on "pkg-config" => :build

  fails_with :clang do
    build 600
    cause "error: 'ext/stdio_filebuf.h' file not found"
  end

  def install
    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/quorum", "--version"
  end
end
