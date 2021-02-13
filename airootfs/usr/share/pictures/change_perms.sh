#Convert from root to user permissions on files and folders
echo "Please type in location of files "
read fileLoc
# sudo find $fileLoc -type f -exec chmod 644 {} \;
sudo find $fileLoc -type f -print0 | xargs -0 chmod 0644
echo "Please type in location of directory " 
read dirLoc
# sudo find $dirLoc -type d -exec chmod 755 {} \;
sudo find $dirLoc -type d -print0 | xargs -0 chmod 0755
