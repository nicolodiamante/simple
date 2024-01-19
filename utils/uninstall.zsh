#!/bin/zsh

#
# Uninstall Simple.
#

echo "\nStarting the uninstallation process of Simple..."

# Define the .zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"
ZSHRC_BACKUP_GLOB="${ZSHRC}_*.bak"

# Function to remove Simple configurations.
remove_simple_config() {
  echo "\nChecking for Simple configuration in .zshrc..."

  SIMPLE_PATH_LINE="fpath=($HOME/simple/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz simple"

  if grep -Fxq "${SIMPLE_PATH_LINE}" "${ZSHRC}" || grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    read -q "REPLY?Simple configurations found in .zshrc. Do you want to remove them? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' '/# Simple PATH./d' "${ZSHRC}"
        sed -i '' "/fpath=($HOME\/simple\/script $fpath)/d" "${ZSHRC}"
        sed -i '' '/autoload -Uz simple/d' "${ZSHRC}"
      else
        sed -i '/# Simple PATH./d' "${ZSHRC}"
        sed -i "/fpath=($HOME\/simple\/script $fpath)/d" "${ZSHRC}"
        sed -i '/autoload -Uz simple/d' "${ZSHRC}"
      fi
      echo "Simple: Configurations have been removed from .zshrc."
    else
      echo "Simple: No changes made to .zshrc."
    fi
  else
    echo "Simple: No configurations found in .zshrc."
  fi
}

# Check for .zshrc and back it up before making changes.
if [[ -f "$ZSHRC" ]]; then
  # Look for the most recent backup.
  backups=($(ls -t $ZSHRC_BACKUP_GLOB 2>/dev/null))
  if [[ ${#backups[@]} -gt 0 ]]; then
    latest_backup="${backups[0]}"
    echo "Simple: Latest backup found at ${latest_backup}."
    read -q "REPLY?Do you want to restore from the latest backup? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      # Restore the latest backup.
      if cp "${latest_backup}" "${ZSHRC}"; then
        echo "Simple: Restored .zshrc from the latest backup."
        exit 0
      else
        echo "Simple: Failed to restore .zshrc from the latest backup." >&2
        exit 1
      fi
    else
      remove_simple_config
    fi
  else
    remove_simple_config
  fi
else
  echo "\nSimple: .zshrc not found. No cleanup needed."
fi

echo "\nSimple: Uninstall complete."
