#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Vj038 | Roll No: 24BAI10819
# Course: Open Source Software
# Software Audited: Git
# Description: Checks if a FOSS package is installed, shows
#              its version and license info, and prints a
#              philosophy note using a case statement.
# ============================================================

# --- Package to inspect ---
PACKAGE="git"   # The OSS software being audited

echo "=============================================="
echo "   FOSS Package Inspector"
echo "=============================================="
echo ""
echo "  Checking package: $PACKAGE"
echo "----------------------------------------------"

# --- Detect package manager and check if package is installed ---
# Different Linux distros use different package managers
# apt  -> Ubuntu/Debian
# rpm  -> Fedora/RHEL/CentOS
# which -> fallback check using PATH

if command -v apt &>/dev/null; then
    # Ubuntu/Debian system — use dpkg to query package info
    if dpkg -l "$PACKAGE" &>/dev/null; then
        echo "  STATUS  : $PACKAGE is INSTALLED"
        echo ""
        # Extract version and description using dpkg and grep
        VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
        echo "  Version : $VERSION"
    else
        echo "  STATUS  : $PACKAGE is NOT installed."
        echo "  Install : sudo apt install $PACKAGE"
    fi

elif command -v rpm &>/dev/null; then
    # Fedora/RHEL system — use rpm to query package info
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "  STATUS  : $PACKAGE is INSTALLED"
        echo ""
        # Use rpm -qi to get detailed info, grep for key fields
        rpm -qi "$PACKAGE" | grep -E "Version|License|Summary"
    else
        echo "  STATUS  : $PACKAGE is NOT installed."
        echo "  Install : sudo dnf install $PACKAGE"
    fi

else
    # Fallback: check if git binary exists anywhere in PATH
    if command -v "$PACKAGE" &>/dev/null; then
        echo "  STATUS  : $PACKAGE is INSTALLED (found in PATH)"
        # Use git's built-in version flag as fallback
        "$PACKAGE" --version
    else
        echo "  STATUS  : $PACKAGE is NOT installed."
    fi
fi

echo ""
echo "----------------------------------------------"
echo "  Open Source Philosophy Note:"
echo "----------------------------------------------"

# --- Case statement: print a philosophy note based on package name ---
# Each case matches a known FOSS package and explains its significance
case $PACKAGE in
    git)
        echo "  Git: Born in 2005 when Linus Torvalds needed a"
        echo "  version control system after BitKeeper revoked"
        echo "  free access to the Linux kernel team. He built"
        echo "  Git in two weeks — open, distributed, and free."
        echo "  Licensed under GPL v2."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Powers roughly 30 percent of all websites globally."
        echo "  Licensed under Apache 2.0."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by community."
        echo "  The PSF license ensures it remains free forever."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris to stream video"
        echo "  over a university network. Now plays everything."
        echo "  Licensed under LGPL / GPL."
        ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open web"
        echo "  against browser monopolies. Licensed under MPL 2.0."
        ;;
    *)
        # Default case for any other package not listed above
        echo "  $PACKAGE: An open-source tool that embodies"
        echo "  the philosophy of sharing, transparency, and"
        echo "  collective improvement."
        ;;
esac

echo "=============================================="
