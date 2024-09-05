# Real-Debrid-Scripts
This is my Script I use to make symlinks from zurg mount to my blackhole folder. 

How to add the script so you can do a command in the terminal.
Ubuntu Server 
add a bin folder to ~/
``` 
mkdir ~/bin
```
Move the script you want to use. I use the 2 blackhole scripts.
``` 
mv symlinks-to-blackhole-radarr.sh ~/bin/br
mv symlinks-to-blackhole-sonarr.sh ~/bin/bs
```
do this command to both files to
```
sudo chmod u+x ~/bin/br
sudo chmod u+x ~/bin/bs
```
Add this line at the bottom of this file.
```
nano .bash_profile
```
```
export PATH=$PATH:~/bin
```
Save and exit
logout from terminal and login and now when you use the scripts from terminal.

Create symlinks to blackhole Radarr
```
br
```
Create symlinks to blackhole Sonarr 
```
bs
```
