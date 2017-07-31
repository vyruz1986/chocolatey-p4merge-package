
$ErrorActionPreference = 'Stop';

$packageName= 'P4Merge'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://filehost.perforce.com/perforce/r17.2/bin.ntx86/p4vinst.exe'
$url64bit   = 'http://filehost.perforce.com/perforce/r17.2/bin.ntx64/p4vinst64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64bit

  softwareName  = 'Helix Visual*'

  checksum      = '35824f08304c3821b4ff1f727974054a04597a50142c0182db2df623ded21366'
  checksum64    = 'fd47f14110a6d4a093a63def4089fb101f9bdc8fafc34c2356d44cda6edc9211'
  checksumType  = 'SHA256'
  checksumType64= 'SHA256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/s /V"/qn ADDLOCAL=P4MERGE,QT,QT32"'
}

$forceX86 = $env:chocolateyForceX86;
if (-not $forceX86) {
  if (Get-OSArchitectureWidth 64) {
    $packageArgs.silentArgs = '/s /V"/qn ADDLOCAL=P4MERGE,QT,QT64"'
  }
}

Install-ChocolateyPackage @packageArgs
