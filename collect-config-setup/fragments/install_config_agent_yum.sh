#!/bin/bash
set -eux
sed -i '$a proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/yum.conf

yum -y install https://www.rdoproject.org/repos/rdo-release.rpm
yum -y install os-collect-config python-zaqarclient os-refresh-config os-apply-config openstack-heat-templates python-oslo-log python-psutil
#yum-config-manager --disable 'epel*'
