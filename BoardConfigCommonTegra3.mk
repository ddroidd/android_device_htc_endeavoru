#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

MALLOC_IMPL := dlmalloc
BOARD_USES_LEGACY_MMAP := true

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME :=
TARGET_BOARD_PLATFORM := tegra

# Optimization build flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Some proprietary libs need reservedVectorImpl variants
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# Sense 4.5 / Sense 5 audio.primary blob support. See: include/hardware/audio.h
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
COMMON_GLOBAL_CFLAGS += -DHTC_TEGRA_AUDIO
# Old MediaBufferGroup::acquire_buffer symbol for libwvm.so
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

#Camera
USE_CAMERA_STUB := false # set to true by vendor
# external/skia: Old SkImageDecoder::DecodeFile symbol.
# Needed for camera.vendor.tegra.so and its dependencies.
COMMON_GLOBAL_CFLAGS += -DSK_SUPPORT_LEGACY_DECODEFILE
COMMON_GLOBAL_CFLAGS += -DSK_SUPPORT_LEGACY_SETCONFIG

# USE_DEVICE_SPECIFIC_CAMERA := true

# OMX
# frameworks/native/libs/gui: Legacy setPosition symbol for lib libnvwinsys.so
# which is required by the Nvidia OMX codecs.
COMMON_GLOBAL_CFLAGS += -DUSES_LEGACY_SET_POSITION

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# EGL settings
USE_OPENGL_RENDERER := true
# BOARD_EGL_CFG := device/htc/endeavoru/configs/egl.cfg

# No EGL_KHR_gl_colorspace
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# No support for the sync framework
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# libbinder: Add legacy MemoryDealer constructor for old Nvidia OMX adaptor
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL

# BT
BOARD_HAVE_BLUETOOTH := true

# USB
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 22
BOARD_HAS_SDCARD_INTERNAL := true

# Libc extensions (does not work with cm13/endeavoru)
# BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_htc_symbols

# NvCamera extensions
TARGET_SPECIFIC_HEADER_PATH := device/htc/endeavoru/include

# Hardware tunables
BOARD_HARDWARE_CLASS := device/htc/endeavoru/cmhw/

# RIL (fix network scan issue)
BOARD_RIL_CLASS := ../../../device/htc/endeavoru/ril/

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# SELinux Defines
BOARD_SEPOLICY_DIRS := \
    device/htc/endeavoru/sepolicy
