#!/usr/bin/env bash

# Update the DNS server with a record for this host
# Execute on dns server.

set -eu
set -x
set -o pipefail

# ansible all -i "localhost," -c local -m nsupdate -a "key_name='openshift.labs.local' key_secret=${key_secret} server='127.0.0.1' zone='openshift.labs.local' record='openshift-dns' value='10.238.121.4'"
ansible all -i "localhost," -c local -m nsupdate -a "        \
                           key_name=$domain_name           \
                           key_secret=$dns_update_key      \
                           server=$dns_nameserver          \
                           zone=$domain_name               \
                           record=$hostname                \
                           value=$HOST_FIX_IP"