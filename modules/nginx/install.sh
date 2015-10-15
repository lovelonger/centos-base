#!/bin/bash

yum -y --enablerepo=nginx install nginx
rm -rf /etc/nginx/*
cp -a conf/* /etc/nginx
mkdir -p /opt/www
cp -r /usr/share/nginx/html/* /opt/www

cat > /etc/supervisord.d/nginx.conf << EOF
[program:nginx]
command=/usr/sbin/nginx
autorestart=true
EOF
