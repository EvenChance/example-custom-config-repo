#!/usr/bin/env bash

cd "${AOSP_BUILD_DIR}"

# apply community patches
echo "applying community patches"
community_patches_dir="${ROOT_DIR}/community_patches"
rm -rf "${community_patches_dir}"
git clone https://github.com/EvenChance/community_patches "${community_patches_dir}"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00001-global-internet-permission-toggle.patch"
#patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00002-round-icon.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00003-enable-volte-wifi-calling.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00004-use-cloudflare-dns.patch"
#patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/90000-move-statusbar-clock-back-to-rhs.patch.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/90001-increase-binder-proxy-counting-watermarks.patch"


# apply custom hosts file
custom_hosts_file="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
echo "applying custom hosts file ${custom_hosts_file}"
retry wget -q -O "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts" "${custom_hosts_file}"
echo '192.168.20.2  beijing.lan' >> "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts"
echo '192.168.20.11  htpc.lan' >> "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts"
