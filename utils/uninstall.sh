#!/bin/zsh

#
# Uninstall Simple.
#

echo "Starting the uninstallation process of Simple..."

# Defines the PATHs.
SCRIPT_DIR="${HOME}/simple/script"
ZSHRC="${XDG_CONFIG_HOME:-$HOME}/.zshrc"
ZSHRC_BACKUP_GLOB="${ZSHRC}.bak_*"

# Check for .zshrc and back it up before making changes.
if [[ -f "$ZSHRC" ]]; then
  echo "Found .zshrc at ${ZSHRC}. Backing up .zshrc..."

  # Check for existing backups and offer to use the latest one.
  existing_backups=( $ZSHRC_BACKUP_GLOB )
  if (( ${#existing_backups[@]} > 0 )); then
    # Sort backups by date, descending.
    sorted_backups=($(echo "${existing_backups[@]}" | tr ' ' '\n' | sort -r))
    latest_backup=${sorted_backups[0]}
    echo "Latest backup found at ${latest_backup}."
    read -q "REPLY?Do you want to restore the latest backup instead of creating a new one? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      # Restore the latest backup.
      if cp "$latest_backup" "$ZSHRC"; then
        echo "Restored .zshrc from the latest backup."
      else
        echo "Failed to restore .zshrc from the latest backup." >&2
        exit 1
      fi
    fi
  fi

  if [[ "$REPLY" =~ ^[Nn]$ ]] || [[ -z "$REPLY" ]]; then
    # If user chooses not to use the latest backup, create a new one.
    BACKUP="${ZSHRC}.bak_$(date +%F-%H%M%S)"
    if cp "$ZSHRC" "${BACKUP}"; then
      echo "Backup saved as ${BACKUP}."
    else
      echo "Failed to backup .zshrc." >&2
      exit 1
    fi
  fi

  # Check if Simple configurations are present before removing them.
  SIMPLE_PATH_LINE="fpath=(${HOME}/simple/script \$fpath)"
  AUTOLOAD_LINE="autoload -Uz simple"

  if grep -Fxq "$SIMPLE_PATH_LINE" "$ZSHRC" || grep -Fxq "$AUTOLOAD_LINE" "$ZSHRC"; then
    read -q "REPLY?Simple configurations found. Do you want to remove them from .zshrc? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' '/# Simple PATH./d' "$ZSHRC"
        sed -i '' "/fpath=\(${SCRIPT_DIR//\//\\/} \$fpath\)/d" "$ZSHRC"
        sed -i '' '/autoload -Uz simple/d' "$ZSHRC"
      else
        sed -i '/# Simple PATH./d' "$ZSHRC"
        sed -i "/fpath=\(${SCRIPT_DIR//\//\\/} \$fpath\)/d" "$ZSHRC"
        sed -i '/autoload -Uz simple/d' "$ZSHRC"
      fi
      echo "Simple configurations have been removed from .zshrc."
    else
      echo "No changes made to .zshrc."
    fi
  else
    echo "No Simple configurations found in .zshrc."
  fi
else
  echo ".zshrc file not found. No cleanup needed."
fi

echo "Uninstallation of Simple is complete."
