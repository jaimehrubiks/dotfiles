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
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

# Edit command line in VIM
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line
fpath=(/usr/local/share/zsh-completions $fpath)

# Enable Vim mode
bindkey -v

# VI MODE KEYBINDINGS (ins mode)
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
#bindkey -M viins '^k'    kill-line
bindkey -M viins '^p'    history-beginning-search-backward
bindkey -M viins '^n'    history-beginning-search-forward
#bindkey -M viins '^p'    up-line-or-history
#bindkey -M viins '^n'    down-line-or-history
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
bindkey -M viins 'jk'    vi-cmd-mode
#bindkey -M viins '^h'    backward-delete-char
#bindkey -M viins '^?'    backward-delete-char
#bindkey -M viins '^_'    undo
#bindkey -M viins '^x^r'  redisplay
#bindkey -M viins '\eOH'  beginning-of-line # Home
#bindkey -M viins '\eOF'  end-of-line       # End
#bindkey -M viins '\e[2~' overwrite-mode    # Insert
#bindkey -M viins '\ef'   forward-word      # Alt-f
#bindkey -M viins '\eb'   backward-word     # Alt-b
#bindkey -M viins '\ed'   kill-word         # Alt-d

# VI MODE KEYBINDINGS (cmd mode)
bindkey -M vicmd '^a'    beginning-of-line
bindkey -M vicmd '^e'    end-of-line
#bindkey -M vicmd '^k'    kill-line
bindkey -M vicmd '^p'    history-beginning-search-backward
bindkey -M vicmd '^n'    history-beginning-search-forward
#bindkey -M vicmd '^p'    up-line-or-history
#bindkey -M vicmd '^n'    down-line-or-history
bindkey -M vicmd '^y'    yank
bindkey -M vicmd '^w'    backward-kill-word
bindkey -M vicmd '^u'    backward-kill-line
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
#bindkey -M vicmd '^_'    undo
#bindkey -M vicmd '\ef'   forward-word                      # Alt-f
#bindkey -M vicmd '\eb'   backward-word                     # Alt-b
#bindkey -M vicmd '\ed'   kill-word                         # Alt-d
#bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
#bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown

# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#     zle reset-prompt
# }

# zle -n zle-line-init
# zle -n zle-keymap-select
export KEYTIMEOUT=20

tp () {
    gpg -d -q .sshpassword.gpg > /tmp/fifo; sshpass -f /tmp/fifo ssh $1
    rm -f /tmp/fifo
}

kset () {
 export KUBECONFIG=.kube/$1
 tmux setenv KUBECONFIG ~/.kube/$1
}
