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

# 修改openwrt登陆地址,把下面的 10.0.0.1 修改成你想要的就可以了
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 移除 ddns 和 ddnsto
sed -i 's/CONFIG_PACKAGE_ddns-scripts=y/CONFIG_PACKAGE_ddns-scripts=n/' .config
sed -i 's/CONFIG_PACKAGE_ddns-scripts-cloudflare=y/CONFIG_PACKAGE_ddns-scripts-cloudflare=n/' .config
sed -i 's/CONFIG_PACKAGE_ddns-scripts-dnspod=y/CONFIG_PACKAGE_ddns-scripts-dnspod=n/' .config
sed -i 's/CONFIG_PACKAGE_ddns-scripts-services=y/CONFIG_PACKAGE_ddns-scripts-services=n/' .config
sed -i 's/CONFIG_PACKAGE_ddns-scripts_aliyun=y/CONFIG_PACKAGE_ddns-scripts_aliyun=n/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-ddns=y/CONFIG_PACKAGE_luci-app-ddns=n/' .config
sed -i 's/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=y/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=n/' .config

sed -i 's/CONFIG_PACKAGE_ddnsto=y/CONFIG_PACKAGE_ddnsto=n/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-ddnsto=y/CONFIG_PACKAGE_luci-app-ddnsto=n/' .config
sed -i 's/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=y/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=n/' .config

# 移除 istore os 页面
sed -i 's/CONFIG_PACKAGE_quickstart=y/CONFIG_PACKAGE_quickstart=n/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-quickstart=y/CONFIG_PACKAGE_luci-app-quickstart=n/' .config
sed -i 's/CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn=y/CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn=n/' .config

# 移除网卡驱动
sed -i 's/CONFIG_PACKAGE_kmod-ath=y/CONFIG_PACKAGE_kmod-ath=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-ath10k=y/CONFIG_PACKAGE_kmod-ath10k=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9888=y/CONFIG_PACKAGE_ath10k-board-qca9888=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-board-qca988x=y/CONFIG_PACKAGE_ath10k-board-qca988x=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9984=y/CONFIG_PACKAGE_ath10k-board-qca9984=n/' .config   
sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9888=y/CONFIG_PACKAGE_ath10k-firmware-qca9888=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca988x=y/CONFIG_PACKAGE_ath10k-firmware-qca988x=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9984=y/CONFIG_PACKAGE_ath10k-firmware-qca9984=n/' .config

sed -i 's/CONFIG_PACKAGE_iw=y/CONFIG_PACKAGE_iw=n/' .config
sed -i 's/CONFIG_PACKAGE_iwinfo=y/CONFIG_PACKAGE_iwinfo=n/' .config  
sed -i 's/CONFIG_PACKAGE_kmod-iwlwifi=y/CONFIG_PACKAGE_kmod-iwlwifi=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax101=y/CONFIG_PACKAGE_iwlwifi-firmware-ax101=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax200=y/CONFIG_PACKAGE_iwlwifi-firmware-ax200=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax201=y/CONFIG_PACKAGE_iwlwifi-firmware-ax201=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax210=y/CONFIG_PACKAGE_iwlwifi-firmware-ax210=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192c-common=y/CONFIG_PACKAGE_kmod-rtl8192c-common=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192cu=y/CONFIG_PACKAGE_kmod-rtl8192cu=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192de=y/CONFIG_PACKAGE_kmod-rtl8192de=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192se=y/CONFIG_PACKAGE_kmod-rtl8192se=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8812au-ct=y/CONFIG_PACKAGE_kmod-rtl8812au-ct=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8821ae=y/CONFIG_PACKAGE_kmod-rtl8821ae=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8xxxu=y/CONFIG_PACKAGE_kmod-rtl8xxxu=n/' .config  
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi=y/CONFIG_PACKAGE_kmod-rtlwifi=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-pci=y/CONFIG_PACKAGE_kmod-rtlwifi-pci=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-usb=y/CONFIG_PACKAGE_kmod-rtlwifi-usb=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtw88=y/CONFIG_PACKAGE_kmod-rtw88=n/' .config

