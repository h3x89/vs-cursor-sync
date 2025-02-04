#!/bin/bash

# Base directories
CACHED_DIR="${HOME}/Library/Application Support/Cursor/CachedExtensionVSIXs"
DOT_CURSOR_DIR="${HOME}/.cursor/extensions"

echo "Listing extensions from multiple locations..."

# Create temporary files
touch cursor-extensions.txt.tmp

# Check CachedExtensionVSIXs directory
if [ -d "${CACHED_DIR}" ]; then
    ls -1 "${CACHED_DIR}" >> cursor-extensions.txt.tmp
fi

# Check .cursor/extensions directory
if [ -d "${DOT_CURSOR_DIR}" ]; then
    ls -1 "${DOT_CURSOR_DIR}" >> cursor-extensions.txt.tmp
fi

# Sort and remove duplicates
sort -u cursor-extensions.txt.tmp > cursor-extensions.txt
rm cursor-extensions.txt.tmp

echo "Cursor extensions list has been saved to cursor-extensions.txt"