#!/bin/bash

# Parameters
sysrescuearch='x86_64'

# Make sure the docker image exists
dockerimg="sysrescuebuildpkg-${sysrescuearch}:latest"
if ! docker inspect ${dockerimg} >/dev/null 2>/dev/null ; then
    echo "ERROR: You must build the following docker image before you run this script: ${dockerimg}"
    exit 1
fi

# Determine the path to the git repository
fullpath="$(realpath $0)"
curdir="$(dirname ${fullpath})"
repodir="$(realpath ${curdir}/..)"
echo "curdir=${curdir}"
echo "repodir=${repodir}"

# Create a tmpfs for storing packages cache in memory
pkgcache="/tmp/pkgcache"
echo "pkgcache=${pkgcache}"
mkdir -p ${pkgcache}
if ! findmnt ${pkgcache} >/dev/null; then
    echo "Mounting ${pkgcache} as a tmpfs"
    sudo mount -t tmpfs tmpfs -o size=2G ${pkgcache}
fi

# Run a shell in the container from which to build packages 
docker run --rm --user 1000:1000 -it \
    --volume=${repodir}:/workspace \
    --volume=${pkgcache}:/var/cache/pacman/pkg \
    ${dockerimg} setarch ${sysrescuearch} /bin/bash
