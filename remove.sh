#!/bin/bash

# Directories to check
plex_movies="/mnt/plex/movies"
plex_shows="/mnt/plex/shows"
cache_path="/mnt/symlinks/blackhole/.symlink_cache"

# Report file
report_file="/mnt/symlinks/delete_broken_symlinks.txt"

# Clear the report file if it exists
> "$report_file"

# Function to delete broken symlinks
delete_broken_symlinks() {
    directory=$1
    echo "Checking for broken symlinks in: $directory"
    
    # Find broken symlinks
    broken_links=$(find "$directory" -type l ! -exec test -e {} \; -print)

    if [ -z "$broken_links" ]; then
        echo "No broken symlinks found in $directory."
    else
        echo "Broken symlinks found in $directory:"
        echo "$broken_links"

        # Log broken symlinks to report file
        echo "Broken symlinks in $directory:" >> "$report_file"
        echo "$broken_links" >> "$report_file"
        echo "" >> "$report_file"
        
        # Delete the broken symlinks
        read -p "Do you want to delete these broken symlinks? (y/n): " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            echo "$broken_links" | xargs rm -f
            echo "Broken symlinks deleted in $directory."
            echo "Deleted broken symlinks from $directory" >> "$report_file"
        else
            echo "Deletion canceled for $directory."
        fi
    fi
}

# Check and delete in each directory
delete_broken_symlinks "$plex_movies"
delete_broken_symlinks "$plex_shows"
delete_broken_symlinks "$cache_path"

# Optionally, check the Realdebrid mounting path
realdebrid_movies="/mnt/zurg/movies"
realdebrid_shows="/mnt/zurg/shows"

delete_broken_symlinks "$realdebrid_movies"
delete_broken_symlinks "$realdebrid_shows"

echo "Script execution completed. Report saved at $report_file."

### Key Changes
# 1. **Report File Creation:** A variable `report_file` is defined to specify the path where the report will be saved (`/mnt/symlinks/broken_symlinks_report.txt`).
# 2. **Clearing Existing Report:** The script clears the report file at the start to ensure it's fresh each time it's run.
# 3. **Logging Deleted Symlinks:** After deleting broken symlinks, the script logs their paths into the report file for reference.

### Usage
# - Save this script as a `.sh` file (e.g., `delete_broken_symlinks.sh`).
# - Make it executable: `chmod +x delete_broken_symlinks.sh`.
# - Run it: `./delete_broken_symlinks.sh`.

#The report will be created in `/mnt/symlinks`, and you can check it anytime after execution to review the deleted symlinks. Let me know if you need any more changes!
