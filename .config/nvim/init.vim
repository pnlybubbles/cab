" http://post.simplie.jp/posts/56

if &compatible
  set nocompatible
endif

set runtimepath+=/home/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('/home/.dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
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
  call dein#add('edkolev/tmuxline.vim')
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

nmap <Leader><Tab> <C-w>w

set termguicolors
syntax enable
colorscheme OceanicNext

let g:airline_theme='oceanicnext'

autocmd BufWritePre * :FixWhitespace

nmap <Leader>f :CtrlP<CR>
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

let g:airline#extensions#branch#enabled = 1
