This guide provides an extra insight of the various outputs generated by a Yocto Project build, with a focus on understanding the contents of the /deploy directory.

## Key Output Files
1. Kernel Images
- Image: Uncompressed Linux kernel image.
- zImage: Compressed version of the Linux kernel image.
- uImage: A U-Boot specific image format, containing the kernel image wrapped with a U-Boot header.
2. Device Tree Blobs (.dtb)

    Device Tree Blobs are hardware configuration files used by the kernel at boot time. They describe the hardware components and their configurations.

3. Root Filesystem Images

.ext4: An EXT4 filesystem image that can be used as a root filesystem.

.tar.xz: A compressed archive of the root filesystem, useful for manual extraction or network-based installations.

.wic and .wic.gz: Whole SD card images that include partitions, ready to be flashed directly onto an SD card.

4. Bootloaders
The bootloader directory contains bootloader images (e.g., U-Boot) necessary for initializing the hardware before loading the Linux kernel.

## Deploy Directory

The /deploy directory contains the final build artifacts ready for deployment to target hardware. This includes kernel images, root filesystems, SDKs, and more.


 Images are ñocated under /deploy/images/"MACHINE", where MACHINE corresponds to the target hardware configuration. The image name corresponds normally to the bitbake command ( check the .bb invoked when running .ie bitbake david-image , the /deploy image should be similar). Th

As well as images this build deploy also has SDKs (Software Development Kits) generated by the build, found under /deploy/sdk/.  They are usefull to build programs into binaries that can be directly copied into the system via SSH (TO_DO guide needed)


## Flashing and Deployment

To deploy these outputs to your hardware, the STM32MP1 alredy includes all of these in the wic format.(The name “Wic” is derived from OpenEmbedded Image Creator (oeic). The “oe” diphthong in “oeic” was promoted to the letter “w”, because “oeic” is both difficult to remember and to pronounce.) 

This wic also partitions the boot image. Why boot image is partitioned is up to bytesatwork and how they designed the image builder, tools are built with *bitbake wic-tools*. This contains :

- Applications
- Kernel and DTB ( Device Tree Blob)
- Root Filesystem
- Bootloader: 


Further Reading
Official Documentation

- *Yocto Project Overview and Concepts Manual*: [Yocto Project Documentation](https://docs.yoctoproject.org/overview-manual/)
- *Yocto Project Development Tasks Manual*: [Development Tasks](https://docs.yoctoproject.org/dev-manual/)