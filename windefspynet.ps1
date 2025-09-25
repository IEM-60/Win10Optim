# Windows Defender SpyNetReporting disabling standalone script
# PowerShell 7 compatible / Must be run as administrator
# You must manually disable tamper protection for this script to work
# Author: IEMV


# FUNCTIONS
# Registry edit function
function Edit-RegxDW {
	param (
		[string]$rpath,
        [string]$rname,
        [object]$rvalue,
        [Microsoft.Win32.RegistryValueKind]$rtype = [Microsoft.Win32.RegistryValueKind]::DWord
	)
	
	if (Test-Path $rpath) {
		$readvalue = Get-ItemProperty -Path $rpath -Name $rname -ErrorAction SilentlyContinue
		
		if ($readvalue -ne $null -and $readvalue.PSObject.Properties.Name -contains $rname) {
			Write-Host "[$rname] is set to: $($readvalue.$rname)" -ForegroundColor Yellow
				
			if ($readvalue.$rname -ne $rvalue) {
				$regxresponse = Read-Host "Set $rname to $rvalue ? (Y/N)"
					
				if ($regxresponse -match "^[Yy]$") {
					# Set property to desired value
					Set-ItemProperty -Path $rpath -Name $rname -Type $rtype -Value $rvalue
					Write-Host "[$rname] set to $rvalue" -ForegroundColor Green
				}
	
				else {
					Write-Host "[$rname] settings were not modified" -ForegroundColor Magenta
				}
					
			}
					
			else {
				Write-Host "[$rname] already set to $rvalue" -ForegroundColor Green
			}
	
		}
	
		else {
			Write-Host "[$rname] is not set" -ForegroundColor Yellow
			
			$regxresponse = Read-Host "Set $rname to $rvalue ? (Y/N)"
					
				if ($regxresponse -match "^[Yy]$") {
					# Set property to desired value
					Set-ItemProperty -Path $rpath -Name $rname -Type $rtype -Value $rvalue
					Write-Host "[$rname] set to $rvalue" -ForegroundColor Green
				}
					
				else {
					Write-Host "[$rname] settings were not modified" -ForegroundColor Magenta
				}
					
		}
		
	}
	
	else {
		Write-Host "Path does not exist" -ForegroundColor Magenta
		
		$regxresponse = Read-Host "Create registry key and set $rname to $rvalue ? (Y/N)"
					
		if ($regxresponse -match "^[Yy]$") {
			# Create registry path
			New-Item -Path $rpath -Force
			Write-Host "Registry path created" -ForegroundColor green
			# Set property to desired value
			Set-ItemProperty -Path $rpath -Name $rname -Type $rtype -Value $rvalue
			Write-Host "[$rname] set to $rvalue" -ForegroundColor Green
		}
					
		else {
			Write-Host "[$rname] settings were not modified" -ForegroundColor Magenta
		}
					
	}

	
}
# Function ends


$INTRO = @" 

 __  ______  __    __  __   __  
/\ \/\  ___\/\ "-./  \/\ \ / /  
\ \ \ \  __\\ \ \-./\ \ \ \'/   
 \ \_\ \_____\ \_\ \ \_\ \__|   
  \/_/\/_____/\/_/  \/_/\/_/    

   - Windows Defender SpyNetReporting disabling standalone script -
"@

Write-Host $INTRO -ForegroundColor green

# Check for admin rights
$principal = [Security.Principal.WindowsPrincipal](
    [Security.Principal.WindowsIdentity]::GetCurrent()
)

If (-not $principal.IsInRole(
        [Security.Principal.WindowsBuiltInRole] "Administrator"
    )) {
    Write-Host "Please run this script with admin privileges" -ForegroundColor Red
    return
}

Write-Host
Write-Host

# Time stamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
# Backup directory
$backupFolder = "C:\Backups"

# Notice
Write-Host "NOTICE: This script will let you alter the following registry key:" -ForegroundColor Yellow
Write-Host "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet\SpyNetReporting" -ForegroundColor Yellow
Write-Host "It's recommended to create a restore point or a registry backup for your system." -ForegroundColor Yellow
Write-Host "Before starting making changes, the script will let you create both if you choose to." -ForegroundColor Yellow

Write-Host

# Restore point user prompt
$restorepresp = Read-Host "Do you want to create a restore point before starting? (recommended) (Y/N)"

if ($restorepresp -match "^[Yy]$") {
	Write-Host "Creating restore point..." -ForegroundColor Yellow
	Write-Host "This might take a while..." -ForegroundColor Yellow
	
	powershell.exe -Command "Checkpoint-Computer -Description 'Before new settings' -RestorePointType 'MODIFY_SETTINGS'"
	
	Write-Host
	Write-Host "Restore point created" -ForegroundColor Green
	Write-Host
}

else {
	Write-Host "Proceeding without restore point" -ForegroundColor Magenta
}

# Registry backup user prompt
$backupresp = Read-Host "Do you want to create a registry backup before starting? (recommended) (Y/N)"

if ($backupresp -match "^[Yy]$") {
	
	if (-not(Test-Path $backupFolder)) {
    New-Item -Path $backupFolder -ItemType Directory | Out-Null
	}
	
	Write-Host "Creating registry backup in C:\Backups" -ForegroundColor Yellow
	Write-Host "This might take a while..." -ForegroundColor Yellow
	reg export HKLM "$backupFolder\HKLM_Backup_$timestamp.reg" /y | Out-Null
	reg export HKCU "$backupFolder\HKCU_Backup_$timestamp.reg" /y | Out-Null
	Write-Host
	Write-Host "Registry backup complete" -ForegroundColor Green
	Write-Host
}

else {
	Write-Host "Proceeding without registry backup" -ForegroundColor Magenta
	Write-Host
}

# Tamper protection warning

Write-Host "WARNING: In order to make the necessary changes you have to manually disable tamper protection" `
-ForegroundColor red

Write-Host "Press any key to continue" `
-ForegroundColor red

[void][System.Console]::ReadKey($true)

# Miscellaneous privacy tweaks block
$BLOCKWDSR = @"
///////////////////////////////////////
///WINDOWS DEFENDER SPYNETREPORTING///
/////////////////////////////////////
"@

Write-Host $BLOCKWDSR -ForegroundColor blue

# Registry keys

Write-Host

Write-Host "SpyNetReporting status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" `
-rname "SpyNetReporting" -rvalue 0

# End of script

Write-Host "Done..." -ForegroundColor Green
Write-Host "You can exit now" -ForegroundColor Green
