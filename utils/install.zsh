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
  echo "\nStarting the installation process of Simple..."

  # Ask the user if they want to create a backup.
  read -q "REPLY?Found an existing .zshrc in ${ZSHRC}. Do you want to create a backup? [y/N] "
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Backup existing file
    ZSHRC_BACKUP="${ZSHRC}_$(date "+%Y%m%d%H%M%S").bak"
    echo "Creating backup of .zshrc as ${ZSHRC_BACKUP}..."

    if cp "${ZSHRC}" "${ZSHRC_BACKUP}"; then
      echo "Simple: Backup successful."
    else
      echo "\nSimple: Failed to backup .zshrc. Aborting operation." >&2
      exit 1
    fi
  else
    # If the response is not 'yes', proceed without creating a backup.
    echo "\nSimple: Proceeding without creating a backup."
  fi

  # Updates .zshrc with Simple configurations.
  echo "Simple: Updating .zshrc..."
  SIMPLE_PATH_LINE="fpath=($HOME/simple/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz simple"
  if ! grep -Fxq "${SIMPLE_PATH_LINE}" "${ZSHRC}" && ! grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    echo "" >> "${ZSHRC}"
    echo "# Simple PATH." >> "${ZSHRC}"
    echo "${SIMPLE_PATH_LINE}" >> "${ZSHRC}"
    echo "${AUTOLOAD_LINE}" >> "${ZSHRC}"
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
  echo "${SIMPLE_PATH_LINE}" >> "${ZSHRC}"
  echo "${AUTOLOAD_LINE}" >> "${ZSHRC}"
  echo "Simple: PATH was added to a new .zshrc."
fi

# Attempts to reload .zshrc to apply changes.
if ! source "${ZSHRC}" &>/dev/null; then
  echo "Simple: Failed to reload .zshrc. Please reload manually to apply changes." >&2
fi

# Prints a success message.
echo "\nSimple: Install complete."
