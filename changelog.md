# Win10Optim Changelog

## Win10Optim 00.07.00-Beta - 2025-08-06

### Added:
#### Option to disable the following services:
WbioSrvc

#### Option to disable the following registry keys:
HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Value
HKCU:\software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Value
HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Value
HKCU:\software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Value
HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation\Value

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