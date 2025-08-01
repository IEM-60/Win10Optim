

CORTANA BLOCK

# Import Appx module
Import-Module Appx -UseWindowsPowerShell

# Check if Cortana is present
$cortanastat = Get-AppxPackage -AllUsers -Name Microsoft.549981C3F5F10
Write-Host "Windows PowerShell compatibility session started" -ForegroundColor Yellow

if (-not($cortanastat)) {
	Write-Host "Cortana already uinstalled" -ForegroundColor Green
}

# Prompt to uninstall Cortana
else {
	Write-Host "Cortana is installed" -ForegroundColor Magenta
	$cortanauninstall = Read-Host "Would you like to uninstall Cortana? (Y/N)"
		
	if ($cortanauninstall -match "^[Yy]$") {
		Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq `
		"Microsoft.549981C3F5F10" | Remove-AppxProvisionedPackage -Online
		Get-AppxPackage -AllUsers -Name Microsoft.549981C3F5F10 | Remove-AppxPackage
		Write-Host "Cortana successfully uninstalled" -ForegroundColor Green
	}
		
	else {
		Write-Host "Cortana was not removed" -ForegroundColor Magenta
	}
}

# Removing Windows PowerShell compatibility session
Remove-PSSession -Name WinPSCompatSession
Write-Host "Removed Windows PowerShell compatibility session" -ForegroundColor Yellow

Write-Host

Write-Host "AllowCortana status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" `
-rname "AllowCortana" -rvalue 0

Write-Host

Write-Host "AcceptedPrivacyPolicy status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" `
-rname "AcceptedPrivacyPolicy" -rvalue 0


