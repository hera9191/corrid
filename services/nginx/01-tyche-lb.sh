#!/bin/sh

env
set -x
if [ ${TYCHE_REPLICAS:-1} -gt 1 ]; then
    PROJECT_PREFIX="${PROJECT_PREFIX}-"
else
    PROJECT_PREFIX=""
fi
set +x
_upstream="upstream backend {\n"
i=1
while [ $i -le ${TYCHE_REPLICAS:-1} ]
do
    _upstream="${_upstream}    server ${PROJECT_PREFIX}tyche-$i:8080;\n"
    i=$(( $i + 1 ))
done
_upstream="${_upstream}}\n"

echo -e "${_upstream}" > /etc/nginx/conf.d/default.conf
cat << __EOF >> /etc/nginx/conf.d/default.conf

server {
    listen       80;
    listen  [::]:80;
    server_name  localhost;

    access_log  /var/log/nginx/host.access.log  main;

    location / {
        proxy_pass http://backend;
    }
}
__EOF

cat /etc/nginx/conf.d/default.conf
