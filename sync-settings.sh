#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting settings synchronization...${NC}\n"

# Temporary file for merged settings
TEMP_FILE="temp_merged_settings.json"

# Function to format JSON
format_json() {
    python3 -c "import json; print(json.dumps(json.load(open('$1')), indent=2))"
}

# Merge settings using Python (handles JSON properly)
python3 - <<EOF
import json

# Read both config files
try:
    with open('vscode-settings.json', 'r') as f:
        vscode_settings = json.load(f)
except FileNotFoundError:
    vscode_settings = {}
except json.JSONDecodeError:
    print("\033[0;31mError: Invalid JSON in vscode-settings.json\033[0m")
    exit(1)

try:
    with open('cursor-settings.json', 'r') as f:
        cursor_settings = json.load(f)
except FileNotFoundError:
    cursor_settings = {}
except json.JSONDecodeError:
    print("\033[0;31mError: Invalid JSON in cursor-settings.json\033[0m")
    exit(1)

# Merge settings (vscode_settings takes precedence)
merged_settings = {**cursor_settings, **vscode_settings}

# Write merged settings to temp file
with open('$TEMP_FILE', 'w') as f:
    json.dump(merged_settings, f, indent=2)
EOF

if [ $? -ne 0 ]; then
    echo -e "${RED}Error occurred during merging. Aborting.${NC}"
    rm -f $TEMP_FILE
    exit 1
fi

# Create backups
echo -e "${GREEN}Creating backups...${NC}"
cp vscode-settings.json vscode-settings.json.backup
cp cursor-settings.json cursor-settings.json.backup

# Update both files with merged settings
echo -e "${GREEN}Updating configuration files...${NC}"
cp $TEMP_FILE vscode-settings.json
cp $TEMP_FILE cursor-settings.json

# Clean up
rm $TEMP_FILE

echo -e "\n${GREEN}Settings synchronized successfully!${NC}"
echo -e "${YELLOW}Backups created with .backup extension${NC}"

# Show what changed
echo -e "\n${YELLOW}Changes made:${NC}"
diff vscode-settings.json.backup vscode-settings.json || true 