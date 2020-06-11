# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zplug Init
export ZPLUG_HOME=~/.zplug
source ${ZPLUG_HOME}/init.zsh

# Zplug Configuration
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
# zplug "desyncr/auto-ls"
zplug "arzzen/calc.plugin.zsh"
zplug "peterhurford/up.zsh"
zplug "jimeh/zsh-peco-history", defer:2
zplug "plugins/kubectl", from:oh-my-zsh, defer:2
zplug "bonnefoa/kubectl-fzf", defer:3

# Theme
# zplug "jaimehrubiks/agnoster-zsh-theme", from:oh-my-zsh
# zplug 'themes/agnoster', from:oh-my-zsh
zplug romkatv/powerlevel10k, as:theme, depth:1

# Install Plugins if not installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Zplug Load
zplug load

# p10K Configuration (Source File)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins Configuration
ZSH_PECO_HISTORY_OPTS="--layout=top-down --initial-filter=Fuzzy"
ZSH_PECO_HISTORY_DEDUP=notnull
# AUTO_LS_COMMANDS=(ls)
# AUTO_LS_PATH=false

# ZSH Config
#############################################
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt autocd extendedglob nomatch
unsetopt appendhistory beep notify
fpath=(~/.oh-my-zsh/completions/ $fpath)
compinit

# Alias
alias ll='ls -lah --color'
alias k=kubectl
alias kctx=kubectx
alias kns=kubens

# Functions
mkcd() { mkdir -p "$@" && cd "$@"; }

tp () {
    gpg -d -q .sshpassword.gpg > /tmp/fifo; sshpass -f /tmp/fifo ssh $1
    rm -f /tmp/fifo
}

kset () {
    export KUBECONFIG=.kube/$1
    tmux setenv KUBECONFIG ~/.kube/$1
    kubectl config use-context $1
}


# VIM
# Enable
bindkey -v
# Global
bindkey "^?" backward-delete-char
# Insert Mode
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
# bindkey -M viins '^p'    history-beginning-search-backward
# bindkey -M viins '^n'    history-beginning-search-forward
bindkey -M viins '^p'    history-substring-search-up
bindkey -M viins '^n'    history-substring-search-down
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
bindkey -M viins 'jk'    vi-cmd-mode
# CMD mode
bindkey -M vicmd '^a'    beginning-of-line
bindkey -M vicmd '^e'    end-of-line
# bindkey -M vicmd '^p'    history-beginning-search-backward
# bindkey -M vicmd '^n'    history-beginning-search-forward
bindkey -M vicmd '^p'    history-substring-search-up
bindkey -M vicmd '^n'    history-substring-search-down
bindkey -M vicmd '^y'    yank
bindkey -M vicmd '^w'    backward-kill-word
bindkey -M vicmd '^u'    backward-kill-line
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
