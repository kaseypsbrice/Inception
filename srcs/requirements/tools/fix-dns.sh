#!/bin/sh

NEW_NAMESERVER="nameserver 8.8.8.8"

sed -i "s/^namserver .*$/$NEW_NAMESERVER/" /etc/resolv.conf

echo "Updated /etc/resolv.conf"
cat /etc/resolv.conf
