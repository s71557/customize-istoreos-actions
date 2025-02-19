# 5G模组拨号脚本

# 目录

[一、简介](#一简介)

[二、使用说明 ](#二使用说明)

# 一、简介

该脚本适用于完整版和精简版固件使用，其他版本不支持

# 二、使用说明

详细说明：[点击查看](https://blog.siriling.com:1212/2023/03/18/openwrt-5g-modem/#jiao-ben-bo-hao)

1. 复制`5GModem`到`/root`目录内，并赋予755权限

2. 然后在计划任务中添加该命令，重启路由器

   ```shell
   * * * * * /root/5GModem/5g_crontab.sh
   ```

   

