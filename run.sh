#!/bin/bash -l
passwd = $1
echo "password: ${passwd}"
sudo apt-get install shadowsocks
