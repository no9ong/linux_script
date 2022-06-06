#! /bin/bash

# 拉取镜像
docker pull fcojean/l2tp-ipsec-vpn-server
# 加载 IPsec NETKEY 内核模块
sudo modprobe af_key

# 配置PSK，用户名和密码。
# 该配置psk为“abcdefg”，两个用户名user1和user2，密码都为123456
cat>vpn.env<<EOF
VPN_IPSEC_PSK=abcdefg
VPN_PUBLIC_IP=122.9.147.89
VPN_USER_CREDENTIAL_LIST=[{"login":"user1","password":"123456"},{"login":"user2","password":"123456"}]
EOF

echo ">>>成功<<<"

# 运行容器
docker run \
    --name vpn-server \
    --env-file ./vpn.env \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    fcojean/l2tp-ipsec-vpn-server


