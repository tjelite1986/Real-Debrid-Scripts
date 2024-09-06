#!/bin/bash

ITEMPATH="/mnt/zurg/movies"
TARGET=/mnt/symlinks/import
CACHE=/mnt/symlinks/.symlink_cache

# Get ready to create symlinks
mkdir -p /mnt/symlinks/.symlink_cache

# Get the last bit of the source path
DIR=$(awk -F'/' '{ a = length($NF) ? $NF : $(NF-1); print a }' <<< $ITEMPATH)
echo "Symlinking new items in $ITEMPATH to $TARGET/${DIR}... "

mkdir -p "$TARGET/${DIR}"
mkdir -p "$CACHE/${DIR}"

ls "${ITEMPATH}/" | while read -r ITEM
do
# symlink to target only if cache doesn't already exist
# so that if a user moves a file out of the TARGET folder while importing, we don't recreate it
ln -s "${ITEMPATH}/${ITEM}" "$CACHE/${DIR}/" 2> /dev/null
if [[ $? -eq 0 ]]; then
cp -rs "${ITEMPATH}/${ITEM}" "$TARGET/${DIR}/" 2> /dev/null
fi
done

echo "Done! ??"
