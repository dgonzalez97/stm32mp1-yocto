# Flashing the SD Card with Balena Etcher

This guide describes how to flash a Yocto Project image onto an SD card using Balena Etcher.

## Requirements
- A microSD card with at least 8 GB capacity.
- The Yocto Project image file (`.wic` format)
- Balena Etcher software installed on your computer.

## Steps
1. **Download and Install Balena Etcher**: If you haven't already, download Balena Etcher from [https://www.balena.io/etcher/](https://www.balena.io/etcher/) and install it.
2. **Prepare the Image**: Ensure your Yocto Project image is uncompressed and in a `.wic` or `.img` format.

3. **Launch Balena Etcher**: Open Balena Etcher.
4. **Select the Image**: Click on 'Flash from file' and navigate to your image file. Select it
The image is under `build/tmp/deploy/images` directory. If using david-meta, the path should be something like

    `/home/david/workdir/bytedevkit-stm32mp1/4.0/build/tmp/deploy/images/bytedevkit-stm32mp1/david-image-bytedevkit-stm32mp1-20240330203938.rootfs.wic.gz`
Rembember to uncompress ( no .gz )
5. **Select the Target**: Click on 'Select target' and choose your microSD card from the list.

