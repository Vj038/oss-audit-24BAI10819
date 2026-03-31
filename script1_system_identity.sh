#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Vj038 | Roll No: 24BAI10819
# Course: Open Source Software
# Software Audited: Git
# Description: Displays a welcome screen showing system info
#              including kernel version, user, uptime, and
#              the open-source license covering the OS.
# ============================================================

# --- Variables ---
STUDENT_NAME="24BAI10819"         # Student roll number
SOFTWARE_CHOICE="Git"             # Chosen OSS software
OS_LICENSE="GPL v2"               # License covering Linux kernel

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)                # Get current kernel version
USER_NAME=$(whoami)               # Get current logged-in username
HOME_DIR=$HOME                    # Get home directory of current user
UPTIME=$(uptime -p)               # Get human-readable uptime
CURRENT_DATE=$(date '+%d-%m-%Y')  # Get current date (DD-MM-YYYY)
CURRENT_TIME=$(date '+%H:%M:%S')  # Get current time (HH:MM:SS)

# --- Detect Linux distribution name ---
# /etc/os-release contains distro info on most Linux systems
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Distribution"  # Fallback if file does not exist
fi

# --- Display formatted welcome screen ---
echo "=============================================="
echo "   OPEN SOURCE AUDIT — System Identity Report"
echo "=============================================="
echo ""
echo "  Student    : $STUDENT_NAME"
echo "  Software   : $SOFTWARE_CHOICE"
echo "----------------------------------------------"
echo "  Distro     : $DISTRO"
echo "  Kernel     : $KERNEL"
echo "  User       : $USER_NAME"
echo "  Home Dir   : $HOME_DIR"
echo "  Uptime     : $UPTIME"
echo "  Date       : $CURRENT_DATE"
echo "  Time       : $CURRENT_TIME"
echo "----------------------------------------------"
echo "  This system runs on the Linux kernel, which"
echo "  is licensed under: $OS_LICENSE"
echo "  GPL v2 ensures the OS and its source code"
echo "  remain free and open for everyone to use,"
echo "  study, modify, and distribute."
echo "=============================================="
