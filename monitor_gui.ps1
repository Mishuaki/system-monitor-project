Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "System Monitor"
$form.Size = New-Object System.Drawing.Size(400, 250)
$form.StartPosition = "CenterScreen"

# Labels
$cpuLabel = New-Object System.Windows.Forms.Label
$cpuLabel.Location = New-Object System.Drawing.Point(20, 20)
$cpuLabel.Size = New-Object System.Drawing.Size(350, 20)
$form.Controls.Add($cpuLabel)

$ramLabel = New-Object System.Windows.Forms.Label
$ramLabel.Location = New-Object System.Drawing.Point(20, 50)
$ramLabel.Size = New-Object System.Drawing.Size(350, 20)
$form.Controls.Add($ramLabel)

$diskLabel = New-Object System.Windows.Forms.Label
$diskLabel.Location = New-Object System.Drawing.Point(20, 80)
$diskLabel.Size = New-Object System.Drawing.Size(350, 20)
$form.Controls.Add($diskLabel)

# Function to update system info
function Update-SystemStats {
    $cpu = Get-WmiObject win32_processor |
           Measure-Object -Property LoadPercentage -Average |
           Select-Object -ExpandProperty Average

    $mem = Get-WmiObject Win32_OperatingSystem
    $usedMem = [math]::Round(($mem.TotalVisibleMemorySize - $mem.FreePhysicalMemory) / 1MB, 2)
    $totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2)

    $disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'"
    $freeDisk = [math]::Round($disk.FreeSpace / 1GB, 2)
    $totalDisk = [math]::Round($disk.Size / 1GB, 2)

    $cpuLabel.Text = "CPU Load: $cpu%"
    $ramLabel.Text = "Memory Usage: $usedMem GB / $totalMem GB"
    $diskLabel.Text = "Disk Space: $freeDisk GB / $totalDisk GB"
}

# Refresh button
$refreshBtn = New-Object System.Windows.Forms.Button
$refreshBtn.Location = New-Object System.Drawing.Point(20, 120)
$refreshBtn.Size = New-Object System.Drawing.Size(100, 30)
$refreshBtn.Text = "Refresh"
$refreshBtn.Add_Click({ Update-SystemStats })
$form.Controls.Add($refreshBtn)

# Initial update and run form
Update-SystemStats
$form.Topmost = $true
[void]$form.ShowDialog()
