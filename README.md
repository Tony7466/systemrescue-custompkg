# Custom packages for SystemRescue

## Project website
Homepage: https://www.system-rescue.org/

## Overview
This git repository contains the sources of the custom packages which are used
in SystemRescue. Most packages used in SystemRescue are the exact copies of the
binary packages provided by Arch Linux. A few packages used in SystemRescue have
to be built from sources for various reasons. Most of such packages have to be
built from source as they do not exist in the binary package repositories. These
packages typically come from [Arch Linux AUR](https://aur.archlinux.org/).
Sometimes packages have to be rebuilt from sources in order to apply a change.
For example a patch may have to be applied, to fix a bug, or we may want to
remove some optional features in order to reduce the dependencies pulled by the
package in order to reduce the size of the system. There are also times when we
use custom packages in order to use a different version from the version
currently provided by upstream, for example when we want some file system tools
to be inline with the version of the long-term supported kernel.

## Usage
* The commands to build custom packages are part of Arch Linux. You can either
  run these commands on a native Arch Linux or you can run them on Arch Linux
  in a docker container. So the first step is to prepare an Arch Linux build
  environment in one form or another.
* Go to the directory which contains the PKGBUILD file for a particular package,
  and then run the following command: `makepkg`. This command will download the
  program source code, and it will build the package.

## Building custom packages with docker
You can run the build process in docker containers, either because you are not
running Arch Linux, or because you want to keep your main system clean. You need
to have a Linux system running with docker installed and configured, and you must
have a lot of free disk space. You can use the scripts provided in the `docker`
folder of this repository.

You must export the environment variable named `sysrescuearch` before you
run the two helper scripts. It should be set as either `x86_64` or `i686`
depending on the target architecture for which you want to build packages.

After this, you need to run the script which builds a new docker image, and
then the script which runs a docker container based on this new docker image.

For example you can get a 64bit build environment in docker using these commands:
```
export sysrescuearch="x86_64"
./docker/build-docker-image.sh
./docker/build-custom-packages.sh
```
