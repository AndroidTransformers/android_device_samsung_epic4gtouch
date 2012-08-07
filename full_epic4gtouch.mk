# Copyright (C) 2012 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/samsung/epic4gtouch/epic4gtouch.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_epic4gtouch
PRODUCT_DEVICE := epic4gtouch
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SPH-D710 

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-flags=m=y,v=n,o=v,u=n \
    dalvik.vm.execution-mode=int:jit \
    ro.ril.disable.power.collapse=0 \
    wifi.supplicant_scan_interval=180 \
    debug.performance.tuning=1 \
    video.accelerate.hw=1 \
    windowsmgr.max_events_per_sec=300 \
    persist.adb.notify=0 \
    ro.kernel.android.checkjni=0 \
    ro.HOME_APP_ADJ=1 \
    debug.sf.hw=1 \
    dalvik.vm.heapsize=64m \
    persist.sys.ui.hw=1 \
    ro.max.fling_velocity=12000 \
    ro.min.fling_velocity=8000 \
    ro.config.nocheckin=1 \
    ro.telephony.call_ring.delay=0 \
    persist.sys.purgeable_assets=1