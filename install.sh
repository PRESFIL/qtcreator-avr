#!/bin/bash

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 1>&2
   	exit 1
fi

# installing dependencies:

if [ ! -d /opt/Qt/Tools/QtCreator ]; then
	echo "QtCreator is installed not in the default location or is not installed"
	exit 1
fi

# installing cmake-avr
echo "cmake-avr/install.sh"

# installing avr-gcc-toolchain
sudo apt-get install avr-libc
sudo apt-get install gcc-avr
sudo apt-get install binutils-avr
sudo apt-get install gdb-avr

# installing avrdude
sudo apt-get install avrdude

# installing template
# cp -f cmake-avr/CMakeLists.txt CMakeLists.txt
cp -f -r avr-template /opt/Qt/Tools/QtCreator/share/qtcreator/templates/wizards

echo "Done"