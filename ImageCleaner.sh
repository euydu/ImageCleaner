#!/bin/bash
# Created by Emre Uydu - System Engineer
# emreuydu@gmail.com
# Contact to me for more info
##########################################
#Create Script under /Library
ScriptFile='#!/bin/bash
TARGET_DIRECTORIES=(
    "$HOME/Documents"
    "$HOME/Desktop"
    "$HOME/Downloads"
    "$HOME/Pictures"
)

for DIR in "${TARGET_DIRECTORIES[@]}"; do

    find "$DIR" -type f | while read -r FILE; do

        MIME_TYPE=$(file --mime-type -b "$FILE")
        if [[ $MIME_TYPE == image/* ]]; then
            echo "Deleting image file: $FILE"
            rm "$FILE"
        fi
    done
done'
sudo tee /Library/Scripts/clean_images.sh  << EOF
    $(echo "$ScriptFile")
EOF
sudo chmod +x /Library/Scripts/clean_images.sh
#Create Plist file to run script automatically
launchDaemon='<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.euydu.cleanimages</string>
        <key>ProgramArguments</key>
        <array>
            <string>/bin/bash</string>
            <string>/Library/Scripts/clean_images.sh</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
    </dict>
</plist>'
tee /Library/LaunchDaemons/com.euydu.cleanimages.plist  << EOF
    $(echo "$launchDaemon")
EOF
sudo chown root:wheel /Library/LaunchDaemons/com.euydu.cleanimages.plist
sudo chmod 644 /Library/LaunchDaemons/com.euydu.cleanimages.plist
sudo launchctl bootstrap system /Library/LaunchDaemons/com.euydu.cleanimages.plist