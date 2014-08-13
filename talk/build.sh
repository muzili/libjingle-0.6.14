#!/bin/bash
sudo apt-get install build-essential expat libexpat1-dev libssl-dev pkg-config \
    libssl-dev libpulse-dev libdbus-glib-1-dev libgtk2.0-dev libgnome2-dev \
    libasound2-dev

[ ! -f third_party/swtoolkit.0.9.1.zip ] && wget https://swtoolkit.googlecode.com/files/swtoolkit.0.9.1.zip -O third_party/swtoolkit.0.9.1.zip
[ ! -f third_party/gtest-1.7.0.zip ] && wget 'https://googletest.googlecode.com/files/gtest-1.7.0.zip' -O third_party/gtest-1.7.0.zip
[ ! -f third_party/openssl-1.0.0e.tar.gz ] && wget http://www.openssl.org/source/openssl-1.0.0e.tar.gz -O third_party/openssl-1.0.0e.tar.gz
[ ! -f third_party/srtp-cvs.zip ] && wget http://libjingle.googlecode.com/files/srtp-cvs.zip -O third_party/srtp-cvs.zip
[ ! -f third_party/expat-2.0.1.tar.gz ] && wget 'http://sourceforge.net/projects/expat/files/expat/2.0.1/expat-2.0.1.tar.gz' -O third_party/expat-2.0.1.tar.gz
[ ! -f third_party/scons-local-2.0.1.zip ] && wget 'http://downloads.sourceforge.net/project/scons/scons-src/2.0.1/scons-local-2.0.1.zip' -O third_party/scons-local-2.0.1.zip

if [ ! -e third_party/scons-local-2.0.1 ]; then
    unzip third_party/scons-local-2.0.1.zip -d third_party/
fi

if [ ! -e third_party/swtoolkit ]; then
    unzip third_party/swtoolkit.0.9.1.zip -d third_party/
fi

if [ ! -e third_party/gtest ]; then
    unzip third_party/gtest-1.7.0.zip -d third_party/
    mv third_party/gtest-1.7.0 third_party/gtest
fi

if [ ! -e third_party/srtp ]; then
    unzip third_party/srtp-cvs.zip -d third_party/
    mv third_party/srtp-cvs third_party/srtp
fi

if [ ! -e third_party/expat-2.0.1 ]; then
    tar -zxvf third_party/expat-2.0.1.tar.gz -C third_party/
fi

if [ ! -e third_party/openssl ]; then
    tar -zxvf third_party/openssl-1.0.0e.tar.gz -C third_party
    mv third_party/openssl-1.0.0e third_party/openssl
fi
export SCONS_DIR=$(pwd)/third_party/scons-local-2.0.1
export PATH_TO_SWTOOLKIT=$(pwd)/third_party/swtoolkit
sh $PATH_TO_SWTOOLKIT/hammer.sh
