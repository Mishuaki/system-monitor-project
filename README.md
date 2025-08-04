# System Health Monitor (PowerShell)

A simple PowerShell script that monitors key system resources (CPU usage, memory usage, and disk space) and logs the data into a timestamped file.

# Features

- Retrieves current CPU load percentage
- Calculates used and total physical memory
- Displays available disk space on drive C:
- Logs the data in `logs/system_log.txt`
- Can be run manually or scheduled via Task Scheduler

# Project Structure

<pre>system-monitor-project/
├── logs/
│   └── system_log.txt # Output log file
├── monitor.ps1        # Main PowerShell script for system monitoring
└── README.md          # Project documentation
</pre>

# How to Use

1. Clone or download this repository.
2. Open the folder in VS Code.
3. Run the script using the built-in terminal:
   ` ` `powershell
   .\monitor.ps1
4. Check the logs/system_log.txt file for system info.

# Sample Output
<pre>[2025-08-04 20:50:48]
CPU Load        : 9%
Memory Usage    : 3.43 GB / 3.88 GB
Disk Free Space : 108.67 GB / 272.53 GB
-----------------------------------------------
</pre>

# Future Improvements
- Add alert if CPU or memory exceeds a threshold
- Email or popup notifications
- Export logs to a CSV or HTML dashboard
- Add scheduled automation

# Why This Matters
This project simulates real-world IT Ops tasks: monitoring systems, writing scripts, and generating reports — perfect for building confidence in scripting and automation.
