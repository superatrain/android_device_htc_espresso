LOCAL_PATH := $(call my-dir)
LIBCAMERA_BUILD := 
include $(call all-subdir-makefiles)

include $(CLEAR_VARS)

LOCAL_C_FLAGS        += -O3
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false
CAMERA_LIB           := camera

ifeq ($(LIBCAMERA_BUILD),nexus)
CAMERA_LIB := camera-nexus
endif

TARGET_GLOBAL_LD_DIRS  += -L$(LOCAL_PATH) 
LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder libcutils libhardware libui libcamera
LOCAL_C_INCLUDES       := frameworks/base/services/ frameworks/base/include
LOCAL_C_INCLUDES       += hardware/libhardware/include/ hardware

include $(BUILD_SHARED_LIBRARY)
