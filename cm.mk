# Release name
PRODUCT_RELEASE_NAME := endeavoru

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
# $(call inherit-product, vendor/cm/config/common.mk)
# $(call inherit-product, vendor/cm/config/common_mini.mk)
# $(call inherit-product, vendor/cm/config/common_mini_phone.mk)
$(call inherit-product, vendor/cm/config/common_mini_tablet_wifionly.mk)
# $(call inherit-product, vendor/cm/config/common_full.mk)
# $(call inherit-product, vendor/cm/config/common_full_phone.mk)
# $(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/htc/endeavoru/full_endeavoru.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := endeavoru
PRODUCT_NAME := cm_endeavoru
PRODUCT_BRAND := htc
PRODUCT_MODEL := endeavoru
PRODUCT_MANUFACTURER := htc

CM_VERSION=CM13.0-$(PRODUCT_BRAND)-$(PRODUCT_DEVICE)
