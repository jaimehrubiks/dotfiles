
# CENTOS Install

## Software
    sudo yum install -y git vim wget tmux

## Install ZSH
    VERSION=5.7.1
    sudo yum install -y ncurses-devel gcc
    cd /usr/local/src
    sudo curl -L http://sourceforge.net/projects/zsh/files/zsh/${VERSION}/zsh-${VERSION}.tar.xz/download -o zsh-${VERSION}.tar.xz
    sudo tar -xf zsh-${VERSION}.tar.xz
    cd zsh-${VERSION}
    sudo ./configure && sudo make && sudo make install
    cd

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
    wget https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes -O ./xpanes
    sudo install -m 0755 xpanes /usr/local/bin/xpanes
    rm ./xpanes

## Peco
    VER=0.5.7
    curl -LO https://github.com/peco/peco/releases/download/v${VER}/peco_linux_386.tar.gz
    tar -zxvf peco_linux_386.tar.gz
    chmod +x peco_linux_386/peco
    sudo mv peco_linux_386/peco /usr/local/bin/
    rm -f ./peco_linux_386.tar.gz

## Kubectl
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl

## Kubernetes: Others
    autoload -U compinit && compinit
    sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
    sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
    sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
    mkdir -p ~/.oh-my-zsh/completions
    chmod -R 755 ~/.oh-my-zsh/completions
    ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
    ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

## Kubernetes: K9s
    export VER=0.20.5
    curl -LO https://github.com/derailed/k9s/releases/download/v${VER}/k9s_Linux_x86_64.tar.gz
    tar -zxvf k9s_Linux_x86_64.tar.gz
    chmod +x ./k9s
    sudo mv ./k9s /usr/local/bin/
 
## Install DOTFILES
    cd
    sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && sudo chmod a+x /usr/local/bin/yadm
    yadm clone https://github.com/jaimehrubiks/dotfiles
    yadm pull
    chsh -s /bin/zsh

## Finally
    vim (:PluginInstall)
