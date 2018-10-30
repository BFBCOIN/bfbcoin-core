
Debian
====================
This directory contains files used to package bfbd/bfb-qt
for Debian-based Linux systems. If you compile bfbd/bfb-qt yourself, there are some useful files here.

## bfb: URI support ##


bfb-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bfb-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bfb-qt binary to `/usr/bin`
and the `../../share/pixmaps/bfb128.png` to `/usr/share/pixmaps`

bfb-qt.protocol (KDE)

