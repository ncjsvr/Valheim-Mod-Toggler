# Valheim Mod Toggler
# Enabled enabling / disabling Valheim mods easily and quickly
# Version 0.3
# Made by ncj - https://github.com/ncjsvr / Discord: ncj#001
# Valheim Plus Development Team - https://valheim.plus/

# Find Valheim
$SteamPath = (Get-ItemProperty "HKCU:\SOFTWARE\Valve\Steam").SteamPath
$GamePath = (Get-Content -Path $SteamPath\steamapps\appmanifest_892970.acf -TotalCount 5)[-1]

echo "Steam Location: $SteamPath"
echo "Game Location: $GamePath"

# Assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework

# Set Centre Screen
$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen;

# Set Powershell Compatibility Mode
Set-StrictMode -Version 2.0

# Create Form
$Form = New-Object system.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(300,125)
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

    $filecontent = Get-Content C:\Users\nath\Desktop\Repos\Valheim-Mod-Toggler\doorstop_config.ini
    $filecontent -replace 'enabled=false',"`enabled=true" | Set-Content C:\Users\nath\Desktop\Repos\Valheim-Mod-Toggler\doorstop_config.ini
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

    $filecontent = Get-Content C:\Users\nath\Desktop\Repos\Valheim-Mod-Toggler\doorstop_config.ini
    $filecontent -replace 'enabled=true',"`enabled=false" | Set-Content C:\Users\nath\Desktop\Repos\Valheim-Mod-Toggler\doorstop_config.ini
    [System.Windows.MessageBox]::Show('Valheim Mods Disabled')
    $form.Close()

})

# Render Enable Button
$btn_Enable.location = new-object system.drawing.point(17,5)
$btn_Enable.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($btn_Enable)

# Render Disable Button
$btn_Disable.location = new-object system.drawing.point(17,45)
$btn_Disable.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($btn_Disable)

# Render Form
[void]$Form.ShowDialog()

# Close Form
$Form.Dispose()

