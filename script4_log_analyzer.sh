#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Vj038 | Roll No: 24BAI10819
# Course: Open Source Software
# Software Audited: Git
# Description: Reads a log file line by line, counts how many
#              lines contain a keyword, and prints a summary
#              with the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Command-line arguments ---
LOGFILE=$1                  # First argument: path to log file
KEYWORD=${2:-"error"}       # Second argument: keyword to search (default: error)

# --- Counter variable to track matches ---
COUNT=0

echo "=============================================="
echo "   Log File Analyzer"
echo "=============================================="
echo ""
echo "  Log File : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo "----------------------------------------------"

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the specified log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    echo ""
    echo "  Tip: Try one of these common log files:"
    echo "    /var/log/syslog      (Ubuntu/Debian)"
    echo "    /var/log/messages    (Fedora/RHEL)"
    echo "    /var/log/auth.log    (authentication logs)"
    exit 1
fi

# --- Check if the log file is empty ---
# -s returns true if file exists and has size greater than zero
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: Log file is empty. Nothing to analyze."
    exit 0
fi

echo "  Scanning log file..."
echo ""

# --- While-read loop: read file line by line ---
# IFS= prevents leading/trailing whitespace from being trimmed
# -r flag prevents backslash interpretation
while IFS= read -r LINE; do
    # If-then: check if current line contains the keyword (case-insensitive)
    # grep -iq: -i = ignore case, -q = quiet (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter using arithmetic expansion
    fi
done < "$LOGFILE"   # Redirect file content into the while loop

# --- Print summary ---
echo "----------------------------------------------"
echo "  SUMMARY"
echo "----------------------------------------------"
echo "  Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "  $LOGFILE"
echo ""

# --- Print last 5 matching lines for context ---
echo "  Last 5 lines containing '$KEYWORD':"
echo "----------------------------------------------"

# grep -i: case-insensitive search | tail -5: last 5 results
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

# Check if any matches were found before printing
if [ -n "$MATCHES" ]; then
    # Print each match with indentation for readability
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
else
    echo "  No matching lines found."
fi

echo "=============================================="