# # 移除 uhttpd
# sed -i 's/CONFIG_PACKAGE_uhttpd=y/CONFIG_PACKAGE_uhttpd=n/' .config
# sed -i 's/CONFIG_PACKAGE_uhttpd-mod-ubus=y/CONFIG_PACKAGE_uhttpd-mod-ubus=n/' .config
# sed -i 's/CONFIG_PACKAGE_libiwinfo-lua=y/CONFIG_PACKAGE_libiwinfo-lua=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-ssl-openssl=y/CONFIG_PACKAGE_luci-ssl-openssl=n/' .config

# 移除 bootstrap 主题
sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 添加 关机
echo "
CONFIG_PACKAGE_luci-app-poweroff=y
CONFIG_PACKAGE_luci-i18n-poweroff-zh-cn=y
" >> .config


# # 添加 nginx
# echo '
# # nginx
# CONFIG_NGINX_DAV=y
# CONFIG_NGINX_HTTP_ACCESS=y
# CONFIG_NGINX_HTTP_AUTH_BASIC=y
# CONFIG_NGINX_HTTP_AUTOINDEX=y
# CONFIG_NGINX_HTTP_BROWSER=y
# CONFIG_NGINX_HTTP_CACHE=y
# CONFIG_NGINX_HTTP_CHARSET=y
# CONFIG_NGINX_HTTP_EMPTY_GIF=y
# CONFIG_NGINX_HTTP_FASTCGI=y
# CONFIG_NGINX_HTTP_GEO=y
# CONFIG_NGINX_HTTP_GZIP=y
# CONFIG_NGINX_HTTP_GZIP_STATIC=y
# CONFIG_NGINX_HTTP_LIMIT_CONN=y
# CONFIG_NGINX_HTTP_LIMIT_REQ=y
# CONFIG_NGINX_HTTP_MAP=y
# CONFIG_NGINX_HTTP_MEMCACHED=y
# CONFIG_NGINX_HTTP_PROXY=y
# CONFIG_NGINX_HTTP_REFERER=y
# CONFIG_NGINX_HTTP_REWRITE=y
# CONFIG_NGINX_HTTP_SCGI=y
# CONFIG_NGINX_HTTP_SPLIT_CLIENTS=y
# CONFIG_NGINX_HTTP_SSI=y
# CONFIG_NGINX_HTTP_UPSTREAM_HASH=y
# CONFIG_NGINX_HTTP_UPSTREAM_IP_HASH=y
# CONFIG_NGINX_HTTP_UPSTREAM_KEEPALIVE=y
# CONFIG_NGINX_HTTP_UPSTREAM_LEAST_CONN=y
# CONFIG_NGINX_HTTP_USERID=y
# CONFIG_NGINX_HTTP_UWSGI=y
# CONFIG_NGINX_HTTP_V2=y
# CONFIG_NGINX_PCRE=y

# CONFIG_PACKAGE_luci-nginx=y
# CONFIG_PACKAGE_luci-ssl-nginx=y
# CONFIG_PACKAGE_musl-fts=m
# CONFIG_PACKAGE_my-default-settings=y
# CONFIG_PACKAGE_nginx=y
# CONFIG_PACKAGE_nginx-mod-luci=y
# CONFIG_PACKAGE_nginx-mod-luci-ssl=y
# CONFIG_PACKAGE_nginx-mod-ubus=y
# CONFIG_PACKAGE_nginx-ssl=y
# CONFIG_PACKAGE_nginx-ssl-util=y
# CONFIG_PACKAGE_nginx-util=y
# CONFIG_PACKAGE_objdump=m
# # CONFIG_PACKAGE_openwrt-keyring is not set
# CONFIG_PACKAGE_perf=m
# # CONFIG_PACKAGE_usign is not set
# CONFIG_PACKAGE_uwsgi=y
# CONFIG_PACKAGE_uwsgi-cgi-plugin=y
# CONFIG_PACKAGE_uwsgi-luci-support=y
# CONFIG_PACKAGE_uwsgi-syslog-plugin=y
# ' >> .config
