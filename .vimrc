set shell=/bin/bash

set title

"Removed in Neovim, keeping this for backwards compatibility
set ttyfast
set nocompatible

"Scroll horizontally by 1 character instead of default half screen
set sidescroll=1
"Always show at least 1 line above/below the cursor while scrolling
set scrolloff=1

"Move vertically by rows rather than lines (useful with long lines + wrap on)
nnoremap j gj
nnoremap k gk

"Remove startup message set shortmess+=I
"Mouse support
set mouse=a

set timeoutlen=1000 ttimeoutlen=0

"Show absolute line number directly to the left of current cursor's position and relative numbers elsewhere (awesome!)
set number
" set relativenumber
set norelativenumber

set linebreak
set nowrap
set showbreak=▶
set textwidth=120
set noshowmatch

"No beep or flash
autocmd VimEnter * set vb t_vb=
set hidden
set sessionoptions=resize,winpos,winsize,buffers,tabpages,
set laststatus=2

"Disable swap files creation
set noswapfile

"Create new splits to the right/below of currently active instead of left/top (seems more natural)
set splitright
set splitbelow

"Encoding:
" set langmenu=en_US.UTF-8
" set encoding=utf-8
" set fileencoding=utf-8

"Search:
"Highlight search matches
set hlsearch
set ignorecase
"Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase
"Search as you type
set incsearch

"Indentantion:
"Copy indent from current line when starting a new line
set autoindent
"In insert mode, add spaces instead of tabs
set expandtab
"Default tab width
set shiftwidth=2
"Smart autoindenting when starting a new line
set smartindent
set smarttab
set softtabstop=2

"Ruler:
set ruler
set colorcolumn=120

"Undo history length
set undolevels=200
"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Plugins:
call plug#begin('~/.vim/plugged')
"General:
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-surround'
Plug 'mhartington/oceanic-next'
Plug 'sheerun/vim-polyglot'
" Plug 'morhetz/gruvbox'
" Plug 'Yggdroot/indentLine'

"Git integration:
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Bottom bar:
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax:
Plug 'scrooloose/syntastic'

"Fuzzy search:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'

"Autocomplete, snippets
" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'awetzel/elixir.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'fishbullet/deoplete-ruby'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'

"Comments:
Plug 'tpope/vim-commentary'

Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-expand-region'
Plug 'szw/vim-maximizer'
"Automatic text alignment
Plug 'godlygeek/tabular'

"Ruby
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-rvm'
" Plug 'ngmy/vim-rubocop'

" Plug 'mattboehm/vim-unstack'
" Plug 'mattboehm/vim-accordion'

"Rails
Plug 'tpope/vim-rails'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rake'

"Yaml
Plug 'lmeijvogel/vim-yaml-helper'

"Haml
" Plug 'tpope/vim-haml'

"Slim
" Plug 'slim-template/vim-slim'

"JS
" Plug 'pangloss/vim-javascript'
" Plug 'isRuslan/vim-es6'
" Plug 'kchmck/vim-coffee-script'
" Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'

"TypeScript
" Plug 'Shougo/vimproc.vim' "Async execution library, required by tsuquyomi
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'

"HTML
Plug 'mattn/emmet-vim'

"Neovim only
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'

"Markdown
Plug 'shime/vim-livedown'

"Rust
" Plug 'rust-lang/rust.vim'

"Elixir
" Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

" let g:elixir_docpreview = 1
" let g:elixir_showerror = 1
" let g:elixir_autobuild = 1
let g:syntastic_enable_elixir_checker = 1

filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set background=dark
colorscheme OceanicNext

set omnifunc=syntaxcomplete#Complete

autocmd Filetype sass setlocal ts=2 sts=2 sw=2

"TypeScript integration config
let g:neomake_javascript_enabled_makers = ['eslint']
let g:tsuquyomi_disable_quickfix = 1
" let g:neomake_typescript_enabled_makers = []
" let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript setlocal completeopt+=menu,preview

"Map leader to comma
let mapleader = ","

"Use commands like this: ;w instead of :w
nnoremap ; :

"Easymotion
map <Leader> <Plug>(easymotion-prefix)
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
" omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

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

"" air-line
let g:airline_powerline_fonts = 1


"airline fixes
let g:airline_theme='oceanicnext'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

"NERDTree shortcut ,2
nnoremap <leader>2 <C-n> :NERDTreeToggle<CR>
"Autostart NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
" Uncomment line below in case of performance issues
" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip


"Gitgutter
let g:gitgutter_sign_column_always = 1
"Uncomment two lines below in case of performance issues
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" let g:gitgutter_grep_command = 'ag %s -l --nocolor -g ""'

"I believe these settings (especially re=1) solved slow performance in mvim, I believe
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=400
set re=1

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

"Unified clipboard
if has('nvim')
  set clipboard+=unnamedplus
endif

"JS
let g:jsx_ext_required = 0

"Auto remove trailing whitespaces on save
autocmd BufWritePre * FixWhitespace

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" makeYCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<C-e>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Python
let g:syntastic_python_checkers = []
"
" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz
" Last and next jump should center too.
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
