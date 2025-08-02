# Telemetry remover and privacy optimizer script
# PowerShell 7 compatible / Must be run as administrator
# Author: IEMV
# Version 00.05.00 - 2025-08-01

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
   - Win 10 Telemetry policies -
   - Preview build program -
   - Microsoft Office Telemetry -
   - Unnecessary/privacy invasive processes -
   - Microsoft compatibility appraiser -
   - Feedback notifications -
   - Windows Customer Experience Improvement Program -
   - Bing search and Cortana Consent - 
   - Location tracking - 
   - Advertising ID and tailored experiences -
   - Cortana -
   - Typing collection - 
   - Background apps - 
   - App install restrictions -
   - Activity history - 
   - Tips, sugestions and ads -
   - Parental control -
"@

Write-Host $INTRO -ForegroundColor green

Write-Host
Write-Host

# Registry backup
# Time stamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
# Backup directory
$backupFolder = "C:\Backups"

# User prompt
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
	Write-Host
}

else {
	Write-Host "Proceeding without backup" -ForegroundColor Magenta
	Write-Host
	Write-Host
}


# Data collection block
$BLOCKDATACOL = @"
////////////////////////////////////
///DATA COLLECTION AND TELEMETRY///
//////////////////////////////////
"@

Write-Host $BLOCKDATACOL -ForegroundColor blue

Write-Host "Windows -> DataCollection -> AllowTelemtry status:" -ForegroundColor blue

Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" `
-rname "AllowTelemetry" -rvalue 0

Write-Host

Write-Host "CurrentVersion -> Policies -> MaxTelemetryAllowed status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
-rname "MaxTelemetryAllowed" -rvalue 0

Write-Host

Write-Host "CurrentVersion -> Policies -> AllowTelemetry status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
-rname "AllowTelemetry" -rvalue 0

Write-Host

Write-Host "Wow6432Node... -> Policies -> MaxTelemetryAllowed status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
-rname "MaxTelemetryAllowed" -rvalue 0

Write-Host

Write-Host "Wow6432Node... -> Policies -> AllowTelemetry status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
-rname "AllowTelemetry" -rvalue 0

Write-Host
Write-Host
Write-Host

# Preview build block
$BLOCKPREVBUILD = @"
////////////////////
///PREVIEW BUILD///
//////////////////
"@
Write-Host $BLOCKPREVBUILD -ForegroundColor blue

Write-Host "Opt out of preview build program" -ForegroundColor blue

Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" `
-rname "AllowBuildPreview" -rvalue 0

Write-Host
Write-Host
Write-Host

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

Write-Host "OfficeTelemetryAgentFallBack status:" -ForegroundColor blue
Task-Disabling -tskname "OfficeTelemetryAgentFallBack" -tskpath "\Microsoft\Office\"

Write-Host

Write-Host "OfficeTelemetryAgentLogOn status:" -ForegroundColor blue
Task-Disabling -tskname "OfficeTelemetryAgentLogOn" -tskpath "\Microsoft\Office\"

Write-Host
Write-Host
Write-Host

# Services block
$BLOCKSERVICES = @"
/////////////////////////////////////////////////
///TELEMETRY RELATED SERVICES, TASKS AND KEYS///
///////////////////////////////////////////////
"@
Write-Host $BLOCKSERVICES -ForegroundColor blue

