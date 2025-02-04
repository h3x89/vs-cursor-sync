#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Paths
CURSOR_CONFIG="$HOME/Library/Application Support/Cursor/User/settings.json"
CURSOR_CONFIG_ALT="$HOME/.cursor/settings.json"
REPO_CONFIG="./cursor-settings.json"

echo -e "${YELLOW}Starting Cursor configuration backup...${NC}"

# Check primary config location
if [ -f "$CURSOR_CONFIG" ]; then
    echo -e "${GREEN}Found config in primary location${NC}"
    cp "$CURSOR_CONFIG" "$REPO_CONFIG"
# Check alternative config location
elif [ -f "$CURSOR_CONFIG_ALT" ]; then
    echo -e "${GREEN}Found config in alternative location${NC}"
    cp "$CURSOR_CONFIG_ALT" "$REPO_CONFIG"
else
    echo -e "${RED}Error: Cursor configuration not found in any location${NC}"
    exit 1
fi

# Create backup
echo -e "${GREEN}Creating backup...${NC}"
cp "$CURSOR_CONFIG" "$REPO_CONFIG"

# Export extensions list
echo -e "${GREEN}Exporting extensions list...${NC}"
./list-cursor-extensions.sh

echo -e "${GREEN}Backup completed successfully!${NC}" 