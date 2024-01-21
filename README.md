## linux_script

linux一件安装服务脚本，部分基于docker
请先安装好docker

## Docker安装脚本
```shell
curl -sSL https://get.daocloud.io/docker | sh
```

## Docker创建mysql57

```
docker run -d --name mysql -v ~/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=anjv123 -p 3306:3306 mysql:5.7
```

## 一键运行php代码

```
docker run --name website -v `pwd`:/var/www/html -dp 8000:80 zevenfang/docker-apache-php7
```

## docker运行openvpn

```shell
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://192.168.6.247
```
配置文件修改 topology subnet
```shell
docker run -v $OVPN_DATA:/etc/openvpn --rm -it -e "EASYRSA_BATCH=1" -e "EASYRSA_REQ_CN=Test CA" kylemanna/openvpn ovpn_initpki nopass
```
启动服务：`docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn`
生成客户端：`docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass`
导出客户端：`docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn`
启动服务：：   `docker run -v pwd:/etc/openvpn -it --rm -p 65001:1194 --cap-add=NET_ADMIN kylemanna/openvpn`
