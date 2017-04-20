" http://post.simplie.jp/posts/56

if &compatible
  set nocompatible
endif

set runtimepath+=/home/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('/home/.dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('mhartington/oceanic-next')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('Yggdroot/indentLine')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('rhysd/accelerated-jk')
  ; call dein#add('edkolev/tmuxline.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tpope/vim-endwise')
  call dein#add('Townk/vim-autoclose')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

let g:neocomplete#enable_at_startup = 1

if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

let NERDTreeShowHidden = 1


set termguicolors
syntax enable
colorscheme OceanicNext

let g:airline_theme='oceanicnext'

autocmd BufWritePre * :FixWhitespace

nmap <Leader><Tab> <C-w>w
nmap <Leader>f :CtrlP<CR>
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
noremap <C-j> <esc>
noremap! <C-j> <esc>

let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

" Basic
set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=80
set confirm
set cursorline
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
set listchars=eol:¬
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set number
set ruler
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
