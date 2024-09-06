#!/bin/bash

ITEMPATH="/mnt/zurg/movies"
TARGET=/mnt/symlinks/blackhole/radarr
CACHE=/mnt/symlinks/blackhole/.symlink_cache

echo "Symlinking new items in $ITEMPATH to $TARGET... "
mkdir -p $TARGET
mkdir -p $CACHE

ls "${ITEMPATH}/" | while read -r ITEM
do
# symlink to target only if cache doesn't already exist
# so that if a user moves a file out of the TARGET folder while importing, we don't recreate it
ln -s "${ITEMPATH}/${ITEM}" "$CACHE/" 2> /dev/null
if [[ $? -eq 0 ]]; then
cp -rs "${ITEMPATH}/${ITEM}" "$TARGET/" 2> /dev/null
echo "[created symlink] $TARGET/${ITEM}"
else
echo "[already exists, skipped] $CACHE/${DIR}${ITEM}"
fi
done

echo "Done!"
