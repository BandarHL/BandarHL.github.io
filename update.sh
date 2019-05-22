#!/bin/bash
rm Packages
rm Packages.bz2
rm Packages.xz
rm Release
dpkg-scanpackages -m debfiles /dev/null > Packages
bzip2 -c9 Packages > Packages.bz2
xz -c9 Packages > Packages.xz
PackagesBytes=$(wc -c < Packages)
PackagesbzBytes=$(wc -c < Packages.bz2)
PackagesxzBytes=$(wc -c < Packages.xz)
Packagesmd5=$(md5 Packages| cut -d ' ' -f 1)
Packagesbzmd5=$(md5 Packages.bz2| cut -d ' ' -f 1)
Packagesxzmd5=$(md5 Packages.xz| cut -d ' ' -f 1)
Packagessha256=$(openssl dgst -sha256 Packages| cut -d ' ' -f 2)
Packagesbzsha256=$(openssl dgst -sha256 Packages.bz2| cut -d ' ' -f 2)
Packagesxzsha256=$(openssl dgst -sha256 Packages.xz| cut -d ' ' -f 2)
echo 'Origin: BandarHelal Repo
Label: BandarHelal Repo
Suite: stable
Version: 1.0
Codename: ios
Architectures: iphoneos-arm
Components: main
Description: BandarHelal Main Repo
MD5Sum:
 '$Packagesmd5''$PackagesBytes' Packages
 '$Packagesbzmd5''$PackagesbzBytes' Packages.bz2
 '$Packagesxzmd5''$PackagesxzBytes' Packages.xz
SHA256:
 '$Packagessha256''$PackagesBytes' Packages
 '$Packagesbzsha256''$PackagesbzBytes' Packages.bz2
 '$Packagesxzsha256''$PackagesxzBytes' Packages.xz
' >> Release