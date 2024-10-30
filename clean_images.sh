#!/bin/bash
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
done
