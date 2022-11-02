#!/bin/bash
if [[ $EUID -ne 0 ]];
then
    echo "run as root"
    exit -1
fi

ip link set $1 down
ip link set $1 up
echo "======first dump:======="
ovs-appctl dpctl/dump-flows -m
sleep 1
echo "======second dump:======"
ovs-appctl dpctl/dump-flows -m
