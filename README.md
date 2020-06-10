# JaimehRubiks config files


## OSX Install
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install macvim --with-override-system-vim
    brew install vim git zsh zsh-completions tmux-xpanes
    brew install kubectl derailed/k9s/k9s

## Linux Install
    sudo apt-get install git vim zsh wget

    wget https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes -O ./xpanes
    sudo install -m 0755 xpanes /usr/local/bin/xpanes

    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl

## Install 
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && sudo chmod a+x /usr/local/bin/yadm
    yadm clone https://github.com/jaimehrubiks/dotfiles
    yadm pull
    chsh -s /bin/zsh

## NOTES
* Remember to :PlugInstall inside VIM
* You can set classes by: yadm config local.class clase and saving files as file##clase

Alternative Link:  
https://git.io/vdXA5



# Others
## OSX
### Insecure SSH Password storage system

echo 'mySshPasswordHere' > .sshpassword # Better to vim it
gpg -c .sshpassword
rm .sshpassword

brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
brew install gnupg gnupg2 

Add to .zshrc
tp () {
    gpg -d -q .sshpassword.gpg > /tmp/fifo; sshpass -f /tmp/fifo ssh $1
    rm -f /tmp/fifo
}
