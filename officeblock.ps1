# Telemetry remover and privacy optimizer script
# PowerShell 7 compatible / Must be run as administrator
# Author: IEMV
# Version 00.11.00 - 2025-09-07

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

#Disable scheduled tasks function
# Function starts
function Task-Disabling {
	param (
		[Parameter(Mandatory)]
		[string]$tskpath,
		
		[Parameter(Mandatory)]
		[string]$tskname
		
	)
	
	try {
		$taskstat = (Get-ScheduledTask -TaskName "$tskname" -TaskPath "$tskpath" -ErrorAction Stop).State
		
		Write-Host "[$tskname] status is: $taskstat" -ForegroundColor Yellow

		if ($taskstat -ne "Disabled") {
			$taskresponse = Read-Host "Would you like to set $tskname status to: Disabled (Y/N)"
			if ($taskresponse -match "^[Yy]$") {
				Get-ScheduledTask -TaskName "$tskname" -TaskPath "$tskpath" | Disable-ScheduledTask
				Write-Host "$tskname was disabled" -ForegroundColor Green
			}
			
			else {
				Write-Host "No changes made to [$tskname]" -ForegroundColor Magenta
			}		
		}
		
		else {
			Write-Host "$tskname already disabled" -ForegroundColor Green
		}
	
	}
	
	catch {
		Write-Host "[$tskname] not found or path does not exist" -ForegroundColor Magenta
	}
	
}
#Function ends


$INTRO = @" 

 __  ______  __    __  __   __  
/\ \/\  ___\/\ "-./  \/\ \ / /  
\ \ \ \  __\\ \ \-./\ \ \ \'/   
 \ \_\ \_____\ \_\ \ \_\ \__|   
  \/_/\/_____/\/_/  \/_/\/_/    

   - Check and disable: -
   - Microsoft Office telemetry -
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
Write-Host "NOTICE: This script will let you alter important system settings like:" -ForegroundColor Yellow
Write-Host "Registry entries, services, scheduled tasks and policies." -ForegroundColor Yellow
Write-Host "It's strongly recommended to create a restore point for your system and a registry backup." -ForegroundColor Yellow
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

# Office block
$BLOCKOFFICE = @"
/////////////////////////////////
///MICROSOFT OFFICE TELEMETRY///
///////////////////////////////
"@
Write-Host $BLOCKOFFICE -ForegroundColor blue

Write-Host "Microsoft Office DisableTelemetry status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" `
-rname "DisableTelemetry" -rvalue 1

Write-Host

Write-Host "HKCU sendcustomerdata status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU\Software\Policies\Microsoft\Office\16.0\Common" `
-rname "sendcustomerdata" -rvalue 0

Write-Host

Write-Host "HKLM sendcustomerdata status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM\Software\Policies\Microsoft\Office\16.0\Common" `
-rname "sendcustomerdata" -rvalue 0

Write-Host

Write-Host "OfficeTelemetryAgentFallBack status:" -ForegroundColor blue
Task-Disabling -tskname "OfficeTelemetryAgentFallBack" -tskpath "\Microsoft\Office\"

Write-Host

Write-Host "OfficeTelemetryAgentLogOn status:" -ForegroundColor blue
Task-Disabling -tskname "OfficeTelemetryAgentLogOn" -tskpath "\Microsoft\Office\"

# End of script

# Restart promt
Write-Host
Write-Host
Write-Host
Write-Host "Done..." -ForegroundColor Green
Write-Host
Write-Host "If you made changes, it's recommended to restart your system" -ForegroundColor yellow

$restartresp = Read-Host "Would you like to restart now? (Y/N)"
if ($restartresp -match "^[Yy]$") {
	Write-Host
	Write-Host "Please save changes made to any file and close running applications before continuing..." -ForegroundColor yellow
	Write-Host
	Write-Host "Press any key to restart your system now" -ForegroundColor Black -BackgroundColor Yellow
	$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	Write-Host
	Restart-Computer -Force
}

else {
	Write-Host
	Write-Host "You can exit now" -ForegroundColor Green
}