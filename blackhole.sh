#!/bin/bash

# Function to handle symlinking
symlink_items() {
    local ITEMPATH="$1"
    local TARGET="$2"
    local CACHE="$3"

    echo "Symlinking new items in $ITEMPATH to $TARGET... "
    mkdir -p "$TARGET"
    mkdir -p "$CACHE"

    ls "${ITEMPATH}/" | while read -r ITEM; do
        # Symlink to target only if cache doesn't already exist
        # so that if a user moves a file out of the TARGET folder while importing, we don't recreate it
        ln -s "${ITEMPATH}/${ITEM}" "$CACHE/" 2> /dev/null
        if [[ $? -eq 0 ]]; then
            cp -rs "${ITEMPATH}/${ITEM}" "$TARGET/" 2> /dev/null
            echo "[created symlink] $TARGET/${ITEM}"
        else
            echo "[already exists, skipped] $CACHE/${ITEM}"
        fi
    done

    echo "Done!"
}

# Define paths for movies and shows
MOVIE_PATH="/mnt/zurg/movies"
MOVIE_TARGET="/mnt/symlinks/blackhole/radarr"
MOVIE_CACHE="/mnt/symlinks/blackhole/.symlink_cache/movies"

SHOW_PATH="/mnt/zurg/shows"
SHOW_TARGET="/mnt/symlinks/blackhole/sonarr"
SHOW_CACHE="/mnt/symlinks/blackhole/.symlink_cache/shows"

# Call the function for movies and shows
symlink_items "$MOVIE_PATH" "$MOVIE_TARGET" "$MOVIE_CACHE"
symlink_items "$SHOW_PATH" "$SHOW_TARGET" "$SHOW_CACHE"

### Explanation of Changes:
# 1. **Function `symlink_items`**: Encapsulated symlinking logic in a function to avoid duplication and improve clarity.
# 2. **Dynamic Paths**: Used function parameters to handle different paths for movies and shows.
# 3. **Cache Directories**: Created separate cache directories for movies and shows to avoid conflicts and improve organization.
# 4. **Calls to Function**: The script calls the `symlink_items` function for both movies and shows in a clear manner.

# You can run this merged script, and it will handle both your movies and shows symlinking processes. Let me know if you need any further modifications!
