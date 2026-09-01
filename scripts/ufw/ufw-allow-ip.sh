#!/bin/bash
#
# script.sh - Adds an IP to the firewall (ufw) allowing access
#             to ports 25565 and 24454, leaving a comment
#             with the specified name and date/time of addition.
#
# Usage:
#   sudo ./script.sh <IP> <COMMENT>
#
# Example:
#   sudo ./script.sh 192.168.0.100 fir3
#

set -euo pipefail

# --- Basic checks ---

if [ "$EUID" -ne 0 ]; then
    echo "Error: this script must be run as root (use sudo)."
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "Usage: $0 <IP> <COMMENT>"
    echo "Example: $0 192.168.0.100 fir3"
    exit 1
fi

IP="$1"
shift
COMMENT="$*"   # allows comments with spaces, e.g.: "fir3 PC"

PORTS=(25565 24454)

# --- Validate IP format (simple IPv4) ---
if ! [[ "$IP" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "Error: '$IP' does not appear to be a valid IPv4 address."
    exit 1
fi

for OCTET in $(echo "$IP" | tr '.' ' '); do
    if [ "$OCTET" -gt 255 ]; then
        echo "Error: '$IP' is not a valid IPv4 (octet > 255)."
        exit 1
    fi
done

# --- Check that ufw is available ---
if ! command -v ufw >/dev/null 2>&1; then
    echo "Error: ufw is not installed or not found in PATH."
    exit 1
fi

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
COMMENT="${COMMENT} - ${TIMESTAMP}"

# ufw limits comment length (default is usually 30 characters
# in older versions, more in recent versions). If your version truncates it,
# you'll see a warning when listing rules with 'ufw status verbose'.

echo "Adding ufw rules for $IP"
echo "Comment: \"$COMMENT\""
echo ""

for PORT in "${PORTS[@]}"; do
    ufw allow from "$IP" to any port "$PORT" proto tcp comment "$COMMENT"
    echo "  - Port $PORT/tcp: rule added."
done

echo ""
echo "Current rules for $IP:"
ufw status numbered | grep -E "$IP" || echo "(no matches found, check 'ufw status verbose')"

echo ""
echo "Note: ufw already persists rules automatically (no extra steps needed)."
echo "You can review the full details with: sudo ufw status verbose"