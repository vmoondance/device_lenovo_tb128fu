#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
$(call inherit-product, device/lenovo/sm6225-common/bengal.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/lenovo/tb128fu/tb128fu-vendor.mk)

# Gapps
#$(call inherit-product, vendor/gapps/build/main.mk)

# API Level
PRODUCT_SHIPPING_API_LEVEL := 35

# Vendor API Level for Android 16
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.api_level=202506 \
    ro.board.api_level=202506 \
    ro.board.api_frozen=true

# VNDK Version for Android 16
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vndk.version=35 \
    ro.llndk.api_level=35

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2000
TARGET_SCREEN_WIDTH := 1200

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# 32-bit Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/sm8250/audio/primary-hal \
    hardware/qcom-caf/sm8250/audio/pal \
    hardware/qcom-caf/sm8250/audio/agm

# Keep device running on zygote crash for debugging (similar to eng builds)
PRODUCT_SYSTEM_PROPERTIES += \
	init.svc_debug.no_fatal.zygote=true \
	init.svc_debug.no_fatal.surfaceflinger=true \
	init.svc_debug.no_fatal.servicemanager=true \
	init.svc_debug.no_fatal.vold=true

# Enable ADB access for debugging
PRODUCT_PROPERTY_OVERRIDES += \
	ro.debuggable=1 \
	ro.secure=0 \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.sys.usb.config=mtp,adb

# Ensure custom init.target.rc with early adb is installed
PRODUCT_COPY_FILES += \
    device/lenovo/sm6225-common/rootdir/etc/init.target.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.target.rc
