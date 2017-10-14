set nocompatible 
filetype off

"" Execute commands with Bash, always.
" set shell=bash\ -i
set shell=/bin/bash


"" ;;;;;;;;;;; VUNDLE ;;;;;;;;;;;;;

"" Load Vundle, store bundles in ~/.vundle.local
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Let vundle manage vundle
Plugin 'gmarik/Vundle.vim'

"" CrlP
Plugin 'ctrlpvim/ctrlp.vim'

"" Latex and Markdown
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'

"" NerdTREE
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"" Programming
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'

"" Others
Plugin 'nvie/vim-togglemouse'

"" Unactive
" Plugin 'justinmk/vim-dirvish'
" Plugin 'tpope/vim-vinegar'


let g:livepreview_previewer = 'open -a Skim'
" let g:livepreview_engine = 'xelatex' " . ''
autocmd Filetype tex setl updatetime=200


call vundle#end() 
"" ;;;;;;;;;;; VUNDLE ;;;;;;;;;;;;;

filetype plugin indent on 



" GENERAL
let mapleader=","
set nobackup
set noswapfile

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set clipboard=unnamed

set belloff=all


" SEARCHING
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

" MOUSE ENABLED
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" DECORATIONS
"filetype plugin indent on   " can't set this with vundle
syntax on
set number
set showcmd
set ruler
"set nowrap
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" TABULATIONS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set copyindent
set smartindent " Intellegently dedent / indent new lines based on rules.


set hidden
set backspace=indent,eol,start

" ONLY FOR PRACTICE
imap jk <Esc>
imap ZX <Esc>:w<cr>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <leader>s :w<cr>
nnoremap ZX :w<cr>
nnoremap j gj
nnoremap k gk
" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

" inoremap <leader>s <C-c>:w<cr>

" nerdTREE config
map - :NERDTreeToggle<CR>

" airLine config and themes
let g:airline_theme='aurora'

" ctrlP
let g:ctrlp_map = '<c-M>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'ra'
