# Domain Sniffer

**Domain Sniffer** is a lightweight Bash script that captures DNS queries from a specified device and extracts the domain names.



---

## ⚙️ Features

- Prompts for a target IP address and capture duration
- Captures DNS traffic on interface `br0` using `tcpdump`
- Extracts queried domain names from the capture using `tshark`
- Displays the domains in the terminal
- Automatically deletes the temporary `.pcap` file after processing

---

## 🛠 Requirements

- `tcpdump`
- `tshark` (part of the Wireshark package)

> Make sure both tools are installed and accessible on your system.

---

## 📌 Recommended Usage

This script is designed to be run **directly on your router**, such as a UniFi gateway or a Linux-based router, where traffic can be monitored from the bridge interface (`br0`).

> **Note:** On UniFi devices, you'll need to SSH into the router. Depending on your model, you may need to temporarily install `tcpdump` and `tshark`, as UniFi firmware does not persist custom binaries across reboots.

---

## 🎯 Purpose

I created this script to **capture domain names queried by specific applications or devices** in order to build **domain-based VPN policy routes**. This is helpful when selectively routing specific app traffic (like streaming or gaming) through a VPN while keeping the rest on your normal internet connection.

---

## ▶️ How to Use

### 1. Make the script executable

Give the script permission to run:

```bash
chmod +x domain-sniffer.sh
```

### 2. Run the script

Execute it from the terminal:

```bash
./domain-sniffer.sh
```

