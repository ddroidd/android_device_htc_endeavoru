# BoardConfig.mk (endeavoru)
#
# android_device_htc_endeavoru
#
# Nov 2016 by @burzum-ishi
#

# Include tegra3-common/BoardConfigCommon.mk
-include device/htc/endeavoru/BoardConfigCommonTegra3.mk

# Board Vendor
BOARD_VENDOR := htc

# QCOM hardware (default false)
BOARD_USES_QCOM_HARDWARE := false

# Camera Stub (default false)
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/htc/endeavoru/BoardConfigVendor.mk

# Board ARCH Setup
TARGET_ARCH := arm
TARGET_NO_KERNEL := false
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := endeavoru
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Toolchains (ndk, kernel, target)
-include device/htc/endeavoru/BoardConfigTools.mk

# Custom CFLAGS

# Disable some unwanted build warnings (comment this line to have all warnings)
COMMON_GLOBAL_CFLAGS += -Wno-unused-parameter -Wno-unused-function -Wno-unused

# All warnings (!!!caution!!!)
# COMMON_GLOBAL_CFLAGS += -Wall

# prop_override, disable_selinux, adbd_root
COMMON_GLOBAL_CFLAGS += -DALLOW_LOCAL_PROP_OVERRIDE=1 -DALLOW_DISABLE_SELINUX=1 -DALLOW_ADBD_ROOT=1

# Stop some stupid logging
COMMON_GLOBAL_CFLAGS += -DSTOP_LOG_SPAM

### Untested CFLAGS

# mr0_audio_blob, mr0_camera_blob, needs_vectorimpl_symbols
# COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS

# target_needs_hwc_v0
# COMMON_GLOBAL_CFLAGS += -DTARGET_NEEDS_HWC_V0

# board_cant_reallocate_omx_buffers
# COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS

# Marshmallow Setup (untested)
# TARGET_NEEDS_TEXT_RELOCS_SUPPORT := true
# COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
# TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# Art Tuning (untested)
# ART_BUILD_TARGET_DEBUG := false
# ART_USE_OPTIMIZING_COMPILER := true

# DEX Options (untested)
# WITH_DEXPREOPT := true
# DONT_DEXPREOPT_PREBUILTS := true
# WITH_DEXPREOPT_COMP := true

# Kernel boot params
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10800000
BOARD_KERNEL_PAGESIZE := 2048

# User Images
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# HTC endeavoru (endeavoru) Partitions - TWRP NewLayout
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00800000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x50000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x650000000
BOARD_FLASH_BLOCK_SIZE := 4096

# Kernel source and .config
# TARGET_KERNEL_SOURCE := kernel/htc/endeavoru-3.18
TARGET_KERNEL_SOURCE := kernel/htc/endeavoru-3.14
TARGET_KERNEL_CONFIG := twrp_endeavoru_defconfig

# We do not need a prebuilt kernel on this build (only for testing)
# TARGET_PREBUILT_KERNEL := device/htc/endeavoru/kernel

# EGL Setup (untested)
# BOARD_EGL_WORKAROUND_BUG_10194508 := true
# TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
# BOARD_EGL_SKIP_FIRST_DEQUEUE := true
# BOARD_EGL_NEEDS_FNW := true

# Legacy UI
# BOARD_USE_LEGACY_UI := true
# VSYNC_EVENT_PHASE_OFFSET_NS := 0

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true
DISABLE_DROIDDOC := true

# Board HW buttons
BOARD_HAS_NO_SELECT_BUTTON := true

# WIFI
USES_TI_MAC80211                 := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211

# Required for newer wpa_supplicant_8 versions to fix tethering
BOARD_WIFI_SKIP_CAPABILITIES     := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# Private libs for the non-TI wpa_supplicant
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wl12xx
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_WLAN_DEVICE                := wl12xx_mac80211
BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
WIFI_FIRMWARE_LOADER             := ""
COMMON_GLOBAL_CFLAGS             += -DUSES_TI_MAC80211

# Building wifi modules
# TARGET_MODULES_SOURCE := "$(TARGET_KERNEL_SOURCE)/drivers/net/wireless/compat-wireless_R5.SP2.03"
# TARGET_MODULES_SOURCE_DIR := "compat-wireless_R5.SP2.03"

# WIFI_MODULES:
# 	rm -rf $(KERNEL_OUT)/COMPAT
# 	mkdir $(KERNEL_OUT)/COMPAT
# 	cp -rf $(TARGET_MODULES_SOURCE) $(KERNEL_OUT)/COMPAT
# 	$(MAKE) -C $(KERNEL_OUT)/COMPAT/$(TARGET_MODULES_SOURCE_DIR) O=$(KERNEL_OUT)/COMPAT KERNEL_DIR=$(KERNEL_OUT) KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) $(KERNEL_CROSS_COMPILE)
# 	
# 	mv $(KERNEL_OUT)/COMPAT/$(TARGET_MODULES_SOURCE_DIR)/compat/compat.ko $(KERNEL_MODULES_OUT)
# 	mv $(KERNEL_OUT)/COMPAT/$(TARGET_MODULES_SOURCE_DIR)/net/mac80211/mac80211.ko $(KERNEL_MODULES_OUT)
# 	mv $(KERNEL_OUT)/COMPAT/$(TARGET_MODULES_SOURCE_DIR)/net/wireless/cfg80211.ko $(KERNEL_MODULES_OUT)
# 	mv $(KERNEL_OUT)/COMPAT/$(TARGET_MODULES_SOURCE_DIR)/drivers/net/wireless/wl12xx/wl12xx.ko $(KERNEL_MODULES_OUT)
# 	mv $(KERNEL_OUT)/COMPAT/$(TARGET_MODULES_SOURCE_DIR)/drivers/net/wireless/wl12xx/wl12xx_sdio.ko $(KERNEL_MODULES_OUT)
# 	
# 	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/compat.ko
# 	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/mac80211.ko
# 	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/cfg80211.ko
# 	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/wl12xx.ko
# 	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/wl12xx_sdio.ko
# 	
# TARGET_KERNEL_MODULES := WIFI_MODULES

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Sensors invensense
BOARD_USES_GENERIC_INVENSENSE := false

# Bluetooth
BOARD_HAVE_BLUETOOTH_TI := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/endeavoru/bluetooth

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
#RECOVERY_FSTAB_VERSION := 2
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_FSTAB := device/htc/endeavoru/recovery/root/fstab.endeavoru
TARGET_RECOVERY_DEVICE_MODULES += chargeled

BOARD_CUSTOM_BOOTIMG_MK := device/htc/endeavoru/recovery.mk

#TWRP CONFIG:

TW_THEME := portrait_hdpi
# this enables proper handling of /data/media on devices that have this folder for storage
RECOVERY_SDCARD_ON_DATA := true
# disables things like sdcard partitioning
BOARD_HAS_NO_REAL_SDCARD := true
# removes the USB storage button on devices that don't support USB storage
TW_NO_USB_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/tegra-pwm-bl/backlight/tegra-pwm-bl/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true
# fixes slanty looking graphics on some devices
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TWHAVE_SELINUX := true
HAVE_SELINUX := true

# Enable Minikin text layout engine (will be the default soon) (untested)
# USE_MINIKIN := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/endeavoru

# selinux policies
BOARD_SEPOLICY_DIRS += device/htc/endeavoru/sepolicy

