#!/bin/sh
ip=$(curl -s https://ipinfo.io/ip)
echo "{\"ip\": \"$ip\"}"