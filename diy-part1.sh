#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default
# echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >>feeds.conf.default
# echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default

# echo 'src-git kiddin9 https://github.com/kiddin9/openwrt-packages' >>feeds.conf

mkdir package/community
pushd package/community

git clone --depth 1 https://github.com/kiddin9/openwrt-packages
cd openwrt-packages
find . -maxdepth 1 -type d ! -name ca-bundle ! -name luci-ddns-go ! -name luci-app-ddns-go ! -name filebrowser ! -name luci-app-filebrowser -exec rm -rf {} \;

popd