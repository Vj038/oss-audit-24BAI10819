# 🔍 OSS Audit — Git
### Open Source Software | Capstone Project
**Student:** 24BAI10819  
**Software Audited:** Git  
**License:** GPL v2  
**Course:** Open Source Software (NGMC)

---

## 📌 About This Project

This repository contains the shell scripts submitted as part of **The Open Source Audit** capstone project. The chosen software is **Git** — the distributed version control system created by Linus Torvalds in 2005, licensed under GPL v2.

The five scripts demonstrate practical Linux shell scripting skills and connect directly to the open source philosophy explored in the project report.

---

## 📁 Repository Structure

```
oss-audit-24BAI10819/
├── script1_system_identity.sh     # System welcome screen with OS info
├── script2_package_inspector.sh   # FOSS package checker with philosophy notes
├── script3_disk_auditor.sh        # Directory permissions and disk usage report
├── script4_log_analyzer.sh        # Log file keyword counter and analyzer
├── script5_manifesto_generator.sh # Interactive open source manifesto creator
└── README.md
```

---

## 📜 Script Descriptions

### Script 1 — System Identity Report
Displays a formatted welcome screen showing the Linux distribution name, kernel version, current user, home directory, system uptime, current date/time, and the open-source license covering the operating system.

**Concepts used:** Variables, `echo`, command substitution `$()`, `uname`, `whoami`, `date`, `uptime`, conditional check for `/etc/os-release`

---

### Script 2 — FOSS Package Inspector
Checks whether Git is installed on the system, displays its version and license information using the appropriate package manager (`apt`/`dpkg` or `rpm`), and prints a philosophy note about Git using a `case` statement.

**Concepts used:** `if-then-else`, `case` statement, `command -v`, `dpkg -l`, `rpm -qi`, `grep`, `awk`

---

### Script 3 — Disk and Permission Auditor
Loops through five important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports the permissions, owner, group, and disk usage of each. Also checks Git-specific paths including the binary and config files.

**Concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, directory existence check with `[ -d ]`

---

### Script 4 — Log File Analyzer
Reads a log file line by line using a `while read` loop, counts how many lines contain a given keyword (default: `error`), and prints a summary along with the last 5 matching lines. Accepts the log file path and keyword as command-line arguments.

**Concepts used:** `while IFS= read -r`, `if-then`, counter variables `$(())`, `grep -i`, `tail`, command-line arguments `$1`, `$2`, file existence check `[ -f ]`

---

### Script 5 — Open Source Manifesto Generator
Asks the user three interactive questions using `read -p`, then composes a personalised open source philosophy paragraph using string concatenation and saves it to a `.txt` file named after the current user.

**Concepts used:** `read -p` (interactive input), string concatenation, `echo` with `>` and `>>` for file writing, `cat` to display output, `date`, `whoami`, alias concept demonstrated via comment

---

## ⚙️ How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu, Debian, Fedora, or any distro)
- Bash shell (pre-installed on all Linux systems)
- Git installed (`sudo apt install git` or `sudo dnf install git`)

### Step 1 — Clone the repository
```bash
git clone https://github.com/Vj038/oss-audit-24BAI10819.git
cd oss-audit-24BAI10819
```

### Step 2 — Make scripts executable
```bash
chmod +x *.sh
```

### Step 3 — Run each script

**Script 1 — System Identity:**
```bash
./script1_system_identity.sh
```

**Script 2 — Package Inspector:**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk Auditor:**
```bash
./script3_disk_auditor.sh
```

**Script 4 — Log Analyzer:**
```bash
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
./script4_log_analyzer.sh /var/log/syslog error
# On Fedora/RHEL:
./script4_log_analyzer.sh /var/log/messages error
```

**Script 5 — Manifesto Generator:**
```bash
./script5_manifesto_generator.sh
# Follow the interactive prompts
```

---

## 🐧 Dependencies

| Dependency | Purpose | Install |
|-----------|---------|---------|
| `bash` | Shell interpreter | Pre-installed |
| `git` | Audited software | `sudo apt install git` |
| `coreutils` | `ls`, `du`, `date`, `whoami` | Pre-installed |
| `grep` | Pattern matching | Pre-installed |
| `awk` | Field extraction | Pre-installed |

---

## 📄 License

Scripts in this repository are submitted for academic evaluation under the VIT Open Source Software course. The audited software (Git) is licensed under **GPL v2**.
