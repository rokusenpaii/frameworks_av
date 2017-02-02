LOCAL_PATH:= $(call my-dir)

# AAudio Service
include $(CLEAR_VARS)

LOCAL_MODULE := oboeservice
LOCAL_MODULE_TAGS := optional

LIBAAUDIO_DIR := ../../media/liboboe
LIBAAUDIO_SRC_DIR := $(LIBAAUDIO_DIR)/src

LOCAL_C_INCLUDES := \
    $(call include-path-for, audio-utils) \
    frameworks/native/include \
    system/core/base/include \
    $(TOP)/frameworks/native/media/liboboe/include/include \
    $(TOP)/frameworks/av/media/liboboe/include \
    frameworks/native/include \
    $(TOP)/external/tinyalsa/include \
    $(TOP)/frameworks/av/media/liboboe/src \
    $(TOP)/frameworks/av/media/liboboe/src/binding \
    $(TOP)/frameworks/av/media/liboboe/src/client \
    $(TOP)/frameworks/av/media/liboboe/src/core \
    $(TOP)/frameworks/av/media/liboboe/src/fifo \
    $(TOP)/frameworks/av/media/liboboe/src/utility

# TODO These could be in a liboboe_common library
LOCAL_SRC_FILES += \
    $(LIBAAUDIO_SRC_DIR)/utility/HandleTracker.cpp \
    $(LIBAAUDIO_SRC_DIR)/utility/AAudioUtilities.cpp \
    $(LIBAAUDIO_SRC_DIR)/fifo/FifoBuffer.cpp \
    $(LIBAAUDIO_SRC_DIR)/fifo/FifoControllerBase.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/SharedMemoryParcelable.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/SharedRegionParcelable.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/RingBufferParcelable.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/AudioEndpointParcelable.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/AAudioStreamRequest.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/AAudioStreamConfiguration.cpp \
    $(LIBAAUDIO_SRC_DIR)/binding/IAAudioService.cpp \
    SharedRingBuffer.cpp \
    FakeAudioHal.cpp \
    AAudioService.cpp \
    AAudioServiceStreamBase.cpp \
    AAudioServiceStreamFakeHal.cpp \
    TimestampScheduler.cpp \
    AAudioServiceMain.cpp \
    AAudioThread.cpp

LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wall -Werror

LOCAL_SHARED_LIBRARIES :=  libbinder libcutils libutils liblog libtinyalsa

include $(BUILD_EXECUTABLE)
