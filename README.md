# System Health Monitor (PowerShell)
A simple PowerShell script that monitors key system resources (CPU usage, memory usage, and disk space) and logs the data into a timestamped file and alerts when CPU or memmory usage exceeds threshold.

# Features
- Retrieves current CPU load percentage.
- Calculates used and total physical memory.
- Displays available disk space on drive C:.
- Logs the data in `logs/system_log.txt`.
- Alerts when CPU or Memory usage exceeds threshold
- Displays real-time popup warnings

# Project Structure
<pre>system-monitor-project/
├── logs/
│   └── system_log.txt # Output log file
├── monitor.ps1        # Main PowerShell script for system monitoring
|__ monitor_gui.ps1    # PowerShell script that shows GUI dashboard
└── README.md          # Project documentation
</pre>

# How to Use
1. Clone or download this repository.
2. Open the folder in VS Code.
3. Run the script using the built-in terminal:
   ``` powershell
   .\monitor.ps1
4. Adjust the thresholds at the top of the script if needed.
5. Check the logs/system_log.txt file for system info.

## Requirements
- Windows PowerShell
- Execution Policy set to allow scripts (`RemoteSigned` or `Unrestricted`)

# Sample Output
<pre>[2025-08-04 20:50:48]
CPU Load        : 9%
Memory Usage    : 3.43 GB / 3.88 GB
Disk Free Space : 108.67 GB / 272.53 GB
-----------------------------------------------
</pre>

# Future Improvements
- Email notifications
- Export logs to a CSV or HTML dashboard
- Add scheduled automation

# Why This Matters
This project simulates real-world IT Ops tasks: monitoring systems, writing scripts, and generating reports — ideal for learning basic scripting ang system monitoring.