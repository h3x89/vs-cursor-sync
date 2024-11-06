# Editor Configurations

This repository contains configuration files for my code editors:

- Visual Studio Code
- Cursor

## Repository Structure

- `vscode-settings.json` - Visual Studio Code configuration
- `cursor-settings.json` - Cursor configuration
- `setup.sh` - Installation script for new machines
- `vscode-extensions.txt` - List of installed Visual Studio Code extensions
- `cursor-extensions.txt` - List of installed Cursor extensions

## Original File Locations

- Visual Studio Code: `~/Library/Application Support/Code/User/settings.json`
- Cursor: `~/Library/Application Support/Cursor/User/settings.json`

## Purpose

This repository is used for:

- Storing configuration backups
- Synchronizing settings between different computers
- Tracking configuration changes
- Easy restoration of previous settings versions

## How to Use

### Automatic Setup

1. Clone the repository
2. Make the setup script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Run the setup script:

   ```bash
   ./setup.sh
   ```

### Manual Setup

If you prefer to set up manually:

1. Clone the repository
2. Create hard links to appropriate system locations:

   ```bash
   ln vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
   ln cursor-settings.json ~/Library/Application\ Support/Cursor/User/settings.json
   ```

3. All file changes will be automatically synchronized

### Synchronizing Settings

To synchronize settings between VSCode and Cursor:

1. Make the sync script executable:

   ```bash
   chmod +x sync-settings.sh
   ```

2. Run the sync script:

   ```bash
   ./sync-settings.sh
   ```

The script will:

- Merge settings from both editors
- Create backups of current configurations
- Update both editors with merged settings
- Show what changes were made

Note: VSCode settings take precedence in case of conflicts

## Extensions/Plugins

### Exporting Extension Lists

#### VSCode Extensions Export

To export a list of installed extensions:

```bash
code --list-extensions > vscode-extensions.txt
```

#### Cursor Extensions List

Since Cursor doesn't provide a CLI command, use the provided script:

```bash
chmod +x list-cursor-extensions.sh
./list-cursor-extensions.sh
```

### Installing Extensions

#### VSCode Extensions Install

To install all extensions from the list:

```bash
cat vscode-extensions.txt | xargs -L 1 code --install-extension
```

#### Cursor Extensions Install

To install all extensions from the list:

```bash
cat cursor-extensions.txt | xargs -L 1 cursor --install-extension
```

## Notes

- The setup script will automatically backup any existing configurations
- Backup files will have `.backup` extension
- The script will create necessary directories if they don't exist
