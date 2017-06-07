#!/bin/bash

set -eux


sed -i '$a proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/yum.conf
yum install wget git -y
sed -i '$a https_proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
sed -i '$a http_proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
sed -i '$a ftp_proxy=ftp://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc

touch /root/.gitconfig
chmod 0644 /root/.gitconfig
sed -i '$a [http]' /root/.gitconfig
sed -i '$a proxy = http://opscloud:cloud0518@10.53.13.245:3128' /root/.gitconfig
sed -i '$a [https]' /root/.gitconfig
sed -i '$a proxy = https://opscloud:cloud0518@10.53.13.245:3128' /root/.gitconfig

#git config --global http.proxy  http://opscloud:cloud0518@10.53.13.245:3128
#git config --global https.proxy  https://opscloud:cloud0518@10.53.13.245:3128