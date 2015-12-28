<<<<<<< HEAD
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/vivalto5mve3g

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/vivalto5mve3g/BoardConfigVendor.mk


TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Platform
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := SC7727S

# Assert
TARGET_OTA_ASSERT_DEVICE := vivalto5mve3g,SM-G316HU,SC7727S


# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
#BOARD_KERNEL_OFFSET := 0x00008000
#BOARD_RAMDISK_OFFSET := 0x01000000
#BOARD_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt device/samsung/vivalto5mve3g/dt.img
TARGET_KERNEL_CONFIG := vivalto5mve3g_hw00_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/vivalto5mve3g
#BOARD_USES_UNCOMPRESSED_BOOT := true

TARGET_NO_BOOTLOADER				:= true
TARGET_NO_RADIOIMAGE				:= true

# PARTITION SIZE
BOARD_BOOTIMAGE_PARTITION_SIZE			:= 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE		:= 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE		:= 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE		:= 2185232384
<<<<<<< HEAD
BOARD_CACHEIMAGE_PARTITION_SIZE			:= 209715200
BOARD_FLASH_BLOCK_SIZE				:= 131072
TARGET_USERIMAGES_USE_EXT4			:= true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE		:= ext4
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

#BOARD_HAS_LARGE_FILESYSTEM := true
USES_UNCOMPRESSED_KERNEL := true
BOARD_PRODNVIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_SYSTEMIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_CACHEIMAGES_SPARSE_EXT_DISABLED := true
TARGET_PRODNVIMAGES_SPARSE_EXT_DISABLED := true
VSYNC_EVENT_PHASE_OFFSET_NS := 0

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR	:= device/samsung/vivalto5mve3g/bluetooth
BOARD_HAVE_BLUETOOTH 				:= true
BOARD_BLUEDROID_VENDOR_CONF 			:= device/samsung/vivalto5mve3g/bluetooth/libbt_vndcfg.txt

# Hardware rendering
USE_OPENGL_RENDERER 				:= true
BOARD_EGL_CFG 					:= device/samsung/vivalto5mve3g/egl.cfg
BOARD_USE_MHEAP_SCREENSHOT                      := true
BOARD_EGL_WORKAROUND_BUG_10194508               := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK           := true
BOARD_EGL_NEEDS_FNW 				:= true
COMMON_GLOBAL_CFLAGS 				+= -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS                            += -DMR0_CAMERA_BLOB -DEGL_NEEDS_FNW -DMR0_AUDIO_BLOB -DSAMSUNG_BCM_AUDIO_BLOB -DSC8830_HWC

# kernel
#TARGET_PREBUILT_KERNEL                          := $(DEVICE_FOLDER)/prebuilt/kernel

USE_OPENGL_RENDERER                             := true
USE_OVERLAY_COMPOSER_GPU                        := true
DEVICE_FORCE_VIDEO_GO_OVERLAYCOMPOSER           := true


# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true


# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/vivalto5mve3g/rootdir/fstab.sc8830
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_USE_BGRA_8888 := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_USES_MMCUTILS := false
BOARD_RECOVERY_ALWAYS_WIPES := false
BOARD_SUPPRESS_EMMC_WIPE := true


# don't take forever to wipe
BOARD_SUPPRESS_SECURE_ERASE := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

BOARD_HAS_NO_REAL_SDCARD := true


ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif


CONFIG_EXT4_FS_SECURITY=y
BOARD_HAVE_SELINUX := true


# config sepolicy
BOARD_SEPOLICY_DIRS := device/samsung/vivalto5mve3g/sepolicy

BOARD_SEPOLICY_UNION := \
       file.te \
       file_contexts \
       seapp_contexts \
       theme.te \
       healthd.te \
       init.te \
       init_shell.te \
       installd.te \
       netd.te \
       shell.te \
       system.te \
       untrusted_app.te \
       vold.te \
       zygote.te

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