# Function starts
# Get service status / stop / disable startup
function Nuke-Serv {
	param (
		[Parameter(Mandatory)]
        [string]$ServName
	)
	
	$targserv = Get-Service -Name $ServName -ErrorAction SilentlyContinue
	
	if ($null -eq $targserv) {
		Write-Host "Service '$ServName' not found" -ForegroundColor Magenta
		Write-Host
		return
	}
	
	$startype = (Get-CimInstance -ClassName Win32_Service -Filter "Name='$ServName'").StartMode
	
	Write-Host "-----------------------------------------------------" -ForegroundColor Yellow
	Write-Host "Service: $($targserv.DisplayName) [$ServName]" -ForegroundColor Yellow
	Write-Host "Status: $($targserv.status)" -ForegroundColor Yellow
	Write-Host "Startup: $startype" -ForegroundColor Yellow
	
	# Prompt to nuke service if not already disabled
	if ($startype.ToLower() -ne 'disabled') {
		$nukeresponse = Read-Host "Would you like to stop and disable the startup of '$ServName'? (Y/N)"
		if ($nukeresponse -match "^[Yy]$") {
			Write-Host "Stopping '$ServName'" -ForegroundColor Green
			Stop-Service -Name "$ServName" -Force
			Write-Host "Disabling '$ServName' startup" -ForegroundColor Green
			Set-Service -Name "$ServName" -StartupType Disabled
			Write-Host
		}
	
		else {
			Write-Host "No changes were made" -ForegroundColor Magenta
			Write-Host
		}
		
	}

	else {
		Write-Host "Service: $($targserv.DisplayName) [$ServName] already disabled" -ForegroundColor Green
	}
}
# Function ends

# Check updated status Function
function Get-ServStat {
	param (
		[Parameter(Mandatory)]
        [string]$ServName
	)
	
	$targserv = Get-Service -Name $ServName -ErrorAction SilentlyContinue
	
	if ($null -eq $targserv) {
		Write-Host "Service '$ServName' not found" -ForegroundColor Magenta
		Write-Host
		return
	}
	
	$startype = (Get-CimInstance -ClassName Win32_Service -Filter "Name='$ServName'").StartMode
	
	Write-Host "Service: $($targserv.DisplayName) [$ServName]" -ForegroundColor Yellow
	Write-Host "Status: $($targserv.status)" -ForegroundColor Yellow
	Write-Host "Startup: $startype" -ForegroundColor Yellow
	Write-Host "-----------------------------------------------------" -ForegroundColor Yellow
}
# Function ends

# List of services to stop and disable
Nuke-Serv -ServName "DiagTrack"
Nuke-Serv -ServName "WerSvc"
Nuke-Serv -ServName "RetailDemo"
Nuke-Serv -ServName "wisvc"
Nuke-Serv -ServName "MapsBroker"
Nuke-Serv -ServName "diagnosticshub.standardcollector.service"
Nuke-Serv -ServName "WMPNetworkSvc"
Nuke-Serv -ServName "dmwappushservice"


# Updated status report
Write-Host
Write-Host
Write-Host "Updated services status:" -ForegroundColor Blue

Get-ServStat -ServName "DiagTrack"
Get-ServStat -ServName "WerSvc"
Get-ServStat -ServName "RetailDemo"
Get-ServStat -ServName "wisvc"
Get-ServStat -ServName "MapsBroker"
Get-ServStat -ServName "diagnosticshub.standardcollector.service"
Get-ServStat -ServName "WMPNetworkSvc"
Get-ServStat -ServName "dmwappushservice"

# DeliveryOptimization
Write-Host
Write-Host

Write-Host "Delivery Optimization service (DoSvc) download mode status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" `
-rname "DODownloadMode" -rvalue 0

Write-Host

Write-Host "AITEnable status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" `
-rname "AITEnable" -rvalue 0

Write-Host

Write-Host "DisableUAR status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" `
-rname "DisableUAR" -rvalue 1

Write-Host

Write-Host "AutoLogger-Diagtrack-Listener Start status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" `
-rname "Start" -rvalue 0

Write-Host

Write-Host "SQMLogger Start status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" `
-rname "Start" -rvalue 0

Write-Host "Dmwappushservice Start status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SYSTEM\CurrentControlSet\Services\dmwappushservice" `
-rname "Start" -rvalue 4

Write-Host

Write-Host "AllowLinguisticDataCollection status:" -ForegroundColor Blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" `
-rname "AllowLinguisticDataCollection" -rvalue 0

Write-Host

Write-Host "GatherNetworkInfo status:" -ForegroundColor blue
Task-Disabling -tskname "GatherNetworkInfo" -tskpath "\Microsoft\Windows\NetTrace\"

Write-Host

