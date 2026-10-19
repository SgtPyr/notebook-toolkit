#!/data/data/com.termux/files/usr/bin/bash

set -e

INSTALL_DIR="$HOME/notebook-toolkit"
BIN_DIR="$HOME/bin"
LAUNCHER="$BIN_DIR/notebook-toolkit"

printf '\n'
printf '%s\n' '========================================'
printf '%s\n' '      NOTEBOOK TOOLKIT INSTALLER'
printf '%s\n' '========================================'
printf '\n'

# Check the toolkit launcher exists
if [ ! -f "$INSTALL_DIR/toolkit.sh" ]; then
    printf '%s\n' 'ERROR: toolkit.sh was not found.'
    printf '%s\n' 'Expected location: ~/notebook-toolkit/toolkit.sh'
    exit 1
fi

# Check required projects exist
for project in \
    "$HOME/rust-work/rust-story-vault" \
    "$HOME/go-work/notebook-sync-server" \
    "$HOME/java-work/java-notebook-studio"
do
    if [ ! -d "$project" ]; then
        printf '\nERROR: Required project not found:\n%s\n' "$project"
        printf '%s\n' 'Install the missing project before continuing.'
        exit 1
    fi
done

# Create the command directory if needed
mkdir -p "$BIN_DIR"

# Make the main launcher executable
chmod +x "$INSTALL_DIR/toolkit.sh"

# Create the global command
cat > "$LAUNCHER" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
exec "$HOME/notebook-toolkit/toolkit.sh"
EOF

chmod +x "$LAUNCHER"

printf '\n'
printf '%s\n' 'Installation completed successfully.'
printf '%s\n' 'Run this command to open the toolkit:'
printf '\n'
printf '%s\n' '    notebook-toolkit'
printf '\n'
