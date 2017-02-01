#!/bin/sh

exit 0

ifup() {
    /sbin/ip netns add $1
    /sbin/ip link set dev $2 netns $1
    /sbin/ip -n $1 addr flush dev $2
    /sbin/ip -n $1 link set dev $2 up
    /sbin/ip -n $1 addr add $3 dev $2
    /sbin/ip -n $1 route add default via $4
}

ifup upstream ens256 172.20.16.90/24 172.20.16.1

exit 0
