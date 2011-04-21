#!/bin/bash

export user=$(whoami);
_udev_v="skip"
_idev_p="skip"
_incompatible="0"


##FUNCTIONS
##
##	Prints vendors selection menu
ventor_menu() {
    echo "VENDORS:"
	echo 1.	Commitiva
	echo 2.	Geeksphone
	echo 3.	HTC
	echo 4.	Motorola
	echo 5.	Samsung
	echo 6.	Viewsonic
	echo 7.	ZTE
}

## Prints HTC devices selection menu
HTCdev_menu() {
	echo "HTC DEVICES:"
	echo 1.	Ace
	echo 2.	Aria
	echo 3.	Desire CDMA
	echo 4.	Desire GSM
	echo 5.	Dream
	echo 6.	Evo 4G
	echo 7.	Glacier
	echo 8.	Hero CDMA
	echo 9.	Hero GSM
	echo 10.Incredible
	echo 11.Legend
	echo 12.Magic
	echo 13.Passion
	echo 14.Slide
	echo 15.Vision
	echo 16.Wildfire
        echo 17.Leo
}

## Prints Samsung devices selection menu
Samsungdev_menu() {
	echo "SAMSUNG DEVICES:"
	echo 1.	Galaxy S
	echo 2.	Nexus S
}

##VARIABLES: $_vendor , $_device , $_udev_v

##Show all vendors an select one
ventor_menu
echo
echo -n "Select Vendor(1-7): "
read vendor
while [[ $vendor -lt 1 || $vendor -gt 7 ]]; do
	echo "Selection ERROR.."
	echo -n "Select Vendor(1-7): "
	read vendor
done
echo

