#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BFBD=${BFBD:-$SRCDIR/bfbd}
BFBCLI=${BFBCLI:-$SRCDIR/bfb-cli}
BFBTX=${BFBTX:-$SRCDIR/bfb-tx}
BFBQT=${BFBQT:-$SRCDIR/qt/bfb-qt}

[ ! -x $BFBD ] && echo "$BFBD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BFBVER=($($BFBCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bfbd if --version-string is not set,
# but has different outcomes for bfb-qt and bfb-cli.
echo "[COPYRIGHT]" > footer.h2m
$BFBD --version | sed -n '1!p' >> footer.h2m

for cmd in $BFBD $BFBCLI $BFBTX $BFBQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BFBVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BFBVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
