
# Image Cleaner Script

This macOS script automatically deletes image files from user folders (e.g., Documents, Desktop, Downloads, and Pictures) every time the system restarts. It identifies image files based on MIME type, so it works even if file extensions have been altered.

Users can run the script manually or set it to execute automatically on startup using a LaunchDaemon or via MDM Server such as JAMF.

## Features
- Deletes image files from user folders, even if the file extension is changed.
- Compatible with MDM for deployment in managed environments.
- Can be run as a standalone script or with a LaunchDaemon to execute at every restart.

## Installation

- To run the script manually
    1- Download the Script and save the clean_images.sh script 
    
    2- Make the Script Executable by using command below

    ```bash
  sudo chmod +x /path/to/clean_images.sh
    ```
    3- Execute script
     ```bash
  /bin/bash /path/to/clean_images.sh
    ```


- To run the script manually with LaunchDaemon

    1- Download the Script and save the ImageCleaner.sh script 
    
    2- Make the Script Executable by using command below

    ```bash
  sudo chmod +x /path/to/ImageCleaner.sh
    ```
    3- Execute script
     ```bash
  /bin/bash /path/to/ImageCleaner.sh
    ```
    4- The script will run automatically at every restart and clean image files regardless of their extensions.


- To run via JAMF

    1- Download ImageCleaner.sh and upload it to your JAMF server.

    2- Create a new policy and apply it to the target devices.

    3- The script will run automatically at every restart and clean image files regardless of their extensions.

  


## Authors

Author: Emre Uydu - System Engineer


- [@euydu](https://www.github.com/euydu)
- emreuydu@gmail.com