case  $vendor in
 1) echo "Vendor=Commitiva, Device=Z71"
	_vendor="Commtiva"
	_device="z71"
	_udev_v="skip"
	;;
 2) echo "Vendor=Geeksphone, Device=One"
	_vendor="geeksphone"
	_device="one"
	_udev_v="skip"
	;;
 4) echo "Vendor=Motorola, Device=Droid"
	_vendor="motorola"
	_device="sholes"
	_udev_v="22b8"
	;;
 6) echo "Vendor=Viewsonic, Device=G Tablet"
	_vendor="nvidia"
	_device="harmony"
	_udev_v="0955"
	;;
 7) echo "Vendor=ZTE, Device=G Tablet"
	_vendor="zte"
	_device="blade"
	_udev_v="19D2"
	;;
 5) Samsungdev_menu
	echo
	echo -n "Select Device(1-2): "
	read device
	while [[ $device -lt 1 || $device -gt 2 ]]; do
		echo "Selection ERROR.."
		echo -n "Select Device(1-2): "
		read device
	done
	echo
	case $device in
	 1) echo "Vendor=Samsung, Device=Galaxy S"
		_vendor="samsung"
		_device="vibrant"
		_udev_v="skip"
		;;
	 2) echo "Vendor=Samsung, Device=Nexus S"
		_vendor="samsung"
		_device="crespo"
		_udev_v="skip"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"18d1\", ATTRS{idProduct}==\"4e21\", MODE=\"0666\", OWNER=\"$user\" #Normal nexus s' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"18d1\", ATTRS{idProduct}==\"4e22\", MODE=\"0666\", OWNER=\"$user\" #Debug & Recovery nexus s' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"18d1\", ATTRS{idProduct}==\"4e20\", MODE=\"0666\", OWNER=\"$user\" #Fastboot nexus s' >> /etc/udev/rules.d/51-android.rules"
		;;
	esac
	;;
 3) HTCdev_menu
	echo
	echo -n "Select Device(1-17): "
	read device
	while [[ $device -lt 1 || $device -gt 17 ]]; do
		echo "Selection ERROR.."
		echo -n "Select Device(1-17): "
		read device
	done
	echo
	case $device in
	 1) echo "Vendor=HTC, Device=Ace"
		_vendor="htc"
		_device="ace"
		_udev_v="0bb4"
		;;
	 2) echo "Vendor=HTC, Device=Aria"
		_vendor="htc"
		_device="liberty"
		_udev_v="0bb4"
		;;
	 3) echo "Vendor=HTC, Device=Desire CDMA"
		_vendor="htc"
		_device="bravoc"
		_udev_v="0bb4"
		;;
	 4) echo "Vendor=HTC, Device=Desire GSM"
		_vendor="htc"
		_device="bravo"
		_udev_v="0bb4"
		;;
	 5) echo "Vendor=HTC, Device=Dream"
		_vendor="htc"
		_device="dream_sapphire"
		_udev_v="0bb4"
                _incompatible="dream"
		;;
	 6) echo "Vendor=HTC, Device=Evo 4G"
		_vendor="htc"
		_device="supersonic"
		_udev_v="0bb4"
		;;
	 7) echo "Vendor=HTC, Device=Glacier"
		_vendor="htc"
		_device="glacier"
		_udev_v="0bb4"
		;;
	 8) echo "Vendor=HTC, Device=Hero CDMA"
		_vendor="htc"
		_device="heroc"
		_udev_v="0bb4"
		_idev_p="0c9a"
		;;
	 9) echo "Vendor=HTC, Device=Hero GSM"
		_vendor="htc"
		_device="hero"
		_udev_v="0bb4"
		_idev_p="0c99"
		;;
	 10) echo "Vendor=HTC, Device=Incredible"
		_vendor="htc"
		_device="inc"
		_udev_v="skip"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0bb4\", ATTRS{idProduct}==\"0ff9\", MODE=\"0666\", OWNER=\"$user\" #Normal dinc' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0bb4\", ATTRS{idProduct}==\"0c9e\", MODE=\"0666\", OWNER=\"$user\" #Debug & Recovery dinc' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0bb4\", ATTRS{idProduct}==\"0c8d\", MODE=\"0666\", OWNER=\"$user\" #Debug & Recovery dinc (hardware 0002)' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0bb4\", ATTRS{idProduct}==\"0fff\", MODE=\"0666\", OWNER=\"$user\" #Fastboot dinc' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0bb4\", ATTRS{idProduct}==\"0c94\", MODE=\"0666\", OWNER=\"$user\" #Bootloader dinc' >> /etc/udev/rules.d/51-android.rules"
		;;
	 11) echo "Vendor=HTC, Device=Legend"
		_vendor="htc"
		_device="legend"
		_udev_v="0bb4"
		;;
	 12) echo "Vendor=HTC, Device=Magic"
		_vendor="htc"
		_device="dream_sapphire"
		_udev_v="0bb4"
                _incompatible="dream"
		;;
	 13) echo "Vendor=HTC, Device=Passion"
		_vendor="htc"
		_device="passion"
		_udev_v="skip"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"18d1\", ATTRS{idProduct}==\"4e11\", MODE=\"0666\", OWNER=\"$user\" #Normal Nexus One' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"18d1\", ATTRS{idProduct}==\"4e12\", MODE=\"0666\", OWNER=\"$user\" #Debug & Recovery Nexus One' >> /etc/udev/rules.d/51-android.rules"
		sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0bb4\", ATTRS{idProduct}==\"0fff\", MODE=\"0666\", OWNER=\"$user\" #Fastboot Nexus One' >> /etc/udev/rules.d/51-android.rules"
		;;
	 14) echo "Vendor=HTC, Device=Slide"
		_vendor="htc"
		_device="espresso"
		_udev_v="0bb4"
		_idev_p="0e03"
		;;
	 15) echo "Vendor=HTC, Device=Vision"
		_vendor="htc"
		_device="vision"
		_udev_v="0bb4"
		_idev_p="0c91"
		;;
	 16) echo "Vendor=HTC, Device=Wildfire"
		_vendor="htc"
		_device="buzz"
		_udev_v="0bb4"
		;;	
         17) echo "Vendor=HTC, Device=Leo"
		_vendor="htc"
		_device="leo"
		_udev_v="0bb4"
		;;	
           esac
	;;
esac


echo
echo
##Installing udev drivers
if [ "$_udev_v" != "skip" ]; then {
sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"$_udev_v\", ATTRS{idProduct}==\"0ff9\", MODE=\"0666\", OWNER=\"$user\" #Normal $_device' >> /etc/udev/rules.d/51-android.rules"
sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"$_udev_v\", ATTRS{idProduct}==\"0fff\", MODE=\"0666\", OWNER=\"$user\" #Fastboot $_device' >> /etc/udev/rules.d/51-android.rules"
}
fi

if [ "$_idev_v" != "skip" ]; then {
sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"$_udev_v\", ATTRS{idProduct}==\"$_idev_p\", MODE=\"0666\", OWNER=\"$user\" #Debug & Recovery $_device' >> /etc/udev/rules.d/51-android.rules"
}
fi

echo "UDEV completed"