#!/bin/zsh

#
# Install Simple
#

# Determines the current user's shell, if not `zsh` then exit.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Defines the PATHs.
SCRIPT_DIR="$(dirname "$0")"
SCRIPT="${SCRIPT_DIR}/script"
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME}/zsh}/.zshrc"

# Check for SCRIPT directory.
if [[ ! -d "$SCRIPT" ]]; then
  echo 'zsh: Simple script directory not found!'
  exit 1
fi

# Check for ZSHRC file.
if [[ ! -f "$ZSHRC" ]]; then
  echo 'zsh: zshrc not found!'
  exit 1
fi

# Avoid duplicate lines in zshrc.
# Check if Simple's lines are already present in .zshrc
if ! grep -q "# simple" "$ZSHRC"; then
  # Append the necessary lines to zshrc.
  cat << EOF >> ${ZSHRC}
# simple
fpath=(${SCRIPT} \$fpath)
autoload -Uz simple
EOF
  echo "zsh: appended Simple's necessary lines to .zshrc"
else
  echo "zsh: Simple's configuration already present in .zshrc"
fi

# Advise user to reload shell or open a new terminal session.
echo "Please reload your zsh shell or open a new terminal session to apply changes."
