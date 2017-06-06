" http://post.simplie.jp/posts/56

if &compatible
  set nocompatible
endif

set runtimepath+=/home/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('/home/.dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('mhartington/oceanic-next')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('Yggdroot/indentLine')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('rust-lang/rust.vim')
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-commentary')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('cocopon/vaffle.vim')
  call dein#add('terryma/vim-multiple-cursors')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
let g:indentLine_color_gui = '#3a3a3a'

if dein#check_install()
  call dein#install()
endif

" Color Scheme

set termguicolors
syntax enable
colorscheme OceanicNext
runtime! airline-theme.vim
let g:airline_theme='custom'
hi Normal guibg=NONE guifg=#b2b2b2
hi LineNr guifg=#808080 guibg=None
hi CursorLineNr guifg=#808080 guibg=#3a3a3a
hi CursorLine guibg=#3a3a3a
hi ColorColumn guibg=None
hi GitGutterAdd guibg=None
hi GitGutterChange guibg=None
hi GitGutterDelete guibg=None
hi GitGutterChangeDelete guibg=None
hi Directory guifg=#b2b2b2
hi EndOfBuffer guifg=#292929
set fillchars+=vert:\│
hi VertSplit guibg=None guifg=#4e4e4e
hi StatusLine guibg=#4e4e4e
hi StatusLineNC guibg=#4e4e4e
hi Search guibg=#585858 guifg=None
hi Visual guibg=#585858 guifg=None
hi Pmenu guibg=#1c1c1c guifg=#808080
hi PmenuSel guibg=#1c1c1c guifg=#ff2a5f

autocmd BufWritePre * FixWhitespace

noremap <C-j> <esc>
noremap! <C-j> <esc>

nnoremap : ;
nnoremap ; :

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case=1
imap <silent><expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
imap <silent><expr><tab> pumvisible() ? "\<c-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
smap <silent><expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

nnoremap H :<c-u>bprevious<CR>
nnoremap L :<c-u>bnext<CR>

nnoremap <expr> <c-l> ':<c-u>Vaffle ' . expand('%:h') . '<CR>'

inoremap <c-e> <c-o>$

nnoremap <silent> <c-p>p :<c-u>Denite file_rec<CR>
nnoremap <silent> <c-p>g :<c-u>Denite grep<CR>
nnoremap <silent> <c-p>l :<c-u>Denite line<CR>
nnoremap <silent> <c-p>m :<c-u>Denite file_mru<CR>
nnoremap <silent> <c-p>y :<c-u>Denite neoyank<CR>
nnoremap <silent> <c-k> :<c-u>Denite buffer<CR>
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts', ['--nocolor', '--nogroup'])

let g:multi_cursor_quit_key='<c-j>'

" Basic
set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=80
set confirm
" set cursorline " too heavy
set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set number
set scrolloff=4
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set wildmode=list:longest,full
set wrap
set wrapscan
set guicursor=a:blinkon0
