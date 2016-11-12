h1. Android CyanogenMod 13.0 for HTC One X (endeavoru)

This is cm-13.0 device tree for HTC One X (endeavoru).

This HTC "endeavoru" device tree does not require "tegra3-common" because on "cm-13.0" it's not working for "endeavoru".

A modified version of "tegra3-common" files is included and merged with this device tree.

The following build instructions were tested in Debian (stretch/testing).

h2. Download

Copy all files from "MANIFESTS" directory to your ".repo":

$ cp -a MANIFESTS/* $(TOP_ANDROID_SOURCE)/.repo/

Download source code (20Gb aprox.):

$ repo init --repo-branch=cm-13.0 --repo-url=https://github.com/CyanogenMod/android.git
$ repo sync -c --force-sync

Clang 3.8 from TWRP was downloaded, but you can try to setup QCOM LLVM Clang v3.8.7 (downloaded from qualcomm website, needs register).

  https://github.com/omnirom/android_external_clang

Adjust Clang version in "prebuilts/ndk/current/platforms/android-**/arch-arm/usr/include/math.h", like this:

  - Replace: #if !defined(__clang__) || __clang_major__ > 3 || (__clang_major__ == 3 && __clang_minor__ >= 6)
  - With:    #if !defined(__clang__) || __clang_major__ > 3 || (__clang_major__ == 3 && __clang_minor__ >= 8)

In "frameworks/rs/driver/runtime/build_bc_lib_internal.mk" replace all occurences of:

  - "LLVM_LINK" and "LLVM_AS" with "LLVM_LINK2" and "LLVM_AS2" 

Set paths as following at the top:

  LLVM_AS2 := $(LLVM_PREBUILTS_PATH)/llvm-as$(BUILD_EXECUTABLE_SUFFIX)
  LLVM_LINK2 := $(LLVM_PREBUILTS_PATH)/llvm-link$(BUILD_EXECUTABLE_SUFFIX)

Download "Linaro" toolchains to "prebuilts/gcc/linux-x86/arm" from "https://releases.linaro.org/components/toolchain/binaries/":

(Recommended gcc 4.9 arm eabi)

$ cd prebuilts/gcc/linux-x86/arm
$ wget -c https://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-eabi/gcc-linaro-4.9-2016.02-x86_64_arm-eabi.tar.xz

(You can give a chance to gcc 5.x - Not recommended Android toolchain is 4.9)

$ wget -c https://releases.linaro.org/components/toolchain/binaries/latest-5/arm-eabi/gcc-linaro-5.3.1-2016.05-x86_64_arm-eabi.tar.xz
$ wget -c https://releases.linaro.org/components/toolchain/binaries/latest-5/arm-linux-gnueabi/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabi.tar.xz

Unpack "Linaro" toolchains and rename them:

$ tar -xvf gcc-linaro-5.3.1-2016.05-x86_64_arm-eabi.tar.xz
$ tar -xvf gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabi.tar.xz
$ mv gcc-linaro-5.3.1-2016.05-x86_64_arm-eabi arm-eabi
$ mv gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabi arm-linux-gnueabi

(Other toolchains are avaliable for testing, take a look at "prebuilts/gcc/linux-x86/arm")

h4. Build CyanogenMod for HTC One X

Now, we can build CyanogenMod:

$ source build/envsetup.sh
$ breakfast endeavoru

h2. Install

TODO

h2. Device Components

Working components:

- Kernel
- Recovery (TWRP)
- Screen
- EGL
- HW Buttons
- Telephony
- Bluetooth
- Wifi
- Camera
- NFC

NOT Working components:

- ?????

h2. TroubleShooting

- If you see uncommon build errors try to change the Linaro prebuilt GCC toolchains
- If you get an not found error on "cmsdk" manifests, reset "vendor/cmsdk" git repo with "git reset --hard" and "repo sync" again.
- If you get "libc_htc_symbols" error, comment it out at "BoardConfigCommonTegra3.mk" file.

h2. Authors

2016 -- Antonio Cao (@burzumishi) <antoniocao000@gmail.com> --
