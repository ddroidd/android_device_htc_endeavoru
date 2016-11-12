
# Locales

# $(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# CUSTOM_LOCALES
ifndef CUSTOM_LOCALES
	CUSTOM_LOCALES := en_US es_ES gl_ES
endif


# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/htc/OneX/OneX-vendor.mk)

# common tegra3-HOX+ configs
$(call inherit-product, device/htc/OneX/tegra3.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/OneX/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/OneX/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Device identifier. This must come after all inclusions
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_DEVICE := OneX
PRODUCT_NAME := cm_OneX
PRODUCT_BRAND := htc
PRODUCT_MODEL := endeavoru
PRODUCT_MANUFACTURER := htc

CM_VERSION := CM13.0_$(BUILD_ID)-$(PRODUCT_BRAND)_$(DEVICE_NAME)-$(TARGET_BUILD_VARIANT)_$(TARGET_BUILD_TYPE)
