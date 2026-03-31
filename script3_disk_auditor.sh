#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Vj038 | Roll No: 24BAI10819
# Course: Open Source Software
# Software Audited: Git
# Description: Loops through key system directories and
#              reports permissions, owner, and disk usage.
#              Also checks Git's config directory specifically.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================================="
echo "   Disk and Permission Auditor"
echo "=============================================="
echo ""
echo "  Auditing key system directories..."
echo "----------------------------------------------"
printf "  %-15s %-25s %-10s\n" "Directory" "Permissions/Owner/Group" "Size"
echo "----------------------------------------------"

# --- For loop: iterate through each directory in the list ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory exists before trying to read it
    if [ -d "$DIR" ]; then
        # ls -ld gets directory info without listing contents
        # awk extracts: permissions(col1), owner(col3), group(col4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; 2>/dev/null suppresses errors
        # cut -f1 extracts just the size column
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # printf formats output in aligned columns
        printf "  %-15s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        echo "  $DIR => Does not exist on this system"
    fi
done

echo "----------------------------------------------"
echo ""
echo "  Checking Git-specific directories..."
echo "----------------------------------------------"

# --- Check Git's config directory specifically ---
# Git stores global config in the user's home directory
GIT_CONFIG_DIR="$HOME/.gitconfig"
GIT_DIR="/usr/bin/git"          # Git binary location
GIT_SYSTEM_CONFIG="/etc/gitconfig" # System-wide Git config

# Check if the git binary exists
if [ -f "$GIT_DIR" ]; then
    GIT_PERMS=$(ls -l "$GIT_DIR" | awk '{print $1, $3, $4}')
    echo "  Git Binary   : $GIT_DIR"
    echo "  Permissions  : $GIT_PERMS"
else
    echo "  Git binary not found at $GIT_DIR"
    # Try to find git using which command as fallback
    GIT_PATH=$(which git 2>/dev/null)
    if [ -n "$GIT_PATH" ]; then
        echo "  Git found at : $GIT_PATH"
    fi
fi

echo ""

# Check if user-level git config file exists
if [ -f "$GIT_CONFIG_DIR" ]; then
    echo "  User Git Config  : $GIT_CONFIG_DIR EXISTS"
    ls -l "$GIT_CONFIG_DIR" | awk '{print "  Permissions      : " $1, $3, $4}'
else
    echo "  User Git Config  : $GIT_CONFIG_DIR not found"
    echo "  (Run: git config --global user.name to create it)"
fi

echo ""

# Check system-wide git config
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    echo "  System Git Config: $GIT_SYSTEM_CONFIG EXISTS"
    ls -l "$GIT_SYSTEM_CONFIG" | awk '{print "  Permissions      : " $1, $3, $4}'
else
    echo "  System Git Config: $GIT_SYSTEM_CONFIG not found"
fi

echo "=============================================="
