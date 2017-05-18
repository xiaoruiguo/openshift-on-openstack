#!/bin/bash
#
# Prepare the Load Balancer host to run ansible for host configuration
#
# ENVVARS
#   WC_NOTIFY: A curl query prefix to provide status to OpenStack WaitCondition

# Exit immediately on error or on reference to an undefined variable
set -eu
set -x

# Exit with return code of the last non-zero part of a pipe (or 0 for success)
set -o pipefail

source /usr/local/share/openshift-on-openstack/common_functions.sh

sed -i '$a proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/yum.conf
yum install wget git -y
sed -i '$a https_proxy=http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
sed -i '$a http_proxy =http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
sed -i '$a ftp_proxy =http://opscloud:cloud0518@10.53.13.245:3128/' /etc/wgetrc
git config --global http.proxy  http://opscloud:cloud0518@10.53.13.245:3128
git config --global http.proxy  https://opscloud:cloud0518@10.53.13.245:3128

# ==============================================================================
# MAIN
# ==============================================================================

# workaround for openshift-ansible - Add /usr/local/bin to sudo PATH
#   symlinks are created in /usr/local/bin but this path is not by
#   default in sudo secure_path so ansible fails
sed -i '/secure_path =/s|=.*|= /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin|' \
    /etc/sudoers

# Disable requiretty: allow sudo via SSH
sed -i "/^Defaults.*requiretty/s/^/#/" /etc/sudoers

notify_success "OpenShift node has been prepared for running ansible."
