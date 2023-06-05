<#Author       : Heinrich Wewers
# Creation Date: 06-05-2023
# Usage        : Download VDS Legalsuite files
#********************************************************************************
# Date                         Version      Changes
#------------------------------------------------------------------------
# 06/05/2023                    1.0        Intial Version
#
#
#*********************************************************************************
#
#>

######################
#    LGS Variables   #
######################
$LocalAVDpath          = "c:\temp\avd\"
$LGSAppLocation        = "C:\Apps\"
$DesktopPath           = "C:\Users\Public\Desktop\"
$LGS_ShortcutFile      = "LegalSuite.lnk"
$LGS_ShortcutUri       = 'https://vdsavdfiles.blob.core.windows.net/lgsaibfiles/LegalSuite.lnk'
$MappedDrivePath       = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\"
$MappedDriveUri        = 'https://vdsavdfiles.blob.core.windows.net/lgsaibfiles/mapped-drive.txt'
$MappedDriveScript     = "mapped-drive.bat"


####################################
#    Test/Create Temp Directory    #
####################################
if((Test-Path c:\temp) -eq $false) {
    Write-Host "AVD AIB Customization - Download LGS File : Creating temp directory"
    New-Item -Path c:\temp -ItemType Directory
}
else {
    Write-Host "AVD AIB Customization - Download LGS Files : C:\temp already exists"
}
if((Test-Path $LocalAVDpath) -eq $false) {
    Write-Host "AVD AIB Customization - Download LGS Files : Creating directory: $LocalWVDpath"
    New-Item -Path $LocalWVDpath -ItemType Directory
}
else {
    Write-Host "AVD AIB Customization - Download LGS Files: $LocalWVDpath already exists"
}

#################################
#    Download LGS Components    #
#################################
Add-Content -LiteralPath C:\New-WVDSessionHost.log "Downloading LGS Shortcut"
    Invoke-WebRequest -Uri $LGS_ShortcutUri -OutFile "$DesktopPath$LGS_ShortcutFile"

#################################
#    Download LGS Components    #
#################################
Add-Content -LiteralPath C:\New-WVDSessionHost.log "Downloading LGS Shortcut"
Invoke-WebRequest -Uri $LGS_ShortcutUri -OutFile "$LGSAppLocation$LGS_ShortcutFile"

#################################
#    Download LGS Components    #
#################################
Add-Content -LiteralPath C:\New-WVDSessionHost.log "Downloading LGS Shortcut"
Invoke-WebRequest -Uri $MappedDriveUri -OutFile "$MappedDrivePath$MappedDriveScript"

#############
#    END    #
#############