"Ubuntu
set shell=/bin/bash\ -i
"OSX
set shell=/bin/sh
let macvim_skip_colorscheme=1

set nocompatible

"Mouse support
set mouse=a

"Speed up
set lazyredraw
set ttyfast

set timeoutlen=500
set number
set linebreak
set showbreak=>>>
set textwidth=120
set noshowmatch
"No beep or flash
autocmd VimEnter * set vb t_vb=
set hidden
set sessionoptions=resize,winpos,winsize,buffers,tabpages,
set laststatus=2

"Encoding, language
set langmenu=en_US.UTF-8
set encoding=utf-8
set fileencoding=utf-8

"Search
set hlsearch
set smartcase
set ignorecase
set incsearch

"Indentantion
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

"Ruler
set ruler
set colorcolumn=120

set undolevels=200
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
Plugin 'xolox/vim-easytags'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'szw/vim-g'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'szw/vim-maximizer'

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
Plugin 'ngmy/vim-rubocop'
Plugin 'lmeijvogel/vim-yaml-helper'

call vundle#end()
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

"Map leader to ,
let mapleader = ","

"Use commands like this: ;w instead of :w
nnoremap ; :

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-j> ddp
nmap <C-k> ddkP

"Bubble multiple lines
vmap <C-j> xp`[V`]
vmap <C-k> xkP`[V`]

"Easymotion
map <Leader> <Plug>(easymotion-prefix)

"Async easytags
let g:easytags_async = 1

"Rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
"Speed fixes http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"airline fixes
set fillchars+=stl:\ ,stlnc:\
let &t_Co=256

"vim-maximizer
" let g:maximizer_default_mapping_key = '<F5>'

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
