$packageName = 'baretail'
$installerType = 'exe'
$version = '3.50'
$FROM_LOCATION = Split-Path $MyInvocation.MyCommand.Definition 
$filename = 'baretail.exe'
$silentArgs = '/SILENT'
$PROD_HOME = "C:\BareTail"
$machine = $false
$url = ''
$pathType = 'User'

if ($FROM_LOCATION.Contains('/')) { $url = "$FROM_LOCATION/$filename" }
else { $url = "$FROM_LOCATION\$filename" }

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" 

Copy-Item $url -Destination $PROD_HOME
 
#Setting path variable instead of using shims. Generate .ignore files for unwanted .exe files
$files = get-childitem "$PROD_HOME" -include *.exe -recurse
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

 
Install-ChocolateyPath -pathToInstall $PROD_HOME -pathType $pathType
 
Install-ChocolateyDesktopLink -targetFilePath "$PROD_HOME\baretail.exe"