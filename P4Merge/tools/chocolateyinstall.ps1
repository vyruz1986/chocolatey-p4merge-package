
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

  checksum      = 'f3b088d852bc41d089093966238e2db7f06b393e06d50c5e0d0e101fb0ff6d95'
  checksum64    = 'a69ad0dabeef21f38980c25c65aa7ed661bf2685b4d3dfdcd5c76c334b059eef'
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
