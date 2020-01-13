
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

  checksum      = '5a8169d4bd6788e3d334fd18b5944098617d9bbf1bcc563b8b1bd7c69e603dcc'
  checksum64    = 'ed85968d9088dc21f59cb45e7b37f47f178f93e35b559484c8c9820c272b87e2'
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