Write-Host "Sqm-Tasks status:" -ForegroundColor blue
Task-Disabling -tskname "Sqm-Tasks" -tskpath "\Microsoft\Windows\PI\"

Write-Host

Write-Host "QueueReporting status:" -ForegroundColor blue
Task-Disabling -tskname "QueueReporting" -tskpath "\Microsoft\Windows\Windows Error Reporting\"

Write-Host

Write-Host "Proxy status:" -ForegroundColor blue
Task-Disabling -tskname "Proxy" -tskpath "\Microsoft\Windows\Autochk\"

Write-Host

Write-Host "BthSQM status:" -ForegroundColor blue
Task-Disabling -tskname "BthSQM" -tskpath "\Microsoft\Windows\Bluetooth\"

Write-Host
Write-Host
Write-Host

# Microsoft application experience block
$BLOCKMICROAE = @"
////////////////////////////////////////
///MICROSOFT APPLICATION EXPERIENCE ///
//////////////////////////////////////
"@

Write-Host $BLOCKMICROAE -ForegroundColor blue

Write-Host "Microsoft Compatibility Appraiser task status:" -ForegroundColor blue
Task-Disabling -tskname "Microsoft Compatibility Appraiser" -tskpath "\Microsoft\Windows\Application Experience\"

Write-Host

Write-Host "Program data updater task status:" -ForegroundColor blue
Task-Disabling -tskname "ProgramDataUpdater" -tskpath "\Microsoft\Windows\Application Experience\"

Write-Host

Write-Host "StartupAppTask status:" -ForegroundColor blue
Task-Disabling -tskname "StartupAppTask" -tskpath "\Microsoft\Windows\Application Experience\"

Write-Host
Write-Host
Write-Host

# Feedback notifications block
$BLOCKFN = @"
//////////////////////////////
///FEEDBACK NOTIFICATIONS ///
////////////////////////////
"@

Write-Host $BLOCKFN -ForegroundColor blue

Write-Host "System initiated user feedback programed prompts" -ForegroundColor blue

Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" `
-rname "NumberOfSIUFInPeriod" -rvalue 0

Write-Host

Write-Host "System initiated user feedback programed period (in days)" -ForegroundColor blue

Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" `
-rname "PeriodInDays" -rvalue 0

Write-Host

Write-Host "DoNotShowFeedbackNotifications status:" -ForegroundColor blue

Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" `
-rname "DoNotShowFeedbackNotifications" -rvalue 1

Write-Host

Write-Host "Notification Task status:" -ForegroundColor blue
Task-Disabling -tskname "Notification Task" -tskpath "\Microsoft\Windows\Feedback\Siuf\"

Write-Host

Write-Host "DmClient status:" -ForegroundColor blue
Task-Disabling -tskname "DmClient" -tskpath "\Microsoft\Windows\Feedback\Siuf\"

Write-Host

Write-Host "DmClientOnScenarioDownload status:" -ForegroundColor blue
Task-Disabling -tskname "DmClientOnScenarioDownload" -tskpath "\Microsoft\Windows\Feedback\Siuf\"

Write-Host
Write-Host
Write-Host

# Windows customer experience improvement program CEIP block
$BLOCKCEIP = @"
//////////////////////////////////////////////////////////////
///WINDOWS CUSTOMER EXPERIENCE IMPROVEMENT PROGRAM (CEIP) ///
////////////////////////////////////////////////////////////
"@

Write-Host $BLOCKCEIP -ForegroundColor blue

Write-Host "Enable CEIP status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" `
-rname "CEIPEnable" -rvalue 0

Write-Host

# CEIP related scheduled tasks
Write-Host "Consolidator task" -ForegroundColor blue
Task-Disabling -tskname "Consolidator" -tskpath "\Microsoft\Windows\Customer Experience Improvement Program\"

Write-Host

Write-Host "USB customer improvement program task" -ForegroundColor blue
Task-Disabling -tskname "UsbCeip" -tskpath "\Microsoft\Windows\Customer Experience Improvement Program\"

Write-Host

Write-Host "Kernel CEIP" -ForegroundColor blue #Proabbly obsolete
Task-Disabling -tskname "KernelCeipTask" -tskpath "\Microsoft\Windows\Customer Experience Improvement Program\"

Write-Host

Write-Host "Uploader" -ForegroundColor blue #Proabbly obsolete
Task-Disabling -tskname "Uploader" -tskpath "\Microsoft\Windows\Customer Experience Improvement Program\"

Write-Host

Write-Host "Office CEIP status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" `
-rname "DisableTelemetry" -rvalue 1

