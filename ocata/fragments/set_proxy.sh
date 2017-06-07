#!/bin/bash

sed -i '$a proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/yum.conf
yum install wget git -y
sed -i '$a https_proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
sed -i '$a http_proxy =http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
sed -i '$a ftp_proxy =http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
git config --global http.proxy  http://opscloud:cloud0518@10.53.13.245:3128
git config --global https.proxy  https://opscloud:cloud0518@10.53.13.245:3128