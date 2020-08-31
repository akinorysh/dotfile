let g:mapleader = "\<Space>"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" # dein
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" $ mkdir -p ~/.cache/dein/repos/github.com/Shougo/dein.vim
" $ git clone https://github.com/Shougo/dein.vim/git \
"     ~/.cache/dein/repos/github.com/Shougo/dein.vim
if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')

	call dein#begin(expand('~/.cache/dein'))

  call dein#add('Shougo/dein.vim')

  " util
  call dein#add('scrooloose/nerdtree')
  " switch from nerdtree if you like...
  " call dein#add('lambdalisue/fern.vim')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('simeji/winresizer')
  call dein#add('osyo-manga/vim-over')

  " operator / commands
  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-operator-replace')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " GUI enhancements
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('itchyny/lightline.vim')

  " Colorschemes
  call dein#add('tomasr/molokai', {'merged': 0})
  call dein#add('yasukotelin/shirotelin', {'merged': 0})

  " Language supports
  call dein#add('kovisoft/slimv')

  " Web development

  call dein#add('pangloss/vim-javascript')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('mattn/emmet-vim')

  " clojure
  call dein#add('junegunn/fzf')
  call dein#add('guns/vim-sexp')
  call dein#add('liquidz/vim-iced')

  " TO BE CONTINUED...
  " call dein#add('terryma/vim-multiple-cursors')
  " call dein#add('yuttie/comfortable-motion.vim')


  call dein#end()
	call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
	call dein#install()
endif
"dein.delete
"call map(dein#check_clean(), "delete(v:val, 'rf')")

"vim-gitgutter
set updatetime=300

"lightline.vim
let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'active' : { 'left' : [['mode', 'paste'],
      \                         ['readonly', 'llfilepath', 'modified']],
      \               'right': [['gitbranch'],
      \                         ['fileformat']]},
      \  'component_function' :{ 'gitbranch' : 'LightlineGitbranch',
      \                          'llfilepath'  : 'LightlineFilePath' },
      \  'separator':    {'left' : "", 'right': ""},
      \  'subseparator': {'left' : "", 'right': ""}
      \}
function! LightlineFilePath()
  return expand('%:t')
endfunction

function! LightlineGitbranch()
  let out = FugitiveHead()
  if out == ''
    return ''
  else
    return '' . out
  endif
endfunction

"NERDTree
nnoremap <Leader>e :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | cd ~ | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"vim-iced
let g:iced_enable_default_key_mappings = v:true

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set autoindent
set encoding=utf-8
scriptencoding utf-8
set printencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set ff=unix
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces

set nobackup
set noswapfile
set autoread
set autochdir
set ambiwidth=double
set virtualedit=onemore
set visualbell
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set smartindent
set showtabline=2
set clipboard=
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=*~,*.png,*.jpg,*.gif

" Use small tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault " default :s///g
set wrapscan
set hlsearch

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" GUI Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newline
set nofoldenable " ?
set ruler " where am I?
set ttyfast " ?
set lazyredraw " ?
set synmaxcol=500 " ?
set laststatus=2
set relativenumber
set number
set showcmd
set mouse=a " enable mouse for all mode

" font
set guifont=Cica:h12
set printfont=Cica:h8

" colorscheme
syntax enable
if (has("termguicolors"))
  set termguicolors
endif
if !has('gui_running')
  set t_Co=256
endif
set background=dark
colorscheme molokai

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Keyboard Shortcut
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

" Move by line
nnoremap j gj
nnoremap k gk

" Scroll half a page
nnoremap <C-h> ^
vnoremap <C-h> ^
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz
nnoremap <C-l> $
vnoremap <C-l> $

" Toggle Tags
nnoremap <C-TAB> gt
nnoremap <C-S-TAB> :tabe<CR>

" Use clipboard
nnoremap <Leader>y "*Y
nnoremap <Leader>p "*p

" Rich term mode
tnoremap <C-[><C-[> <C-\><C-n>

" misc
nnoremap <Leader>s :source %<CR>
nnoremap <Leader>, :new ~/.vimrc<CR>
cnoremap <C-d> ~/dev/

" my own map using only m
nnoremap m mm
nnoremap ` `m

" zz can be single z
nnoremap z zz

" for vim-operator-replace
map R <Plug>(operator-replace)
