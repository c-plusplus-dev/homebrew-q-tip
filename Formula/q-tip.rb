class QTip < Formula
  desc "A simple C++ graphics framework"
  homepage "https://github.com/c-plusplus-dev/Q-Tip"
  url "https://github.com/c-plusplus-dev/Q-Tip/archive/refs/tags/v0.1.7.tar.gz"
  head "https://github.com/c-plusplus-dev/Q-Tip.git", branch: "main"
  sha256 "b7c631ed094f3e20f97250a67f0702acf7554fd738a6f1ff6263639a91a1122f"
  license "MIT"

  depends_on "cmake"
  depends_on "sdl3"
  depends_on "sdl3_ttf"
  depends_on "sdl3_image"

  def install
    system "cmake", "-S", ".", "-B", "build",
            "-DCMAKE_BUILD_TYPE=Release",
           *std_cmake_args

    system "cmake", "--build", "build"

    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists include/"Q-Tip/QTip.h"
  end
end