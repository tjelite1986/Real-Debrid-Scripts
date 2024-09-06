#!/bin/bash

# creating a menu with the following options
echo "Choose were to create symlinks";
echo "1. Create Symlinks Blackhole Radar"
echo "2. Create Symlinks Blackhole Sonarr"
echo "3. Create Symlinks Import Movies"
echo "4. Create Symlinks Import Shows"
echo "5. Exit from menu "
echo -n "Enter your menu choice [1-5]: "

# Running a forever loop using while statement
# This loop will run until select the exit option.
# User will be asked to select option again and again
while :
do

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
  # Pattern 1
  1)  ./blackhole-radarr.sh
     echo "You Symlinks are done ";;
  # Pattern 2
  2)  ./blackhole-sonarr.sh
      echo "You Symlinks are done ";;
  # Pattern 3
  3)  ./import-movies.sh
      echo "You Symlinks are done ";;
    # Pattern 4
  4)  ./import-shows.sh
      echo "You Symlinks are done ";;
  # Pattern 5
  5)  echo "Quitting ..."
      exit;;
  # Default Pattern
  *) echo "invalid option";;

esac
  echo "Choose were to create symlinks";
  echo "1. Create Symlinks Blackhole Radar"
  echo "2. Create Symlinks Blackhole Sonarr"
  echo "3. Create Symlinks Import Movies"
  echo "4. Create Symlinks Import Shows"
  echo "5. Exit from menu "
  echo -n "Enter your menu choice [1-5]: "
done
