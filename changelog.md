# Win10Optim Changelog

## Win10Optim 00.11.00-Beta - 2025-08-20

### Added:

#### Option to disable the following registry keys:
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

#### Option to disable the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics\Value
- HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics\Value
- HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy\LetAppsGetDiagnosticInfo

## Win10Optim 00.09.00-Beta - 2025-08-17

### Added:

- Registry keys and blocks reorganization

#### Option to disable the following registry keys:
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

#### Option to disable the following registry keys:
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

#### Option to disable the following registry keys:
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Value
- HKCU:\software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Value
- HKCU:\software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Value
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation\Value

***

## Win10Optim 00.06.01-Beta - 2025-08-02

### Added:
#### Option to disable the following registry keys:
- HKCU:\Software\Microsoft\Windows\CurrentVersion\AppPrivacy
- HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation

***

## Win10Optim 00.06.01-Beta - 2025-08-02

### Added: 
- Option to create a system restore point
 
#### Option to disable the following services:
- RemoteRegistry
  
#### Option to disable the following registry keys:
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

#### Option to disable the following registry keys:
- HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SilentInstalledAppsEnabled
- HKLM:\SYSTEM\CurrentControlSet\Services\dmwappushservice\start\

#### Option to disable the following services:
- dmwappushservice

### Fixed:
- Style fixes