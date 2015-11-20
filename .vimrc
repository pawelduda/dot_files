"Ubuntu
set shell=/bin/bash\ -i
"OSX
set shell=/bin/sh
let macvim_skip_colorscheme=1

set nocompatible

set timeoutlen=500
set number
set linebreak
set showbreak=+++
set textwidth=120
set showmatch
set visualbell
set hidden
set sessionoptions=resize,winpos,winsize,buffers,tabpages,
     
"Search
set hlsearch
set smartcase
set ignorecase
set incsearch       
 
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
 
set ruler
 
set undolevels=100
set backspace=indent,eol,start

syntax on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'
Plugin 'easymotion/vim-easymotion'
Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'szw/vim-g'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

"Language/tool specific
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rvm'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()
filetype plugin indent on

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

autocmd BufWritePost * exe ":UpdateTags"

"Map leader to ,
let mapleader = ","

"Use commands like this: ;w instead of :w
nnoremap ; :

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-j> ddkP
nmap <C-k> ddp

"Bubble multiple lines
vmap <C-j> xkP`[V`]
vmap <C-k> xp`[V`]

"Easymotion
map <Leader> <Plug>(easymotion-prefix)

"Rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
