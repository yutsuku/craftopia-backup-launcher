$root = "$($ENV:AppData)\..\LocalLow\PocketPair"
$saveDir = $root + "\Craftopia\PPSave"
$backupDir = $root + "\backup"

$now = (Get-Date).ToString("yyyy-MM-dd_hh-mm-ss")
$backupPath = $backupDir + "\" + $now + ".zip"

If (!(Test-Path -PathType container $backupDir))
{
    Write-Host $backupDir
    New-Item -ItemType Directory -Path $backupDir | Out-Null
}

Compress-Archive -Path "$saveDir" -DestinationPath "$backupPath"
Start-Process "steam://rungameid/1307550"
