# Win10Optim Changelog

## Win10Optim 00.25.02-Beta - 2025-10-19

### Added:

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Disabled
- HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\Consent
- HKLM:\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\ShowUI
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\DontSendAdditionalData
- HKLM:SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCloudSearch
- HKLM:SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowSearchToUseLocation
- HKLM:SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableRemovableDriveIndexing
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds\EnableFeeds
- HKLM:\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests\Value
- HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds\ShellFeedsTaskbarViewMode
- HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace\Start
- HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel\Start
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent\DisableThirdPartySuggestions
- HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent\DisableThirdPartySuggestions


## Win10Optim 00.24.01-Beta - 2025-10-05

### Added:

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR\AllowGameDVR
- HKLM\Software\Policies\Microsoft\WindowsInkWorkspace\AllowSuggestedAppsInWindowsInkWorkspace
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat\DisableInventory
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableIndexing
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableWebSearch

## Win10Optim 00.23.01-Beta - 2025-09-28

### Added:

#### Option to disable the following scheduled tasks:
- HypervisorFlightingTask
- Microsoft Compatibility Appraiser
- AitAgent
- RefreshCache
- LoginCheck
- Registration
- SpeechModelDownloadTask

## Win10Optim 00.22.01-Beta - 2025-09-21

### Added:
- Branching off a Windows Defender Spynet block to modify specifically:

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\Consent\DefaultConsent
- HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\Consent\NewUserDefaultConsent
- HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet\SpyNetReporting
- HKLM:\Software\Policies\Microsoft\Windows Defender\Spynet\SubmitSamplesConsent

## Win10Optim 00.21.01-Beta - 2025-09-20

### Added:

- Windows Error Reporting block

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Policies\Microsoft\MRT\DontReportInfectionInformation
- HKLM:\SOFTWARE\Microsoft\Speech_OneCore\Preferences\ModelDownloadAllowed
- HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore\AutoDownload
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate\AutoDownload
- HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\Disabled

## Win10Optim 00.20.01-Beta - 2025-09-19

### Added:

#### Option to modify the following registry keys:
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\FeatureManagementEnabled
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\OemPreInstalledAppsEnabled

#### Option to modify the following registry keys:

## Win10Optim 00.19.01-Beta - 2025-09-17

### Added:

#### Option to modify the following registry keys:
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\pptsolution
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\olksolution
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\wdsolution
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\xlsolution
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\agave
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\appaddins
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\comaddins
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\documentfiles
- HKCU:\Software\Microsoft\Office\16.0\OSM\preventedapplications\templatefiles
- HKCU:\System\GameConfigStore\GameDVR_Enabled

## Win10Optim 00.18.01-Beta - 2025-09-16

### Added:

- Reintegrated Microsoft Office section to the main script

#### Option to modify the following registry keys:
- HKCU:\Software\Policies\Microsoft\Office\16.0\OSM\EnableLogging
- HKCU:\Software\Policies\Microsoft\Office\16.0\OSM\EnableUpload
- HKCU:\Software\Microsoft\Office\16.0\Common\ClientTelemetry\DisableTelemetry
- HKCU:\Software\Microsoft\Office\16.0\Common\ClientTelemetry\VerboseLogging
- HKCU:\Software\Microsoft\Office\16.0\Common\Feedback\enabled
- HKCU:\Software\Microsoft\Office\16.0\Common\Feedback\includescreenshot
- HKCU:\Software\Microsoft\Office\16.0\Outlook\Options\Mail\EnableLogging
- HKCU:\Software\Microsoft\Office\16.0\Word\Options\EnableLogging
- HKCU:\Software\Microsoft\Office\16.0\Common\ptwatson\ptwoptin

## Win10Optim 00.17.01-Beta - 2025-09-07

### Added:

- Branched off the Microsoft Office telemetry section to a separate script

#### Option to modify the following registry keys:
- HKLM:\Software\Policies\Microsoft\Office\16.0\Common\sendcustomerdata

## Win10Optim 00.16.00-Beta - 2025-09-01

### Added:

#### Option to modify the following registry keys:
- HKCU:\Software\Policies\Microsoft\Office\16.0\Common\sendcustomerdata

## Win10Optim 00.15.00-Beta - 2025-08-31

### Added:

#### Option to modify the following registry keys:
- HKLM:\SYSTEM\CurrentControlSet\Services\DiagTrack\Start

## Win10Optim 00.14.00-Beta - 2025-08-27

### Added:

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\SQMClient\Windows\CEIPEnable

## Win10Optim 00.13.00-Beta - 2025-08-25

### Added:
- Admin privileges check

## Win10Optim 00.12.00-Beta - 2025-08-24

### Added:

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\ConnectedSearchUseWeb
- HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser\HaveUploadedForTarget
- HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\AIT\AITEnable
  
## Win10Optim 00.11.00-Beta - 2025-08-20

### Added:

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics\Value
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy\LetAppsGetDiagnosticInfo

## Win10Optim 00.09.00-Beta - 2025-08-17

### Added:

- Registry keys and blocks reorganization

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput\AllowLinguisticDataCollection
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\DisableDiagnosticDataViewer
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\System\EnableActivityFeed
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\DisableWindowsLocationProvider
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios\Value
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy\LetAppsRunInBackground
- HKCU:\Software\Microsoft\Input\TIPC\Enabled

## Win10Optim 00.08.00-Beta - 2025-08-13

### Added:

- Settings > Privacy block

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo\Enabled
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo\DisabledByGroupPolicy
- HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Start_TrackProgs
- HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy\HasAccepted
- HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization\AllowInputPersonalization
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\LimitDiagnosticLogCollection
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowDeviceNameInDiagnosticData

### Removed:

- Advertising ID and tailored experiences block (settings integrated in different blocks)
- Typing collection block (settings integrated in Settings > Privacy block)
- Data collection adn telemetry block (settings integrated in Settings > Privacy block)

***

## Win10Optim 00.07.00-Beta - 2025-08-06

### Added:
#### Option to disable the following services:
- WbioSrvc

#### Option to modify the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Value
- HKCU:\software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Value
- HKCU:\software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation\Value

***

## Win10Optim 00.06.01-Beta - 2025-08-02

### Added:
#### Option to modify the following registry keys:
- HKCU:\Software\Microsoft\Windows\CurrentVersion\AppPrivacy
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation

***

## Win10Optim 00.06.01-Beta - 2025-08-02

### Added: 
- Option to create a system restore point
 
#### Option to disable the following services:
- RemoteRegistry
  
#### Option to modify the following registry keys:
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\PreInstalledAppsEnabled
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\ContentDeliveryAllowed
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SoftLandingEnabled
- HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowCortanaButton
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSyncProviderNotifications
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent\DisableWindowsConsumerFeatures
- HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy\LetAppsAccessAccountInfo


### Fixed:
- Style fixes

***

## Win10Optim 00.05.00-Beta - 2025-08-01

### Added: 
#### Option to disable the following tasks:
- \Microsoft\Windows\Maps\MapsToastTask
- \Microsoft\Windows\Maps\MapsUpdateTask
- \Microsoft\Windows\Application Experience\AitAgent
- \Microsoft\Windows\Autochk\Proxy
- \Microsoft\Windows\Bluetooth\BthSQM

#### Option to modify the following registry keys:
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SilentInstalledAppsEnabled
- HKLM:\SYSTEM\CurrentControlSet\Services\dmwappushservice\start\

#### Option to disable the following services:
- dmwappushservice

### Fixed:
- Style fixes