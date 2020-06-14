
$ErrorActionPreference = 'Stop';

$packageName= 'P4Merge'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://filehost.perforce.com/perforce/r20.1/bin.ntx86/p4vinst.exe'
$url64bit   = 'https://filehost.perforce.com/perforce/r20.1/bin.ntx64/p4vinst64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64bit

  softwareName  = 'Helix Core*'

  checksum      = '5b7ce5100cbdd7cfb5732d28d39beec9ca9f9e4a72fa52b3c5f26cc683cfac4e'
  checksum64    = 'b537cd98ec0fd885193fad40756597bd2cda86455b96414756c259d056dc6a6a'
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
