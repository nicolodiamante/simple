#!/bin/sh

#
# Install simple
#

# Determines the current user's shell, if `zsh` then installs.
[[ "$(basename -- "$SHELL")" == "zsh" ]] || exit 1

# Defines the PATHs.
SCRIPT="${HOME}/simple/script"
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME/zsh:-$HOME}}/.zshrc"

if [[ -d "$SCRIPT" && -f "$ZSHRC" ]]; then
  # Appends to `zshrc`.
  cat << EOF >> ${ZSHRC}
# simple
fpath=(~/simple/script \$fpath)
autoload -Uz simple
EOF
  echo 'zsh: appended simple to zshrc.'

  # Reloads shell.
  source "${ZSHRC}"
else
  echo 'zsh: zshrc not found!'
fi
