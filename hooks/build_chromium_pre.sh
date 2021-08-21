#!/usr/bin/env bash

# apply patches prior to chromium build. note: this increases likelyhood of build failures.
# echo "applying vanadium patches"
# vanadium_dir="${ROOT_DIR}/vanadium"
# git clone https://github.com/GrapheneOS/Vanadium.git "${vanadium_dir}"
# cd "${CHROMIUM_BUILD_DIR}/src"
# git am --whitespace=nowarn ${vanadium_dir}/patches/*.patch

# Stop WebRCT leaking
cd "${CHROMIUM_BUILD_DIR}/src"
sed -i 's/kWebRTCIPHandlingDefault/kWebRTCIPHandlingDisableNonProxiedUdp/g' ./chrome/browser/ui/browser_ui_prefs.cc
