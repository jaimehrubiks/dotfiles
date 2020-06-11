
# CENTOS Install

## Software
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install macvim --with-override-system-vim
    brew install vim git zsh zsh-completions tmux tmux-xpanes peco
    brew install kubectl derailed/k9s/k9s kubectx

## Install Antigen (ZSH Plugin Manager)
    xx url -L git.io/antigen > ~/antigen.zsh

## Install ZPLUG (ZSH Plugin Manager)
    export ZPLUG_HOME=~/.zplug
    git clone https://github.com/zplug/zplug $ZPLUG_HOME

## Install Vundle (VIM Plugin Manager)
    mkdir -p .vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install TPM (Tmux Plugin Manager)
    mkdir -p .tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Xpanes

## Kubectl

## Kubernetes: Others

## Kubernetes: K9s
 
## Install DOTFILES
    cd
    sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && sudo chmod a+x /usr/local/bin/yadm
    yadm clone https://github.com/jaimehrubiks/dotfiles
    yadm pull
    chsh -s /bin/zsh

## Finally
    vim (:PluginInstall)
