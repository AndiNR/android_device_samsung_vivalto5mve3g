$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/vivalto5mve3g/vivalto5mve3g-common-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/vivalto5mve3g/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/vivalto5mve3g/init.sc8830_ss.rc:root/init.sc8830_ss.rc \
	device/samsung/vivalto5mve3g/init.vivalto5mve3g.rc:root/init.vivalto5mve3g.rc \
	device/samsung/vivalto5mve3g/init.vivalto5mve3g_base.rc:root/init.vivalto5mve3g_base.rc \
	device/samsung/vivalto5mve3g/init.wifi.rc:root/init.wifi.rc \
	device/samsung/vivalto5mve3g/fstab.sc8830:root/fstab.sc8830 \
	device/samsung/vivalto5mve3g/init.board.rc:root/init.board.rc \
	device/samsung/vivalto5mve3g/init.sc8830.rc:root/init.sc8830.rc \
	device/samsung/vivalto5mve3g/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
	device/samsung/vivalto5mve3g/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
        device/samsung/vivalto5mve3g/init.recovery.board.rc:root/init.recovery.board.rc \
        device/samsung/vivalto5mve3g/property_contexts:root/property_contexts \
        device/samsung/vivalto5mve3g/seapp_contexts:root/seapp_context \
        device/samsung/vivalto5mve3g/sepolicy/file_contexts:root/file_contexts \
        device/samsung/vivalto5mve3g/root/sepolicy:root/sepolicy


LOCAL_PATH := device/samsung/vivalto5mve3g
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

ifeq ($(TARGET_BUILD_VARIANT),user)      
else      
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_vivalto5mve3g
PRODUCT_DEVICE := vivalto5mve3g
PRODUCT_MODEL := SM-G316HU
