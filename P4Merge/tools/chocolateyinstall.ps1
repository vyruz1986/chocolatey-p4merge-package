
$ErrorActionPreference = 'Stop';

$packageName= 'P4Merge'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://filehost.perforce.com/perforce/r15.2/bin.ntx86/p4vinst.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Helix Visual*'

  checksum      = '53610b5cf921701b439d2c6c4d73480c'
  checksumType  = 'md5'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/s /V"/qn ADDLOCAL=P4MERGE,QT,QT32"'
}

Install-ChocolateyPackage @packageArgs


















