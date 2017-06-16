#!/usr/bin/env bash

# Update the DNS server with a record for this host
# Execute on dns server.

set -eu
set -x
set -o pipefail

if [ -e /var/named/K${key_name}*.private ]; then
KEY="$(grep Key: /var/named/K${key_name}*.private | cut -d ' ' -f 2)"
else
echo "DNS Resource Record add Error."
fi

echo $KEY > $heat_outputs_path.result

# ansible all -i "localhost," -c local -m nsupdate -a "key_name='openshift.labs.local' key_secret=${key_secret} server='127.0.0.1' zone='openshift.labs.local' record='openshift-dns' value='10.238.121.4'"
ansible all -i "localhost," -c local -m nsupdate -a "        \
                           key_name=$key_name           \
                           key_secret=$KEY      \
                           server=$dns_server          \
                           zone=$dns_zone               \
                           record=$dns_record                \
                           value=$dns_record_ip"