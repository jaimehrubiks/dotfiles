#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "$HOME/.zshrc_local" ]]; then
  source "$HOME/.zshrc_local"
fi

# Customize to your needs...
alias lh="ls -lah"
mkcd() { mkdir -p "$@" && cd "$@"; }

