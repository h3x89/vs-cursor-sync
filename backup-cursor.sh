#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Paths
CURSOR_CONFIG="$HOME/Library/Application Support/Cursor/User/settings.json"
REPO_CONFIG="./cursor-settings.json"

echo -e "${YELLOW}Starting Cursor configuration backup...${NC}"

# Check if Cursor config exists
if [ ! -f "$CURSOR_CONFIG" ]; then
    echo -e "${RED}Error: Cursor configuration not found at $CURSOR_CONFIG${NC}"
    exit 1
fi

# Create backup
echo -e "${GREEN}Creating backup...${NC}"
cp "$CURSOR_CONFIG" "$REPO_CONFIG"

# Export extensions list
echo -e "${GREEN}Exporting extensions list...${NC}"
./list-cursor-extensions.sh

echo -e "${GREEN}Backup completed successfully!${NC}" 