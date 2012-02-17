#!/bin/bash
HASHES=`git log --oneline $1 | sed 's/^\([0-9a-fA-F]*\) .*/\1/'`

oldhash=""
for hash in $HASHES ; do
  if [ -z $oldhash ] ; then
    oldhash=$hash
    continue
  fi

  git difftool $oldhash $hash -- $1
done
