## Specify phone tech before including full_phone	
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := vivalto5mve3g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/vivalto5mve3g/full_vivalto5mve3g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vivalto5mve3g
PRODUCT_NAME := cm_vivalto5mve3g
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-G316HU
PRODUCT_CHARACTERISTICS := phone
