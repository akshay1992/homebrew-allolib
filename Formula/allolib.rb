require 'formula'

class Allolib < Formula
  head 'https://github.com/akshay1992/allolib', :revision => "afa8e92203cda2c110d724b401cdfd9b6387204e"

  depends_on 'cmake' => :build
  depends_on 'assimp'
  depends_on 'freeimage'
  depends_on 'freetype'
  depends_on 'glfw3'
  depends_on 'portaudio'
  depends_on 'libsndfile'

  def install
    system "git submodule init"
    system "git submodule update"
    mkdir "build" do
      system "cmake", "..", "-DNO_EXAMPLES=1", *std_cmake_args
      system "make al"
      system "make install"
   end
  end
end