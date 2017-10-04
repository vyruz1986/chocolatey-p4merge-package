
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

  checksum      = '9338c28b411c975106d6ec91cb514efe16f56d93d08ab113677309d62af31236'
  checksum64    = 'f055dfac50c3484529dce8c73e0338e0850b749f71bfb90d5c5ded6bcb64589d'
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
