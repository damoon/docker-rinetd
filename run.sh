#!/bin/bash

if [[ -z "$SERVICE_PORT" ]]; then
    echo "SERVICE_PORT is required"
    exit 1
fi

if [[ -z "$SERVER_IP" ]]; then
    SERVER_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
fi

if [[ -z "$LOCAL_PORT" ]]; then
    LOCAL_PORT="$SERVICE_PORT"
fi

# set up rinitd for forwarding
cp /etc/rinetd.conf.template /etc/rinetd.conf
sed -i "s/server_address/$SERVER_IP/" /etc/rinetd.conf
sed -i "s/localport/$LOCAL_PORT/" /etc/rinetd.conf
sed -i "s/serviceport/$SERVICE_PORT/" /etc/rinetd.conf 

/usr/sbin/rinetd -f -c /etc/rinetd.conf
