
$ErrorActionPreference = 'Stop';

$packageName= 'P4Merge'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://filehost.perforce.com/perforce/r19.2/bin.ntx86/p4vinst.exe'
$url64bit   = 'https://filehost.perforce.com/perforce/r19.2/bin.ntx64/p4vinst64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64bit

  softwareName  = 'Helix Core*'

  checksum      = '58ed8433499fa4efc5613a27ce0d5d4649f973dbeeaaebcdd4b36937464c5cbc'
  checksum64    = '0e064f1ef1f308c9af7b0f96db192119e331b7ab5c5c4a091ff9f7d091129fd1'
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
