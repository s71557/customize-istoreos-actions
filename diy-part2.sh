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
sed -i 's/192.168.100.1/192.168.11.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 移除 ddns 和 ddnsto
 sed -i 's/CONFIG_PACKAGE_ddns-scripts=y/# CONFIG_PACKAGE_ddns-scripts=y/' .config
 sed -i 's/CONFIG_PACKAGE_ddns-scripts-cloudflare=y/# CONFIG_PACKAGE_ddns-scripts-cloudflare=y/' .config
 sed -i 's/CONFIG_PACKAGE_ddns-scripts-dnspod=y/# CONFIG_PACKAGE_ddns-scripts-dnspod=y/' .config
 sed -i 's/CONFIG_PACKAGE_ddns-scripts-services=y/# CONFIG_PACKAGE_ddns-scripts-services=y/' .config
 sed -i 's/CONFIG_PACKAGE_ddns-scripts_aliyun=y/# CONFIG_PACKAGE_ddns-scripts_aliyun=y/' .config
 sed -i 's/CONFIG_PACKAGE_luci-app-ddns=y/# CONFIG_PACKAGE_luci-app-ddns=y/' .config
 sed -i 's/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=y/# CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=y/' .config

# sed -i 's/CONFIG_PACKAGE_ddnsto=y/# CONFIG_PACKAGE_ddnsto=y/' .config
# sed -i 's/CONFIG_PACKAGE_luci-app-ddnsto=y/# CONFIG_PACKAGE_luci-app-ddnsto=y/' .config
# sed -i 's/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=y/# CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=y/' .config

# 移除 istore os 页面
# sed -i 's/CONFIG_PACKAGE_quickstart=y/# CONFIG_PACKAGE_quickstart=y/' .config
# sed -i 's/CONFIG_PACKAGE_luci-app-quickstart=y/# CONFIG_PACKAGE_luci-app-quickstart=y/' .config
# sed -i 's/CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn=y/# CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn=y/' .config

# 移除 uhttpd
# sed -i 's/CONFIG_PACKAGE_uhttpd=y/CONFIG_PACKAGE_uhttpd=n/' .config
# sed -i 's/CONFIG_PACKAGE_uhttpd-mod-ubus=y/CONFIG_PACKAGE_uhttpd-mod-ubus=n/' .config
# sed -i 's/CONFIG_PACKAGE_libiwinfo-lua=y/CONFIG_PACKAGE_libiwinfo-lua=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-ssl-openssl=y/CONFIG_PACKAGE_luci-ssl-openssl=n/' .config

# 移除 bootstrap 主题
 sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 添加 关机
echo "
CONFIG_GRUB_IMAGES=y
CONFIG_VMDK_IMAGES=y
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-poweroff=y
CONFIG_PACKAGE_luci-i18n-poweroff-zh-cn=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_kmod-inet-diag=y
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=y
CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_Transparent_Proxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_IPv6_Nat=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray_Plugin=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NONE_V2RAY=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_V2ray=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Xray=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Kcptun=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Hysteria=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_IPT2Socks=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_NaiveProxy=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Redsocks2=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Client=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Client=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Server=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Server=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_V2ray_Plugin=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Client=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-upnp=n
" >> .config

# 添加 nginx
# echo '
# nginx
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
# CONFIG_PACKAGE_openwrt-keyring is not set
# CONFIG_PACKAGE_perf=m
# CONFIG_PACKAGE_usign is not set
# CONFIG_PACKAGE_uwsgi=y
# CONFIG_PACKAGE_uwsgi-cgi-plugin=y
# CONFIG_PACKAGE_uwsgi-luci-support=y
# CONFIG_PACKAGE_uwsgi-syslog-plugin=y
# ' >> .config
