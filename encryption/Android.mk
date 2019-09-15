LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_KEYMASTER_WAIT_FOR_QSEE),true)
LOCAL_CFLAGS += -DWAIT_FOR_QSEE
endif

include $(CLEAR_VARS)

LOCAL_MODULE := keystore.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := keymaster_qcom.cpp
LOCAL_C_INCLUDES := $(TARGET_OUT_HEADERS)/common/inc

LOCAL_CFLAGS := \
    -fvisibility=hidden -Wall \
    -D_ION_HEAP_MASK_COMPATIBILITY_WA

LOCAL_SHARED_LIBRARIES := \
    libcrypto \
    liblog \
    libc \
    libdl \
    libcutils \
    libhardware

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_OWNER := qcom

include $(BUILD_SHARED_LIBRARY)
