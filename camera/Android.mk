LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_C_INCLUDES := \
    frameworks/native/libs/sensor/include \
    system/media/camera/include

LOCAL_SHARED_LIBRARIES := \
    libhardware \
    liblog \
    libhidltransport \
    libutils \
    android.hidl.token@1.0-utils

LOCAL_STATIC_LIBRARIES := \
    android.hardware.camera.common@1.0-helper \
    libarect

LOCAL_HEADER_LIBRARIES := libhardware_headers

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.qcom
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
