#!/bin/bash
TEMP=$(mktemp)
alpineVersion="v3.6"
# Arches
cat <<EOF > $TEMP
armhf
amd64
i386
arm64
aarch64
x86_64
x86
EOF
# Loop to build
while read arch; do
docker build . --build-arg TAG=$arch-$alpineVersion -t $arch-alpine-abuild
done < $TEMP
