# 1. LOAD THE LIBRARIES
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# 2. GET CPU SPEED
$cpuInfo = Get-CimInstance Win32_Processor
$actualSpeed = [math]::Round($cpuInfo.MaxClockSpeed / 1000, 2)

# 3. CREATE THE WINDOW
$form = New-Object System.Windows.Forms.Form
$form.Text = "CPU + MEMORY TURBO BOOSTER"
$form.Size = New-Object System.Drawing.Size(320,330) # Made slightly taller for credit
$form.StartPosition = "CenterScreen"
$form.BackColor = "#2c3e50"

# 4. DEVELOPER CREDIT (Top Label)
$devLabel = New-Object System.Windows.Forms.Label
$devLabel.Text = "Developer by A.N.G Anurag"
$devLabel.Location = New-Object System.Drawing.Point(10,5)
$devLabel.Size = New-Object System.Drawing.Size(280,20)
$devLabel.ForeColor = "#bdc3c7" # Light grey color
$devLabel.Font = New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Italic)
$devLabel.TextAlign = "MiddleCenter"
$form.Controls.Add($devLabel)

# 5. MAIN TITLE LABEL
$label = New-Object System.Windows.Forms.Label
$label.Text = "CPU + MEMORY`nTURBO BOOSTER"
$label.Location = New-Object System.Drawing.Point(10,35)
$label.Size = New-Object System.Drawing.Size(280,60)
$label.ForeColor = "White"
$label.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::Bold)
$label.TextAlign = "MiddleCenter"
$form.Controls.Add($label)

# 6. SMART BOOST BUTTON
$btnBoost = New-Object System.Windows.Forms.Button
$btnBoost.Text = "ACTIVATE TURBO ($actualSpeed GHz)"
$btnBoost.Location = New-Object System.Drawing.Point(50,110)
$btnBoost.Size = New-Object System.Drawing.Size(200,45)
$btnBoost.BackColor = "#e67e22"
$btnBoost.ForeColor = "White"
$btnBoost.FlatStyle = "Flat"
$btnBoost.Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold)
$btnBoost.Add_Click({
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    [System.GC]::Collect()
    [System.Windows.Forms.MessageBox]::Show("TURBO ACTIVATED!`nCPU: $actualSpeed GHz`nMemory Cache Cleared!", "Success")
})
$form.Controls.Add($btnBoost)

# 7. NORMAL BUTTON
$btnNormal = New-Object System.Windows.Forms.Button
$btnNormal.Text = "STANDARD MODE"
$btnNormal.Location = New-Object System.Drawing.Point(50,175)
$btnNormal.Size = New-Object System.Drawing.Size(200,45)
$btnNormal.BackColor = "#27ae60"
$btnNormal.ForeColor = "White"
$btnNormal.FlatStyle = "Flat"
$btnNormal.Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold)
$btnNormal.Add_Click({
    powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
    [System.Windows.Forms.MessageBox]::Show("Returned to Standard Mode.", "Success")
})
$form.Controls.Add($btnNormal)

# 8. SHOW THE WINDOW
$form.ShowDialog()