Write-Host
Write-Host
Write-Host

# Windows Bing search and Cortana Consent block
$BLOCKBSCC = @"
///////////////////////////////////////
///BING SEARCH AND CORTANA CONSENT ///
/////////////////////////////////////
"@

Write-Host $BLOCKBSCC -ForegroundColor blue

Write-Host "BingSearchEnabled status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" `
-rname "BingSearchEnabled" -rvalue 0

Write-Host

Write-Host "CortanaConsent status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" `
-rname "CortanaConsent" -rvalue 0


Write-Host
Write-Host
Write-Host

# Location tracking block
$BLOCKLT = @"
////////////////////////
///LOCATION TRACKING///
///////////////////////
"@

Write-Host $BLOCKLT -ForegroundColor blue

Write-Host "Location service status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" `
-rname "Status" -rvalue 0

Write-Host

Write-Host "ConsentStore -> Location -> Value status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" `
-rname "Value" -rvalue "Deny" -rtype ([Microsoft.Win32.RegistryValueKind]::String)

Write-Host

Write-Host "SensorPermissionState status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" `
-rname "SensorPermissionState" -rvalue 0

Write-Host

Write-Host "DisableLocation status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" `
-rname "DisableLocation" -rvalue 1

Write-Host "DisableLocationScripting status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" `
-rname "DisableLocationScripting" -rvalue 1

Write-Host
Write-Host
Write-Host

# Advertising ID and tailored experiences block
$BLOCKADIDTE = @"
///////////////////////////////////////
///ADVERTISING INFO & TAILORED EXP ///
/////////////////////////////////////
"@

Write-Host $BLOCKADIDTE -ForegroundColor blue

Write-Host "Advertising ID enabled status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" `
-rname "Enabled" -rvalue 0

Write-Host

Write-Host "TailoredExperiencesWithDiagnosticDataEnabled status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" `
-rname "TailoredExperiencesWithDiagnosticDataEnabled" -rvalue 0

Write-Host
Write-Host
Write-Host

# Cortana block
$BLOCKCORTANA = @"
///////////////
///CORTANA ///
/////////////
"@

Write-Host $BLOCKCORTANA -ForegroundColor blue

# CORTANA BLOCK




# Typing collection block
$BLOCKTC = @"
/////////////////////////
///TYPING COLLECTION ///
///////////////////////
"@

Write-Host $BLOCKCTC -ForegroundColor blue

Write-Host "HKLM RestrictImplicitTextCollection:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization" `
-rname "RestrictImplicitTextCollection" -rvalue 1

Write-Host

Write-Host "HKCU RestrictImplicitTextCollection:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\InputPersonalization" `
-rname "RestrictImplicitTextCollection" -rvalue 1

Write-Host

Write-Host "HKLM RestrictImplicitInkCollection:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization" `
-rname "RestrictImplicitInkCollection" -rvalue 1

Write-Host

Write-Host "HKCU RestrictImplicitInkCollection:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\InputPersonalization" `
-rname "RestrictImplicitInkCollection" -rvalue 1

Write-Host

Write-Host "HarvestContacts:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" `
-rname "HarvestContacts" -rvalue 0

Write-Host
Write-Host
Write-Host

# Background apps block
$BLOCKBA = @"
///////////////////////
///BACKGROUND APPS ///
/////////////////////
"@

Write-Host $BLOCKBA -ForegroundColor blue

