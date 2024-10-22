#
# Copyright 2017 The Android Open Source Project
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
#
#
# Only the below variable(s) need to be changed!
#
# Identifier for common folder
COMMON_SOC := sm86xx

# Define hardware platform
PRODUCT_PLATFORM := pineapple

#
#
#
# The below variables will be generated automatically
#
#
# Release name (automatically taken from this file's suffix)
PRODUCT_RELEASE_NAME := $(lastword $(subst /, ,$(lastword $(subst _, ,$(firstword $(subst ., ,$(MAKEFILE_LIST)))))))

# Custom vendor used in build tree (automatically taken from this file's prefix)
CUSTOM_VENDOR := $(lastword $(subst /, ,$(firstword $(subst _, ,$(firstword $(MAKEFILE_LIST))))))

# Inherit from our custom product configuration
$(call inherit-product, vendor/$(CUSTOM_VENDOR)/config/common.mk)

# OEM Info (automatically taken from device tree path)
BOARD_VENDOR := $(or $(word 2,$(subst /, ,$(firstword $(MAKEFILE_LIST)))),$(value 2))

## Device identifier. This must come after all inclusions

PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := $(CUSTOM_VENDOR)_$(PRODUCT_DEVICE)
PRODUCT_MODEL := pineapple
PRODUCT_SYSTEM_NAME := $(PRODUCT_MODEL)
PRODUCT_SYSTEM_DEVICE := pineapple
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

# Common path for device trees
COMMON_PATH := device/$(PRODUCT_BRAND)/$(COMMON_SOC)-common

# Device path for OEM device tree
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, $(DEVICE_PATH)/device-$(PRODUCT_DEVICE).mk)

# Inherit any OrangeFox-specific settings
$(call inherit-product-if-exists, $(DEVICE_PATH)/fox_$(PRODUCT_RELEASE_NAME).mk)
