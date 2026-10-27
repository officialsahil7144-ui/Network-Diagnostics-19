#!/usr/bin/env bash 
echo "Hostname:" 
hostname 
echo 
echo "IP addresses:" 
ip -brief address 2>/dev/null || hostname -I 
echo 
echo "Routing table:" 
ip route 2>/dev/null || route -n 2>/dev/null || true 
echo 
echo "DNS lookup:" 
getent hosts example.com || echo "DNS lookup failed or network unavailable" 
echo 
echo "SSH client version:" 
ssh -V 2>&1 
