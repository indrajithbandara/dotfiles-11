"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif


set runtimepath+=/Users/vladimiriacob/.dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/vladimiriacob/.dein')
" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('junegunn/seoul256.vim')
call dein#add('hzchirs/vim-material')
call dein#add('Shougo/deoplete.nvim')
call dein#add('vim-airline/vim-airline')
call dein#add('https://github.com/vim-airline/vim-airline-themes')
call dein#add('tpope/vim-fugitive')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('zchee/deoplete-jedi')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('Raimondi/delimitMate')
call dein#add('scrooloose/nerdtree')
call dein#add('easymotion/vim-easymotion')
" call dein#add('junegunn/vim-easy-align')
call dein#add('christoomey/vim-tmux-navigator')
" call dein#add('hashivim/vim-terraform')
call dein#add('ryanoasis/vim-devicons')
call dein#add('airblade/vim-gitgutter')


" JS plugins
" call dein#add('posva/vim-vue')
" call dein#add('ternjs/tern_for_vim')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('pangloss/vim-javascript')
call dein#add('ElmCast/elm-vim')
" call dein#add('othree/yajs.vim')
" call dein#add('othree/es.next.syntax.vim')

" Snips
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Set python paths
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

"End dein Scripts-------------------------
