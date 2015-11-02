if [ -z "$DEMOROOT" ]; then
	echo "Please 'source env-setup' first"
	exit 1
fi

if [ -z "$1" ]; then
	cd iotivity-1.0.0 && scons TARGET_OS=arduino TARGET_ARCH=arm SHIELD=ETH
	exit 0
fi


if [ "$1" = "build" ]; then
	if [ "$2" = "demoserver" ]; then
		cd iotivity-1.0.0 && scons TARGET_OS=arduino TARGET_ARCH=arm SHIELD=ETH resource/csdk/stack
	else
		echo "Unknown option: $2"
		exit 1
	fi
elif [ "$1" = "program" ]; then
	if [ "$2" = "demoserver" ]; then
		sudo ${DEMOROOT}/arduino-1.5.7/hardware/tools/bossac -i -d --port=ttyACM0 -U false -e -w -v -b ${DEMOROOT}/iotivity-1.0.0/out/arduino/arm/release/resource/csdk/stack/samples/arduino/SimpleClientServer/demoserver/demoserver.hex -R
	else
		echo "Unknown option: $s"
		exit 1
	fi
elif [ "$1" = "clean" ]; then
	cd iotivity-1.0.0 && scons TARGET_OS=arduino TARGET_ARCH=arm SHIELD=ETH -c
	cd iotivity-1.0.0 && scons TARGET_OS=arduino TARGET_ARCH=arm SHIELD=ETH resource/csdk/stack -c
else
	echo "Unknown option: $1"
	exit 1
fi
