# Building a Yocto Project Image with meta-david Layer

This guide details the steps for incorporating the `meta-david` layer into a Yocto Project build for the byteDEVKIT-stm32mp1 platform.

Based on the guides in  https://bytewiki.readthedocs.io/en/latest/yocto/4.0/bytedevkit-stm32mp1.html

## Cloning meta-david

Before setting up the Yocto build environment, clone the `meta-david` layer into your workspace:
 ```
git clone https://github.com/dgonzalez97/stm32mp1-yocto path/to/your/workspace/meta-david
 ```



## Download Necessary Repositories

After cloning `meta-david`, initialize and synchronize the Yocto repositories using `repo`:

1. Navigate to your workspace and create a new directory for the Yocto build:
    ```
    mkdir -p ~/workdir/bytedevkit-stm32mp1/4.0
    cd ~/workdir/bytedevkit-stm32mp1/4.0
    ```

2. Use `repo` to download the necessary repositories:
    ```
    repo init -b kirkstone -u https://github.com/bytesatwork/bsp-platform-st.git
    repo sync
    ```

## Preparing the Build Environment

Once the repositories are synchronized, prepare the Yocto Project build environment:

1. **Set Up the Environment**:
    ```
    MACHINE=bytedevkit-stm32mp1 DISTRO=poky-bytesatwork EULA=1 . setup-environment build
    ```

2. **Add the meta-david Layer**:
    Ensure the `meta-david` layer is included in your build environment. This step typically involves adding the layer to your `bblayers.conf` file or using `bitbake-layers add-layer`:
    ```
    bitbake-layers add-layer ../../path/to/your/workspace/meta-david
    ```
    Adjust the path to where you cloned `meta-david`.

## Building the Image

With the environment prepared and `meta-david` included, proceed to build your Yocto Project image:
 ```
bitbake david-image
 ```
Replace `david-image` with the name of your target image recipe within the `meta-david` layer, if different.

## Post-Build

After the build completes, your image files will be located in
 `tmp/deploy/images/bytedevkit-stm32mp1/`. You can now proceed with flashing the image to your device.

Refer to `sd_flashing.md` within the `guides` directory of `meta-david` for detailed instruction
