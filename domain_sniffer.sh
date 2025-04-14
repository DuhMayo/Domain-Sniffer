#!/bin/bash

# Prompt for IP and capture duration
read -p "Enter the host IP (e.g., 192.168.0.1): " HOST_IP
read -p "Enter capture duration in seconds: " DURATION

# Define file paths
PCAP_FILE="/tmp/dns_capture.pcap"
DOMAINS_FILE="/tmp/domains.txt"

# Run tcpdump
echo "[*] Capturing DNS traffic from $HOST_IP for $DURATION seconds..."
timeout "$DURATION" tcpdump -i br0 -n port 53 and host "$HOST_IP" -w "$PCAP_FILE"

# Extract domains using tshark
echo "[*] Extracting domain queries..."
tshark -r "$PCAP_FILE" -Y "dns.qry.name" -T fields -e dns.qry.name > "$DOMAINS_FILE"

# Show results
echo "[*] Domains found:"
cat "$DOMAINS_FILE"

# Cleanup
rm -f "$PCAP_FILE"
echo "[*] Temporary pcap file deleted."
