#!/bin/sh
set -e

TITLE="Building initrd to $INITRD_PATH"
echo $TITLE

SRC=$ZIGROOT
DST=$SRC/sources/rootfs
mkdir -p $DST

# Clear
rm -rf $DST

# Initialize
cp -r $SRC/initrd/rootfs $DST
cd $DST

# Make directories
mkdir -p usr/bin sys tmp bin root proc

# Copy in busybox
cp $SRC/sources/busybox/busybox bin/

# Package
find . | cpio -o -H newc | gzip -9 > $INITRD_PATH

echo "DONE: $TITLE"
