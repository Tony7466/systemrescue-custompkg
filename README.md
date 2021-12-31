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
remove some optional features in order to reduce the dependencies pulls by the
package in order to reduce the size of the system. There are also times when we
use custom packages in order to use a different version from the version
currently provided by upstream, for example when we want some file system tools
to be inline with the version of the long-term supported kernel.

## Usage

* You must be running Arch Linux in order to be able to rebuild packages, and
  your system must be up to date in order to avoid conflicts when the custom
  packages are being installed on SystemRescue.
* Go to the directory which contains the PKGBUILD file for a particular package,
  and then run the following command: "makepkg --syncdeps". This command will
  download and install build-time and run-time dependencies, it will then
  download the program source code, and finally it will build the package.
