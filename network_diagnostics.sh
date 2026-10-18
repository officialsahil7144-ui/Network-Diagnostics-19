#!/usr/bin/env bash
set -u

echo "Network Diagnostics"
echo "-------------------"

echo
echo "Hostname:"
hostname

echo
echo "IP addresses:"
ip -brief address || true

echo
echo "Routing table:"
ip route || true

echo
echo "DNS configuration:"
if [[ -f /etc/resolv.conf ]]; then
    cat /etc/resolv.conf
else
    echo "DNS configuration file not found."
fi

echo
echo "Network connectivity test:"
if command -v ping >/dev/null 2>&1; then
    ping -c 2 -W 2 1.1.1.1 || true
else
    echo "ping command is not installed."
fi

echo
echo "Diagnostics completed."
