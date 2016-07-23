LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := system/core/init
LOCAL_CFLAGS := -Wall
LOCAL_SRC_FILES := init_sony.cpp
LOCAL_MODULE := libinit_sony

ifneq ($(filter castor_windy scorpion_windy karin_windy,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DVARIANT_GSM="0"
endif

LOCAL_CFLAGS += -DLIBINIT_VARIANT_$(TARGET_DEVICE)

include $(BUILD_STATIC_LIBRARY)
