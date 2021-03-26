# Valheim Mod Toggler
# Enabled enabling / disabling Valheim mods easily and quickly
# Version 0.1
# Made by ncj - https://github.com/ncjsvr / Discord: ncj#001
# Valheim Plus Development Team - https://valheim.plus/

# Set Where Valheim Is Installed
# If you only have Steam installed to your C:\ drive you do not need to edit this.
# You only need to edit this if you have Valheim installed to a seperate steam library

$GamePath = ("C:\Program Files (x86)\Steam\steamapps\common\Valheim")


# Don't Edit Below This Line

# Assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework

# Modern Style
[System.Windows.Forms.Application]::EnableVisualStyles() 


# Set Centre Screen
$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen;

# Set Powershell Compatibility Mode
Set-StrictMode -Version 2.0

# Create Form
$Form = New-Object system.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(290,140)
$Form.minimumSize = New-Object System.Drawing.Size(290,140) 
$Form.maximumSize = New-Object System.Drawing.Size(290,140) 
$Form.FormBorderStyle = 'FixedS'
$Form.MaximizeBox = $false
$Form.Text = "Valheim Mod Toggler"
$Form.TopMost = $True
$Form.BackColor = "white"
$Form.StartPosition = $CenterScreen;


# Create Enable Button
$btn_Enable = New-Object system.windows.Forms.Button
$btn_Enable.Text = "Enable Valheim Mods"
$btn_Enable.BackColor = "Gray"
$btn_Enable.Width = 249
$btn_Enable.Height = 30
$btn_Enable.Add_MouseClick({

    $filecontent = Get-Content $GamePath\doorstop_config.ini
    $filecontent -replace 'enabled=false',"`enabled=true" | Set-Content $GamePath\doorstop_config.ini
    [System.Windows.MessageBox]::Show('Valheim Mods Enabled')
    $form.Close()

})

# Create Disable Button
$btn_Disable = New-Object system.windows.Forms.Button
$btn_Disable.Text = "Disable Valheim Mods"
$btn_Disable.BackColor = "Gray"
$btn_Disable.Width = 249
$btn_Disable.Height = 30
$btn_Disable.Add_MouseClick({

    $filecontent = Get-Content $GamePath\doorstop_config.ini
    $filecontent -replace 'enabled=true',"`enabled=false" | Set-Content $GamePath\doorstop_config.ini
    [System.Windows.MessageBox]::Show('Valheim Mods Disabled')
    $form.Close()

})

# Position Enable Button
$btn_Enable.location = new-object system.drawing.point(17,5)
$btn_Enable.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($btn_Enable)

# Position Disable Button
$btn_Disable.location = new-object system.drawing.point(17,45)
$btn_Disable.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($btn_Disable)

# Position Info
$Info                            = New-Object system.Windows.Forms.Label
$Info.text                       = "Created by ncj, Discord: ncj#0001"
$Info.AutoSize                   = $true
$Info.width                      = 25
$Info.height                     = 10
$Info.location                   = New-Object System.Drawing.Point(55,80)
$Info.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")
$Form.controls.AddRange(@($Info))


# Render Form
[void]$Form.ShowDialog()

# Close Form
$Form.Dispose()
