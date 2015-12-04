PLATFORM=ubuntu14.04
PLATFORM_PATH=$(shell echo $(PLATFORM) | tr -d '.')
VERSION=swift-2.2-SNAPSHOT-2015-12-01-b

default: dependencies install clean

dependencies:
	echo "Installing required packages"
	sudo apt-get update
	sudo apt-get install -y git cmake ninja-build clang uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
	# Ubuntu 14.04 LTS upgrade clang for C++14 support
	sudo apt-get install -y clang-3.6
	sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
	sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

install:
	wget https://swift.org/builds/${PLATFORM_PATH}/${VERSION}/${VERSION}-${PLATFORM}.tar.gz && \
	tar xzf ${VERSION}-${PLATFORM}.tar.gz && \
	sudo cp -R ${VERSION}-${PLATFORM}/usr /

clean:
	rm -rf ${VERSION}-${PLATFORM}.tar.gz ${VERSION}-${PLATFORM}
