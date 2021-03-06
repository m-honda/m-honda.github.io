#!/usr/bin/env bash

set -eu

TMPDIR=$(mktemp -d /tmp/io.github.m-honda.raspbian.stretch.setup.XXXXXXX)
REPO=http://m-honda.github.io/raspbian/
DIST=stretch
DEB=mechatrax-archive-keyring_2016.12.19.1_all.deb
SHA256=2a7039dc91e0c6f768ccc3fc1b1cdfd9af04cf9eb45b77a065e457cec8570e83

pushd $TMPDIR
echo "$SHA256 $DEB" > sha256.txt
wget http://m-honda.github.io/raspbian/pool/main/m/mechatrax-archive-keyring/$DEB
sha256sum -c sha256.txt
dpkg -i $DEB
popd
rm -rf $TMPDIR

cat << EOF > /etc/apt/sources.list.d/mechatrax.list
deb $REPO $DIST main contrib non-free
deb $REPO ${DIST}-backports main contrib non-free
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
#deb-src $REPO $DIST main contrib non-free
#deb-src $REPO ${DIST}-backports main contrib non-free
EOF

apt update
