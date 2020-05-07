#!/bin/bash
#
# Daily_Archive - Archive designated files & directories
########################################################
#
# Gather Current Date
#
DATE=$(date +%y%m%d)
#
# Set Archive File Name
#
FILE=archive$DATE.tar.gz
#
# Set Configuration and Destination File
#
CONFIG_FILE=/archive/Files_To_Backup
DESTINATION=/archive/$FILE
#
######### Main Script #########################
#
# Check Backup Config file exists
#
if [ -f $CONFIG_FILE ]   # Make sure the config file still exists.
then                # If it exists, do nothing but continue on.
     echo
else                # If it doesn't exist, issue error & exit script.
     echo
     echo "$CONFIG_FILE does not exist.”
“ echo "Backup not completed due to missing Configuration File"
     echo
     exit
fi
#
# Build the names of all the files to backup
#
FILE_NO=1               # Start on Line 1 of Config File.
exec < $CONFIG_FILE     # Redirect Std Input to name of Config File
#
read FILE_NAME          # Read 1st record
#
while [ $? -eq 0 ]      # Create list of files to backup.
do
        # Make sure the file or directory exists.
     if [ -f $FILE_NAME -o -d $FILE_NAME ]
     then
          # If file exists, add its name to the list.
          FILE_LIST="$FILE_LIST $FILE_NAME"
     else
          # If file doesn't exist, issue warning
          echo
          echo "$FILE_NAME, does not exist."
          echo "Obviously, I will not include it in this archive."
          echo "It is listed on line $FILE_NO of the config file."
          echo "Continuing to build archive list..."
          echo
     fi
#
     FILE_NO=$[$FILE_NO + 1]  # Increase Line/File number by one.
     read FILE_NAME           # Read next record.
done
#
#######################################
#
# Backup the files and Compress Archive
#
echo "Starting archive..."
echo
#
tar -czf $DESTINATION $FILE_LIST 2> /dev/null
#
echo "Archive completed"
echo "Resulting archive file is: $DESTINATION"
echo
“        echo "$FILE_NAME, does not exist."
          echo "Obviously, I will not include it in this archive."
          echo "It is listed on line $FILE_NO of the config file."
          echo "Continuing to build archive list..."
          echo
     fi
#
     FILE_NO=$[$FILE_NO + 1]  # Increase Line/File number by one.
     read FILE_NAME           # Read next record.
done
#
#######################################
#
# Backup the files and Compress Archive
#
echo "Starting archive..."
echo
#
tar -czf $DESTINATION $FILE_LIST 2> /dev/null
#
echo "Archive completed"
echo "Resulting archive file is: $DESTINATION"
echo
#
exit

