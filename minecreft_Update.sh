#! /usr/bin/bash

echo 备份配置和权限

mv server.properties serverproperties

mv permissions.json permissionsjson

bedrock_server_ver=$(wget -qO- "https://www.minecraft.net/zh-hans/download/server/bedrock/"|grep "https://minecraft.azureedge.net/bin-linux/bedrock-server-")

new_ver=${bedrock_server_ver%%.zip*}
new_ver=${new_ver##*server-}
echo 最新版本:$new_ver

echo 正在下载v.${new_ver}版本

wget --no-check-certificate -N https://minecraft.azureedge.net/bin-linux/bedrock-server-${new_ver}.zip

echo 下载完成,开始更新

apt-get install unzip -y

unzip -o bedrock-server-${new_ver}.zip

rm -rf bedrock-server-${new_ver}.zip

echo 开始还原配置和权限

rm -rf server.properties permissions.json

mv serverproperties server.properties

mv permissionsjson permissions.json

echo 更新完成

rm -rf update.sh
