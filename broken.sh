#!/bin/bash

# Directories to check
plex_movies="/mnt/plex/movies"
plex_shows="/mnt/plex/shows"
cache_path="/mnt/symlinks/blackhole/.symlink_cache"

# Report file path
report_file="/mnt/symlinks/broken_symlinks_report.txt"

# Clear previous report file
echo "Broken Symlinks Report - $(date)" > "$report_file"
echo "====================================" >> "$report_file"
echo >> "$report_file"

# Function to check for broken symlinks
check_symlinks() {
    directory=$1
    echo "Checking for broken symlinks in: $directory"
    
    # Find broken symlinks
    broken_links=$(find "$directory" -type l ! -exec test -e {} \; -print)

    if [ -z "$broken_links" ]; then
        echo "No broken symlinks found in $directory." | tee -a "$report_file"
    else
        echo "Broken symlinks found in $directory:" | tee -a "$report_file"
        echo "$broken_links" | tee -a "$report_file"
    fi
    echo >> "$report_file"
}

# Check each directory
check_symlinks "$plex_movies"
check_symlinks "$plex_shows"
check_symlinks "$cache_path"

# Optionally, check the Realdebrid mounting path.
realdebrid_movies="/mnt/zurg/movies"
realdebrid_shows="/mnt/zurg/shows"

check_symlinks "$realdebrid_movies"
check_symlinks "$realdebrid_shows"

echo "Report saved to: $report_file"

### Key Changes
# 1. **Cache Path:** The previous variables for Radarr and Sonarr caches were removed, and the cache path is now set directly to `/mnt/symlinks/blackhole/.symlink_cache`.
# 2. **Checking Cache Directory:** The `check_symlinks` function is called with the `cache_path`.
