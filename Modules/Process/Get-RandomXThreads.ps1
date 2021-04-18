#original bat
#randomx-sniffer.exe -samples 5 -wait 50 -threshold 2

<#
.SYNOPSIS
Get-RandomXThreads.ps1 uses randomx-sniffer to detect cryptojacking malware by scanning threads for non-default rounding modes. Uses modified version of https://github.com/tevador/randomx-sniffer

.NOTES
OUTPUT csv
BINDEP .\Modules\bin\randomx-sniffer.exe

!! THIS SCRIPT ASSUMES RANDOMX-SNIFFER.EXE WILL BE IN $ENV:SYSTEMROOT !!
#>

if (Test-Path "$env:SystemRoot\randomx-sniffer.exe") {
& $env:SystemRoot\randomx-sniffer.exe -samples 5 -wait 50 -threshold 2 | ConvertFrom-Csv | ForEach-Object {
    $_
}
}
else {
    Write-Error "randomx-sniffer.exe not found in $env:SystemRoot."
}