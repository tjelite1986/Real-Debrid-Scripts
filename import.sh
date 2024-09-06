#!/bin/bash

# Function to handle symlinking
symlink_items() {
    local ITEMPATH="$1"
    local TARGET="$2"
    local CACHE="$3"

    # Create necessary directories
    mkdir -p "$CACHE"

    # Get the last part of the source path
    DIR=$(awk -F'/' '{ a = length($NF) ? $NF : $(NF-1); print a }' <<< "$ITEMPATH")
    echo "Symlinking new items in $ITEMPATH to $TARGET/${DIR}... "

    mkdir -p "$TARGET/${DIR}"
    mkdir -p "$CACHE/${DIR}"

    ls "${ITEMPATH}/" | while read -r ITEM; do
        # Symlink to cache only if it doesn't already exist
        ln -s "${ITEMPATH}/${ITEM}" "$CACHE/${DIR}/" 2> /dev/null
        if [[ $? -eq 0 ]]; then
            cp -rs "${ITEMPATH}/${ITEM}" "$TARGET/${DIR}/" 2> /dev/null
        fi
    done

    echo "Done! ??"
}

# Define paths for movies
MOVIE_PATH="/mnt/zurg/movies"
MOVIE_TARGET="/mnt/symlinks/import"
MOVIE_CACHE="/mnt/symlinks/.symlink_cache"

# Define paths for shows
SHOW_PATH="/mnt/zurg/shows"
SHOW_TARGET="/mnt/symlinks/import"
SHOW_CACHE="/mnt/symlinks/.symlink_cache"

# Call the function for movies and shows
symlink_items "$MOVIE_PATH" "$MOVIE_TARGET" "$MOVIE_CACHE"
symlink_items "$SHOW_PATH" "$SHOW_TARGET" "$SHOW_CACHE"
```

### Key Features of the Merged Script:
# 1. **Function-Based**: The script uses a function `symlink_items` to eliminate redundancy and improve maintainability.
# 2. **Parameterization**: The function accepts paths for both movies and shows, allowing for a clear and organized setup.
# 3. **Directory Management**: It ensures that all necessary directories are created before attempting to symlink files.
# 4. **Universal Target and Cache**: Both movies and shows use the same target path and cache path structure while still maintaining separate management within the function.
