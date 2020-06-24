sudo git clone https://github.com/xbmc/xbmc kodi
sudo apt-get install utoconf  automake  autopoint  gettext  autotools-dev  cmake  curl  default-jre 
sudo apt-get install openjdk-6-jre -y && sudo apt-get install openjdk-7-jre  gawk  gcc (>= 4.9) -y
sudo apt-get install gcc cpp flatbuffers  gdc  gperf  libasound2-dev -y
sudo apt-get install libasound2-dev  libass-dev  libavahi-client-dev  libavahi-common-dev  libbluetooth-dev  libbluray-dev  libbz2-dev  libcdio-dev -y
sudo apt-get install libcec-dev  libp8-platform-dev  libcrossguid-dev  libcurl4-openssl-dev -y 
sudo apt-get install libcurl4-gnutls-dev -y 
sudo apt-get install libcwiid-dev  libdbus-1-dev  libegl1-mesa-dev  libenca-dev  libflac-dev  libfontconfig-dev -y
sudo apt-get install libfmt-dev  libfreetype6-dev  libfribidi-dev  libfstrcmp-dev  libgcrypt-dev  libgif-dev   libgles2-mesa-dev -y
sudo apt-get install libgl1-mesa-dev 
sudo apt-get install libgl-dev  libglew-dev  libglu1-mesa-dev  -y && sudo apt-get install libglu-mesa-dev  libgnutls-dev -y
sudo apt-get install libgnutls28-dev  libgpg-error-dev  libgtest-dev  libiso9660-dev  libjpeg-dev  liblcms2-dev  liblirc-dev  libltdl-dev  liblzo2-dev  libmicrohttpd-dev   libnfs-dev  libogg-dev  libomxil-bellagio-dev libpcre3-dev  libplist-dev -y
sudo apt-get install libpng-dev  libpulse-dev    libsmbclient-dev  libspdlog-dev  libsqlite3-dev  libssl-dev  libtag1-dev -y 
sudo apt-get install libtiff5-dev -y
sudo apt-get install libtiff-dev -y
sudo apt-get install libtinyxml-dev  libtool  libudev-dev  libva-dev  libvdpau-dev  libvorbis-dev  libxkbcommon-dev  libxmu-dev  libxrandr-dev  libxslt1-dev -y
sudo apt-get install libxslt-dev  libxt-dev  waylandpp-dev libunistring-dev y 
sudo apt-get install netcat  wayland-protocols -y
sudo apt-get install wipe  lsb-release  meson   nasm  ninja-build  python3-dev  python3-pil -y
sudo apt-get install python-imaging  python-support -y
sudo apt-get install python3-minimal  rapidjson-dev  swig  unzip  uuid-dev  yasm  zip  zlib1g-dev -y
cd $HOME/kodi
#Build and install crossguid:
sudo make -C tools/depends/target/crossguid PREFIX=/usr/local
#Build and install flatbuffers:
sudo make -C tools/depends/target/flatbuffers PREFIX=/usr/local
#Build and install libfmt:
sudo make -C tools/depends/target/libfmt PREFIX=/usr/local
#Build and install libspdlog:
sudo make -C tools/depends/target/libspdlog PREFIX=/usr/local
#Build and install wayland-protocols:
sudo make -C tools/depends/target/wayland-protocols PREFIX=/usr/local
#Build and install waylandpp:
sudo make -C tools/depends/target/waylandpp PREFIX=/usr/local

#WARNING: Building waylandpp has some dependencies of its own, namely scons, libwayland-dev (>= 1.11.0) and libwayland-egl1-mesa
#TIP: Complete list of dependencies is available here.
# https://github.com/xbmc/xbmc/tree/master/tools/depends/target
