#!/bin/bash -l
passwd = $1
echo "password: ${passwd}"
yes|sudo apt-get install shadowsocks
