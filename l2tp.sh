#! /bin/bash

# 拉取镜像

docker pull hwdsl2/ipsec-vpn-server

# 加载 IPsec NETKEY 内核模块
sudo modprobe af_key
mkdir -p /etc/docker/vpn/

# 配置PSK，用户名和密码。
# 该配置psk为“abcdefg”，用户名no9ong,密码都为123456
cat>/etc/docker/vpn/vpn.env<<EOF
# 预共享密钥
VPN_IPSEC_PSK=abcdefg
# 用户账号
VPN_USER=no9ong
# 链接密码
VPN_PASSWORD=123456
EOF

echo ">>>成功<<<"

# 运行容器
docker run \
-itd \
--name vpn \
--env-file /etc/docker/vpn/vpn.env \
--restart=always \
-p 500:500/udp \
-p 4500:4500/udp \
-d --privileged \
hwdsl2/ipsec-vpn-server
