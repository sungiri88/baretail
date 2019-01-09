$ErrorActionPreference = 'Stop'
$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$packageName = 'baretail'
$version = '3.50'
$PROD_HOME = "C:\BareTail"
$filename = "baretail.exe"
$machine = $false
$pathType = 'User'
 
$common = $(Join-Path $script_path "common.ps1")
. $common
 
$packageParameters = $env:chocolateyPackageParameters
 
 
Uninstall-Path -pathToUnInstall $PROD_HOME -pathType $pathType
 
if (Test-Path "$PROD_HOME") {
  Write-Host "Removing $PROD_HOME..."
  remove-item -Recurse -Force "$PROD_HOME"
}
 
if (Test-Path "$env:USERPROFILE\Desktop\baretail.exe.lnk") {
  Write-Host "Removing $env:USERPROFILE\Desktop\baretail.exe.lnk..."
  remove-item "$env:USERPROFILE\Desktop\baretail.exe.lnk"
}