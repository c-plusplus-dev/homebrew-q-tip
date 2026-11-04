class QTip < Formula
  desc "A simple C++ graphics framework"
  homepage "https://github.com/c-plusplus-dev/Q-Tip"
  url "https://github.com/c-plusplus-dev/Q-Tip/archive/refs/tags/v0.2.0.tar.gz"
  head "https://github.com/c-plusplus-dev/Q-Tip.git", branch: "main"
  sha256 "e488c23c61fab46746dd7ca4b1defcb9a778c8bfa5aa72561e50fca109482035"
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