#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# VSCode paths
VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
REPO_SETTINGS="./vscode-settings.json"

echo -e "${YELLOW}Starting VSCode configuration backup...${NC}\n"

# Backup settings
if [ -f "$VSCODE_SETTINGS" ]; then
    echo -e "${GREEN}Backing up VSCode settings...${NC}"
    cp "$VSCODE_SETTINGS" "$REPO_SETTINGS"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Settings backed up successfully${NC}"
    else
        echo -e "${RED}Failed to backup settings${NC}"
        exit 1
    fi
else
    echo -e "${RED}VSCode settings file not found at: $VSCODE_SETTINGS${NC}"
    exit 1
fi

# Export extensions list
echo -e "${GREEN}Exporting VSCode extensions list...${NC}"
code --list-extensions > vscode-extensions.txt
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Extensions list exported successfully${NC}"
else
    echo -e "${RED}Failed to export extensions list${NC}"
    exit 1
fi

echo -e "\n${GREEN}Backup completed successfully!${NC}" 