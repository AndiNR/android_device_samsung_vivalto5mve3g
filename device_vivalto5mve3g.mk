
LOCAL_PATH := device/samsung/vivalto5mve3g

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/vivalto5mve3g/vivalto5mve3g-vendor.mk)

# Use high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi hdpi xhdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/vivalto5mve3g/overlay

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.board.rc:root/init.recovery.board.rc \
    $(LOCAL_PATH)/rootdir/fstab.sc8830:root/fstab.sc8830

#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/rootdir/etc/extra.fstab:recovery/root/etc/extra.fstab 
#    $(LOCAL_PATH)/rootdir/etc/init.philz*.rc:recovery/root/etc/init.rc
#device/samsung/vivalto5mve3g/rootdir/etc/init.rc

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/vivalto5mve3g/init.sc8830_ss.rc:root/init.sc8830_ss.rc \
	device/samsung/vivalto5mve3g/init.vivalto5mve3g.rc:root/init.vivalto5mve3g.rc \
	device/samsung/vivalto5mve3g/init.vivalto5mve3g_base.rc:root/init.vivalto5mve3g_base.rc \
	device/samsung/vivalto5mve3g/init.wifi.rc:root/init.wifi.rc \
	device/samsung/vivalto5mve3g/init.board.rc:root/init.board.rc \
	device/samsung/vivalto5mve3g/init.sc8830.rc:root/init.sc8830.rc \
	device/samsung/vivalto5mve3g/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
	device/samsung/vivalto5mve3g/ueventd.sc8830.rc:root/ueventd.sc8830.rc
#        device/samsung/vivalto5mve3g/property_contexts:root/property_contexts \
#        device/samsung/vivalto5mve3g/seapp_contexts:root/seapp_context \
#        device/samsung/vivalto5mve3g/sepolicy/file_contexts:root/file_contexts \
#        device/samsung/vivalto5mve3g/root/sepolicy:root/sepolicy
#	device/samsung/vivalto5mve3g/fstab.sc8830:root/fstab.sc8830 \
#        device/samsung/vivalto5mve3g/init.target.rc:root/init.target.rc \


# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Override phone-hdpi-512-dalvik-heap to match value on stock
# - helps pass CTS com.squareup.okhttp.internal.spdy.Spdy3Test#tooLargeDataFrame)
# (property override must come before included property)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=56m \

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# For userdebug builds
#ADDITIONAL_DEFAULT_PROPERTIES += \
#    ro.secure=0 \
#    ro.adb.secure=0 \
#    ro.debuggable=1 \
#    persist.service.adb.enable=1 

ifeq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.sprd.modemreset=1 \
	ro.adb.secure=1 \
	persist.sys.sprd.wcnreset=1 \
        persist.sys.engpc.disable=1

endif

#$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_vivalto5mve3g
PRODUCT_DEVICE := vivalto5mve3g
PRODUCT_MODEL := SM-G316HU
