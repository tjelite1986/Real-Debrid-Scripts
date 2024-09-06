#!/bin/bash

# Function to display menu
display_menu() {

  echo -e "\e[1;34mChoose where to create symlinks:\e[0m"  # Bold Blue
  echo -e "\e[1;32m1. Create Symlinks Blackhole Radar\e[0m"  # Bold Green
  echo -e "\e[1;32m2. Create Symlinks Blackhole Sonarr\e[0m"
  echo -e "\e[1;32m3. Create Symlinks Blackhole All\e[0m"
  echo -e "\e[1;32m4. Create Symlinks Import Movies\e[0m"
  echo -e "\e[1;32m5. Create Symlinks Import Shows\e[0m"
  echo -e "\e[1;32m6. Create Symlinks Import All\e[0m"
  echo -e "\e[1;31m7. Check for broken Symlinks\e[0m"  # Bold Red
  echo -e "\e[1;31m8. Remove broken Symlinks\e[0m"
  echo -e "\e[1;33m9. Exit from menu\e[0m"  # Bold Yellow
  echo -n "Enter your menu choice [1-9]: "
}

# Running a forever loop using while statement
while :; do
  display_menu  # Call the display menu function
  
  # Reading choice
  read choice

  # Case statement to execute based on user choice
  case $choice in
    1)  ./blackhole-radarr.sh
        echo -e "\e[1;32mSymlinks for Blackhole Radar are done.\e[0m";;
    2)  ./blackhole-sonarr.sh
        echo -e "\e[1;32mSymlinks for Blackhole Sonarr are done.\e[0m";;
    3)  ./blackhole.sh
        echo -e "\e[1;32mSymlinks for Blackhole All are done.\e[0m";;
    4)  ./import-movies.sh
        echo -e "\e[1;32mSymlinks for importing movies are done.\e[0m";;
    5)  ./import-shows.sh
        echo -e "\e[1;32mSymlinks for importing shows are done.\e[0m";;
    6)  ./import.sh
        echo -e "\e[1;32mSymlinks for importing all are done.\e[0m";;
    7)  ./broken.sh
        echo -e "\e[1;31mCheck for broken symlinks done.\e[0m";;
    8)  ./remove.sh
        echo -e "\e[1;31mRemove broken symlinks done.\e[0m";;
    9)  echo -e "\e[1;33mQuitting...\e[0m"
        exit;;
    *)  echo -e "\e[1;31minvalid option. Please try again.\e[0m";;
  esac
done
