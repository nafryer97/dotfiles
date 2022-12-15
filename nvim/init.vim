if has('nvim')
    let env_dir = stdpath('data')
    let data_dir = env_dir . '/site'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    let g:python3_host_prog = env_dir . '/env/python/bin/python3'
    let g:ruby_host_prog = env_dir . '/env/ruby/ruby'

    call plug#begin()
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'monsonjeremy/onedark.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'
    call plug#end()

    let plugged_dir = env_dir . '/plugged/'
    if isdirectory(plugged_dir . 'lualine.nvim')
        lua require('lualine').setup({options = {theme = 'auto'}})
    endif
    if isdirectory(plugged_dir . 'material.nvim')
        let g:material_style = 'palenight'
        lua require('material').setup({lualine_style = 'default'})
        colorscheme material
    endif
    if isdirectory(plugged_dir . 'mason.nvim')
        lua require('mason').setup({max_concurrent_installers = 8})
    endif
    if isdirectory(plugged_dir . 'mason-lspconfig.vim')
        lua require('mason-lspconfig').setup()
    endif
    if isdirectory(plugged_dir . 'navigator.lua')
        lua require('navigator').setup({mason = true, lsp={servers={'zk', 'marksman'}}})
    endif
    if isdirectory(plugged_dir . 'null-ls.nvim')
        lua require('null-ls').setup()
    endif
    if isdirectory(plugged_dir . 'onedark.nvim')
        lua require('onedark').setup()
    endif
    "if isdirectory(plugged_dir . )
    "endif
endif

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
set noequalalways
set signcolumn=number
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
set diffopt=internal,filler,closeoff,indent-heuristic,algorithm:histogram

hi ColorColumn ctermbg=lightgrey guibg=lightgrey

syntax enable
filetype plugin indent on

command! -nargs=* T split +terminal <args>
command! -nargs=* VT vsplit +terminal <args>

augroup custom_bufenter
    autocmd!
    autocmd BufEnter * if ! &readonly | setlocal autochdir | endif
augroup END

augroup custom_filetype
    autocmd!
    autocmd FileType help wincmd L | nmap <unique> <buffer> <nowait> q <Cmd>helpclose<CR>
    autocmd FileType sh setlocal formatoptions-=c
    autocmd FileType text,plaintex,markdown setlocal formatoptions+=anp | let g:markdown_folding = 1
augroup END

augroup custom_terminal
    autocmd!
    autocmd TermOpen * startinsert | setlocal nonumber
    autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
augroup END

lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
