# Inherit AOSP device configuration for hammerhead
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Inherit SOKP common bits
$(call inherit-product, vendor/sokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/sokp/configs/gsm.mk)


# Setup device specific product configuration
PRODUCT_NAME := sokp_hammerhead
PRODUCT_BRAND := google
PRODUCT_DEVICE := hammerhead
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hammerhead BUILD_FINGERPRINT=google/hammerhead/hammerhead:4.4.3/KTU84M/1158763:user/release-keys PRIVATE_BUILD_DESC="hammerhead-user 4.4.3 KTU84M 1158763 release-keys"

PRODUCT_COPY_FILES += \
    vendor/sokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
