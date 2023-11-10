#!/bin/zsh

#
# Install Simple.
#

# Determines the current user's shell, if not `zsh` then exit.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Defines the PATHs.
SCRIPT_DIR="$(dirname "$0")"
SCRIPT="${SCRIPT_DIR}/script"

# Defines the PATH for the .zshrc.
ZSHRC="${XDG_CONFIG_HOME:-$HOME}/.zshrc"

# Backup .zshrc before updating.
if [[ -f "$ZSHRC" ]]; then
  BACKUP="${ZSHRC}.bak_$(date +%F-%H%M%S)"
  echo "Backing up .zshrc..."
  if ! cp "${ZSHRC}" "${BACKUP}"; then
    echo "Failed to backup .zshrc." >&2
    exit 1
  else
    echo "Backup of .zshrc saved as ${BACKUP}."
  fi
else
  echo "No .zshrc file found to backup." >&2
  exit 1
fi

# Update .zshrc.
SIMPLE_PATH_LINE="fpath=(${HOME}/simple/script \$fpath)"
AUTOLOAD_LINE="autoload -Uz simple"

# Check for existing Simple configuration in .zshrc
if grep -Fxq "$SIMPLE_PATH_LINE" "$ZSHRC" && grep -Fxq "$AUTOLOAD_LINE" "$ZSHRC"; then
  echo "Simple's lines are already present in .zshrc"
else
  echo "Updating .zshrc for Simple..."
  cat << EOF >> "${ZSHRC}"

# Simple PATH.
fpath=(${HOME}/simple/script \$fpath)
autoload -Uz simple
EOF
  echo "Appended Simple's necessary lines to .zshrc"
fi

# Reminder for the user.
echo "Remember to insert your OPENAI_API_KEY in ~/.zshrc and then either source it or open a new terminal session."
