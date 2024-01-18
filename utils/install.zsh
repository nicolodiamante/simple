#!/bin/zsh

#
# Install Simple.
#

# Ensures the script is run with zsh.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Define the .zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

# Update .zshrc with Simple.
if [[ -f "$ZSHRC" ]]; then
  echo "Starting the installation process of Simple..."

  # Ask the user if they want to create a backup.
  read -q "REPLY?Found an existing .zshrc in ${ZSHRC}. Do you want to create a backup? [y/N] "
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Count the number of existing 'simple' backups.
    backup_count=$(ls ${ZSHRC}_simple_backup*.bak 2>/dev/null | wc -l | tr -d ' ')
    BACKUP="${ZSHRC}_simple_backup${backup_count}.bak"

    echo "Simple: Backing up zshrc as ${BACKUP}..."
    if cp "${ZSHRC}" "${BACKUP}"; then
      echo "Simple: Backup successful."
    else
      echo "Simple: Failed to backup .zshrc. Aborting operation." >&2
      exit 1
    fi
  fi

  # Updates .zshrc with Simple configurations.
  echo "Simple: Updating .zshrc..."
  SIMPLE_PATH_LINE="fpath=($HOME/simple/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz simple"
  if ! grep -Fxq "${SIMPLE_PATH_LINE}" "${ZSHRC}" && ! grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    echo "" >> "${ZSHRC}"
    echo "# Simple PATH." >> "${ZSHRC}"
    echo "fpath=($HOME/simple/script $fpath)" >> "${ZSHRC}"
    echo "autoload -Uz simple" >> "${ZSHRC}"
    echo "Simple: Appended PATH to ${ZSHRC}"
  else
    echo "Simple: PATH is already present in ${ZSHRC}"
  fi
else
  # Creates a new .zshrc file if it doesn't exist.
  echo "Simple: .zshrc not found. Creating a new one..."
  if ! touch "${ZSHRC}"; then
    echo "Simple: Failed to create a new .zshrc." >&2
    exit 1
  fi
  echo "Simple: Adding PATH to a new .zshrc..."
  echo "" >> "${ZSHRC}"
  echo "# Simple PATH." >> "${ZSHRC}"
  echo "fpath=($HOME/simple/script $fpath)" >> "${ZSHRC}"
  echo "autoload -Uz simple" >> "${ZSHRC}"
  echo "Simple: PATH was added to a new .zshrc."
fi

# Attempts to reload .zshrc to apply changes.
if ! source "${ZSHRC}" &>/dev/null; then
  echo "Please source .zshrc manually to apply changes." >&2
fi

echo "Simple: Installation complete."
