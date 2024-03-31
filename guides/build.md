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

With repositories synchronized, it's time to prepare the build environment:

1. **Environment Setup**:

    Ensure you're in the directory containing `setup-environment`. Then, to configure the build environment for `bytedevkit-stm32mp1` with the `poky-bytesatwork` distribution, execute:
    ```
    MACHINE=bytedevkit-stm32mp1 DISTRO=poky-bytesatwork EULA=1 source setup-environment build
    ```
    This command sets up the environment variables `MACHINE`, `DISTRO`, and `EULA`, then sources the `setup-environment` script. Using `source` ensures the script executes in the current shell, applying necessary configurations.

2. **Incorporate meta-david Layer**:

    To include `meta-david` in your build, add it to your build environment. This usually involves updating the `bblayers.conf` file or utilizing the `bitbake-layers` tool:
    ```
    bitbake-layers add-layer ../../path/to/your/workspace/meta-david
    ```
    Verify the path to your cloned `meta-david` layer is correct.

## Building the Image

With the environment prepared and `meta-david` included, proceed to build your Yocto Project image:
 ```
bitbake bytesatwork-minimal-image
 ```
This will incorporate your modifications from `meta-david` into the build of `bytesatwork-minimal-image`. This modifications are in [text](../recipes-core/images/bytesatwork-minimal-image.bbappend)

However, if you want to include your own image from scratch, you can modify `david-image.bb` and then run 

 ```
bitbake bytesatwork-minimal-image
 ```

## Post-Build

After the build completes, your image files will be located in
 `tmp/deploy/images/bytedevkit-stm32mp1/`. You can now proceed with flashing the image to your device. Depending on the image you will have to choose the one with the corresponding name you built.

Refer to `sd_flashing.md` within the `guides` directory of `meta-david` for detailed instruction
