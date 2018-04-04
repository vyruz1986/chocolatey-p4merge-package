
$ErrorActionPreference = 'Stop';

$packageName= 'P4Merge'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://filehost.perforce.com/perforce/r18.1/bin.ntx86/p4vinst.exe'
$url64bit   = 'http://filehost.perforce.com/perforce/r18.1/bin.ntx64/p4vinst64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64bit

  softwareName  = 'Helix Core*'

  checksum      = '6696A5A9690B33875E84139F25E912E29CE5C5E87CE1D7A0C1D9841A3326CD6B'
  checksum64    = 'EEA0E8BE023EBEE5AC0DF69A1285F7ED0F19AF98AEFB08C808FC484674FCE1C2'
  checksumType  = 'SHA256'
  checksumType64= 'SHA256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/s /V"/qn ADDLOCAL=P4MERGE,QT,QT32"'
}

$forceX86 = $env:chocolateyForceX86;
if (-not $forceX86) {
  if (Get-OSArchitectureWidth 64) {
    $packageArgs.silentArgs = '/s /V"/qn ADDLOCAL=P4MERGE,QT"'
  }
}

Install-ChocolateyPackage @packageArgs
