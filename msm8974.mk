# Copyright (C) 2014 The CyanogenMod Project
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

COMMON_PATH := device/sony/msm8974-common

# Include HW subsystem-specific makefiles
-include $(LOCAL_PATH)/hardware/*/prop.mk

# Include msm8974-common system properties
-include $(LOCAL_PATH)/systemprop.mk

# File systems
PRODUCT_PACKAGES += \
    mount.exfat

# Ion
PRODUCT_PACKAGES += \
    libion

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.perf.cores_online=2 \
    ro.vendor.extension_library=libqti-perfd-client.so

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay
ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-radio
    $(call inherit-product, $(COMMON_PATH)/radio.mk)
else
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-wifionly
endif

# Recovery
PRODUCT_PACKAGES += \
    keycheck

# TimeKeep for managing time offsets w.r.t. RTC
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep
