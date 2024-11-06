#!/bin/bash

# Base Cursor directory
BASE_DIR="${HOME}/Library/Application Support/Cursor"
EXTENSIONS_DIR="${BASE_DIR}/CachedExtensionVSIXs"

if [ ! -d "${EXTENSIONS_DIR}" ]; then
    echo "Could not find Cursor extensions directory"
    exit 1
fi

# List all directories in the extensions folder
echo "Found extensions in: ${EXTENSIONS_DIR}"
ls -1 "${EXTENSIONS_DIR}" > cursor-extensions.txt

echo "Cursor extensions list has been saved to cursor-extensions.txt"