Write-Host "GlobalUserDisabled:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" `
-rname "GlobalUserDisabled" -rvalue 1

Write-Host
Write-Host
Write-Host

# App install restrictions block
$BLOCKAIR = @"
////////////////////////////////
///APP INSTALL RESTRICTIONS ///
//////////////////////////////
"@

Write-Host $BLOCKAIR -ForegroundColor blue

Write-Host "DisallowAppInstall:" -ForegroundColor blue
Edit-RegxDW -rpath "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" `
-rname "DisallowAppInstall" -rvalue 0

Write-Host
Write-Host
Write-Host

# Activity history block
$BLOCKAH = @"
////////////////////////
///ACTIVITY HISTORY ///
//////////////////////
"@

Write-Host $BLOCKAH -ForegroundColor blue

Write-Host "PublishUserActivities status:" -ForegroundColor blue

Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
-rname "PublishUserActivities" -rvalue 0

Write-Host

Write-Host "UploadUserActivities status:" -ForegroundColor blue
Edit-RegxDW -rpath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
-rname "UploadUserActivities" -rvalue 0

Write-Host
Write-Host
Write-Host

# Windows search block
$BLOCKWS = @"
////////////////////////////////
///WINDOWS SEARCH (INDEXING)///
//////////////////////////////
"@

Write-Host $BLOCKWS -ForegroundColor blue

# List of services to stop and disable
Nuke-Serv -ServName "WSearch"

# Updated status report
Write-Host
Write-Host
Write-Host "Updated services status:" -ForegroundColor Blue

Get-ServStat -ServName "WSearch"

Write-Host
Write-Host
Write-Host

# Tips, sugestions and ads block
$BLOCKTSA = @"
////////////////////////////////
///TIPS, SUGESTIONS AND ADS////
//////////////////////////////
"@

Write-Host $BLOCKTSA -ForegroundColor blue

Write-Host "SubscribedContent-338389Enabled staus:" -ForegroundColor blue

Edit-RegxDW -rpath "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
-rname "SubscribedContent-338389Enabled" -rvalue 0

Write-Host

Write-Host "SystemPaneSuggestionsEnabled staus:" -ForegroundColor blue

Edit-RegxDW -rpath "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
-rname "SystemPaneSuggestionsEnabled" -rvalue 0

Write-Host
Write-Host
Write-Host

# Parental control block
$BLOCKPC = @"
///////////////////////
///PARENTAL CONTROL///
/////////////////////
"@

Write-Host $BLOCKPC -ForegroundColor blue

Write-Host "FamilySafetyUpload status:" -ForegroundColor blue
Task-Disabling -tskname "FamilySafetyUpload" -tskpath "\Microsoft\Windows\Shell\"

Write-Host

Write-Host "FamilySafetyMonitor status:" -ForegroundColor blue
Task-Disabling -tskname "FamilySafetyMonitor" -tskpath "\Microsoft\Windows\Shell\"

Write-Host

Write-Host "FamilySafetyRefreshTask status:" -ForegroundColor blue
Task-Disabling -tskname "FamilySafetyRefreshTask" -tskpath "\Microsoft\Windows\Shell\"

Write-Host
Write-Host
Write-Host

# Miscellaneous privacy tweaks block
$BLOCKMISC = @"
////////////////////////////////////////////////
///MISCELLANEOUS PRIVACY / DEBLOATING TWEAKS///
//////////////////////////////////////////////
"@

Write-Host $BLOCKMISC -ForegroundColor blue

Write-Host "HttpAcceptLanguageOptOut staus:" -ForegroundColor blue

Edit-RegxDW -rpath "HKCU:\Control Panel\International\User Profile" `
-rname "HttpAcceptLanguageOptOut" -rvalue 1

Write-Host "SilentInstalledAppsEnabled staus:" -ForegroundColor blue

Edit-RegxDW -rpath "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
-rname "SilentInstalledAppsEnabled" -rvalue 0

Write-Host

Write-Host "MapsToastTask status:" -ForegroundColor blue
Task-Disabling -tskname "MapsToastTask" -tskpath "\Microsoft\Windows\Maps\"

Write-Host

Write-Host "MapsUpdateTask status:" -ForegroundColor blue
Task-Disabling -tskname "MapsUpdateTask" -tskpath "\Microsoft\Windows\Maps\"

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