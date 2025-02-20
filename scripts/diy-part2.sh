#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 192.168.100.1 修改成你想要的就可以了
# sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# 修改子网掩码
# sed -i 's/255.255.255.0/255.255.0.0/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# ttyd自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 添加第三方应用
mkdir kiddin9
pushd kiddin9
git clone --depth=1 https://github.com/kiddin9/kwrt-packages .
popd

mkdir package/community
pushd package/community

#OpenClash
mkdir luci-app-openclash
cp -rf ../../kiddin9/luci-app-openclash/* luci-app-openclash
#加入OpenClash核心
chmod -R a+x $GITHUB_WORKSPACE/scripts/preset-clash-core.sh
if [ "$1" = "rk33xx" ]; then
    $GITHUB_WORKSPACE/scripts/preset-clash-core.sh arm64
elif [ "$1" = "rk35xx" ]; then
    $GITHUB_WORKSPACE/scripts/preset-clash-core.sh arm64
elif [ "$1" = "x86" ]; then
    $GITHUB_WORKSPACE/scripts/preset-clash-core.sh amd64
fi

# 添加第三方应用
echo "
#Openclash
CONFIG_PACKAGE_luci-app-openclash=y
" >> .config

# 额外组件
echo "
CONFIG_GRUB_IMAGES=y
CONFIG_VMDK_IMAGES=y
CONFIG_ISO_IMAGES=y
CONFIG_QCOW2_IMAGES=y
" >> .config

cat .config
