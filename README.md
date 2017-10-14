# JaimehRubiks config files


## OSX Install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install macvim --with-override-system-vim
brew install vim git zsh zsh-completions

## Linux Install
sudo apt-get instal git vim zsh

## Install 
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${$HOME}/.zprezto"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && sudo chmod a+x /usr/local/bin/yadm
yadm clone https://github.com/jaimehrubiks/dotfiles
yadm pull

## NOTES
* Remember to :PlugInstall inside VIM
* You can set classes by: yadm config local.class clase and saving files as file##clase

Alternative Link:  
https://git.io/vdXA5


