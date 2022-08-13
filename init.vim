set nocompatible
set nomodeline
set confirm
set incsearch
set ignorecase
set smartcase
set hlsearch
set ruler
set wildmenu
set wildignorecase
set lazyredraw
set autoread
set breakindent
set showmatch
set number
set splitbelow
set splitright
set autochdir
set wrapscan
set nowrap
set hidden
set showmode
set autowriteall
set nofsync
set emoji
set errorbells
set visualbell
set copyindent
set preserveindent
set autoindent
set smartindent
set expandtab
set smarttab
set shiftround
set belloff=
set showtabline=2
set background=dark
set scrolloff=2
set wildmode=longest,list
set cmdheight=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set foldmethod=syntax
set fileformats=unix,mac,dos
set backupext=_nvimbu
set textwidth=80
set formatoptions=bjcroq

syntax enable
filetype plugin indent on

colorscheme pablo

command! -nargs=* T split +terminal <args>
command! -nargs=* VT vsplit +terminal <args>

augroup custom_filetype
    autocmd!
    autocmd FileType help wincmd L | nmap <unique> <buffer> <nowait> q <Cmd>helpclose<CR>
    autocmd FileType sh setlocal formatoptions-=c
    autocmd FileType text,plaintex,markdown setlocal formatoptions+=anp
augroup END

augroup custom_terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
augroup END
