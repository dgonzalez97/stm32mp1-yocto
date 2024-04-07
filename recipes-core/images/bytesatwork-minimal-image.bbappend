IMAGE_INSTALL:append = " \
	usbutils \
    linux-firmware-rtl8192cu \
    iw \
    wpa-supplicant \
    crda \
    networkmanager \
    iproute2 \
    net-tools \
"

KERNEL_MODULE_AUTOLOAD += "rtl8192cu"
