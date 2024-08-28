class Libtatsu < Formula
  desc "Library handling the communication with Apple's Tatsu Signing Server (TSS)"
  homepage "https://github.com/libimobiledevice/libtatsu"
  url "https://github.com/libimobiledevice/libtatsu/releases/download/1.0.3/libtatsu-1.0.3.tar.bz2"
  sha256 "4f69452d23e50e0ffbe844110e6ab6a900d080e051fbda3b7d595f679dee9bc5"
  version "1.0.3"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libplist"
  depends_on "openssl@3"

  def install
    ENV["libcurl_CFLAGS"] = "-I#{`xcrun --sdk macosx --show-sdk-path`.strip}/usr/include"
    ENV["libcurl_LIBS"] = "-lcurl"

    system "./configure", *std_configure_args
    system "make"
    system "make", "install"

  end

  test do
    # Test that the pkg-config file exists
    assert_predicate pkgshare/"libtatsu-1.0.pc", :exist?, "libtatsu-1.0.pc file is missing"
  end
end
