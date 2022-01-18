# Copyright 2019 MXNavi, All Rights Reserved
### Standard Makefile template
### Copyright (C) Matthew Peddie <peddie@alum.mit.edu>
###
### This file is hereby placed in the public domain, or, if your legal
### system doesn't recognize this concept, you may consider it
### licensed under the WTFPL version 2.0 or any BSD license you
### choose.
###
### This file should be all you need to configure a basic project;
### obviously for more complex projects, you'll need to edit the other
### files as well.  It supports only one project at a time.  Type
### ``make help'' for usage help.

# What's the executable called?
PROJ = xallocator

LOCAL_PATH:= $(shell pwd)

MODULE_VERSION := $(shell git describe --tags --dirty)
ifeq ($(MODULE_VERSION),)
    MODULE_VERSION:= dev-$(shell git rev-parse --short HEAD)
endif

####################################################
xallocator_SRC_FILES := \
    src/Allocator.cpp	\
    src/Fault.cpp		\
    src/xallocator.cpp

LOCAL_SRC_FILES := \
    $(xallocator_SRC_FILES) \


LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/include \

LOCAL_CFLAGS += -DMODULE_VERSION=\"$(MODULE_VERSION)\"
LOCAL_CFLAGS += -DLOG_TAG=\"xallocator\"
#LOCAL_CFLAGS += -fvisibility=hidden

#LOCAL_LIBNAMES += libcutils

#LOCAL_LIBDIRS += $(ROOT_DIR)/foundation/libcutils

#######################################################

include $(ROOT_DIR)/build/makefile-$(TARGET_PLATFORM)-$(TARGET_ARCH).mk
