# monitor.ps1 - System Health Monitor Script

Add-Type -AssemblyName System.Windows.Forms

# Thresholds
$cpuThreshold = 10    # Alert if CPU is above 10%
$ramThreshold = 10    # Alert if RAM usage is above 10%

# 1. Get the current date and time
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 2. Get average CPU load percentage
$cpu = Get-WmiObject win32_processor |
       Measure-Object -Property LoadPercentage -Average |
       Select-Object -ExpandProperty Average

# 3. Get total and used memory (in GB)
$mem = Get-WmiObject Win32_OperatingSystem
$usedMem = [math]::Round(($mem.TotalVisibleMemorySize - $mem.FreePhysicalMemory) / 1MB, 2)
$totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2)
$memUsagePercent = [math]::Round(($usedMem / $totalMem) * 100, 2)

# Threshold Alerts
if ($cpu -gt $cpuThreshold) {
    Write-Host " WARNING: CPU usage is high: $cpu%" -ForegroundColor Red
    [System.Windows.Forms.MessageBox]::Show(" High CPU usage: $cpu%", "CPU Alert", "OK", "Warning")
}

if ($memUsagePercent -gt $ramThreshold) {
    Write-Host " WARNING: Memory usage is high: $memUsagePercent%" -ForegroundColor Red
    [System.Windows.Forms.MessageBox]::Show(" High Memory usage: $memUsagePercent%", "Memory Alert", "OK", "Warning")
}

# 4. Get disk space info (Drive C:)
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'"
$freeDiskGB = [math]::Round(($disk.FreeSpace / 1GB), 2)
$totalDiskGB = [math]::Round(($disk.Size / 1GB), 2)

# 5. Combine all info into a log string
$log = @"
[$date]
CPU Load        : $cpu%
Memory Usage    : $usedMem GB / $totalMem GB ($memUsagePercent%)
Disk Free Space : $freeDiskGB GB / $totalDiskGB GB
-----------------------------------------------
"@

# 6. Save the log into the "logs/system_log.txt" file (append mode)
$log | Out-File -Append -FilePath ".\logs\system_log.txt"
