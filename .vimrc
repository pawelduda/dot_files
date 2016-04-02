"Ubuntu
set shell=/bin/bash\ -i
"OSX
set shell=/bin/sh
let macvim_skip_colorscheme=1

set nocompatible

"GUI settings
set gfn=Monaco\ 12
set guioptions-=T
set guiheadroom=0
set guioptions-=e

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

"Disable swap files creation
set noswapfile

"Encoding, language
" set langmenu=en_US.UTF-8
" set encoding=utf-8
" set fileencoding=utf-8

"Search
set hlsearch
set smartcase
set ignorecase
set incsearch

"Indentantion
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

"Ruler
set ruler
set colorcolumn=120

set undolevels=200
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'NLKNguyen/papercolor-theme'

Plug 'scrooloose/syntastic'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'szw/vim-maximizer'
Plug 'lambdalisue/vim-fullscreen'

"Language/tool specific
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rvm'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'isRuslan/vim-es6'
Plug 'mattboehm/vim-unstack'
Plug 'mattboehm/vim-accordion'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'

"Neovim only
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
call plug#end()

filetype plugin indent on

set background=dark
set t_Co=256
colorscheme PaperColor

set omnifunc=syntaxcomplete#Complete

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"Map leader to ,
let mapleader = ","

"Use commands like this: ;w instead of :w
nnoremap ; :

"Easymotion
map <Leader> <Plug>(easymotion-prefix)

"Easytags
"Async easytags
let g:easytags_async = 1
"Create tags files per working directory
" let g:easytags_dynamic_files = 2
" set cpoptions+=d

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
map <C-l> :CtrlPMRU<CR>
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

"Use custom matcher for ctrlp
" let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

"airline fixes
set fillchars+=stl:\ ,stlnc:\
let &t_Co=256

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

let g:syntastic_javascript_checkers = ['standard']"

"NERDTree shortcut ,2
nmap <leader>2 <C-n> :NERDTreeToggle<CR>

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
" Uncomment line below in case of performance issues
" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Gitgutter
"Uncomment two lines below in case of performance issues
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" let g:gitgutter_grep_command = 'ag %s -l --nocolor -g ""'

"I believe these settings (especially re=1) solved slow performance in mvim, I believe
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
set synmaxcol=200
set re=1

" make test commands execute using dispatch.vim
let test#strategy = 'neoterm'

"Exit terminal mode with esc
:tnoremap <Esc> <C-\><C-n>"

"Improve windows navigation by using 'alt + x' combination even when terminal window is active
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

"Neomake on save
autocmd! BufWritePost * Neomake
