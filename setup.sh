#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting setup of editor configurations...${NC}\n"

# Create necessary directories if they don't exist
echo -e "${GREEN}Creating necessary directories...${NC}"
mkdir -p ~/Library/Application\ Support/Code/User/
mkdir -p ~/Library/Application\ Support/Cursor/User/

# Backup existing configurations if they exist
echo -e "${GREEN}Backing up existing configurations if they exist...${NC}"
if [ -f ~/Library/Application\ Support/Code/User/settings.json ]; then
    mv ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json.backup
    echo -e "${YELLOW}VSCode settings backup created at: ~/Library/Application Support/Code/User/settings.json.backup${NC}"
fi

if [ -f ~/Library/Application\ Support/Cursor/User/settings.json ]; then
    mv ~/Library/Application\ Support/Cursor/User/settings.json ~/Library/Application\ Support/Cursor/User/settings.json.backup
    echo -e "${YELLOW}Cursor settings backup created at: ~/Library/Application Support/Cursor/User/settings.json.backup${NC}"
fi

# Create hard links
echo -e "${GREEN}Creating hard links...${NC}"
ln ./vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln ./cursor-settings.json ~/Library/Application\ Support/Cursor/User/settings.json

echo -e "\n${GREEN}Setup completed successfully!${NC}"
echo -e "${YELLOW}Note: If you had existing configurations, they were backed up with .backup extension${NC}" 