#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=tb128fu
export DEVICE_COMMON=sm6225-common
export VENDOR=lenovo

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"

# Add namespace imports for device-specific Android.bp
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
python3 "${SCRIPT_DIR}/../../${VENDOR}/${DEVICE_COMMON}/add_namespace_imports.py" "${SCRIPT_DIR}/../../../vendor/${VENDOR}/${DEVICE}/Android.bp"