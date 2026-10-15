#!/usr/bin/env bash
# Kuat_Akberen_system.sh — prints student and system information

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Kuat_Akberen_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Akberen"
echo "Surname: Kuat"
echo "Group: IT2-2313"
echo "Student ID: 000000"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s) $(uname -r)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
if command -v free >/dev/null 2>&1; then
    free -h                      # Linux
else
    vm_stat | head -5            # macOS (no 'free' command)
fi
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
