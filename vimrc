"dein ----------
" $ mkdir -p ~/.cache/dein/repos/github.com/Shougo/dein.vim
" $ git clone https://github.com/Shougo/dein.vim/git \
"     ~/.cache/dein/repos/github.com/Shougo/dein.vim
if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
	call dein#begin(expand('~/.cache/dein'))
  "dein.add
  call dein#add('Shougo/dein.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('kovisoft/slimv')
  "dein.colorscheme
  call dein#add('yasukotelin/shirotelin', {'merged': 0})
  call dein#add('jacoborus/tender')
  call dein#add('tomasr/molokai', {'merged': 0})
  call dein#end()
	call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
	call dein#install()
endif
"dein.delete
"call map(dein#check_clean(), "delete(v:val, 'rf')")

"LightLine.vim --------------------
let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'active' : { 'left' : [['mode', 'paste'],
      \                         ['gitbranch', 'readonly', 'filepath', 'modified']],
      \               'right': [['lineinfo'],
      \                         ['percent'],
      \                         ['fileformat', 'fileencoding', 'filetype']]},
      \  'component_function' :{ 'gitbranch' : 'fugitive#head',
      \                          'filepath'  : 'FilePath' },
      \  'separator':    {'left' : "", 'right': ""},
      \  'subseparator': {'left' : "", 'right': ""}
      \}
function! FilePath()
  if winwidth(0) > 180
    return expand("%:s")
  else
    return expand("%:t")
  endif
endfunction

"Sets ----------
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set ff=unix
set nobackup
set noswapfile
set autoread
set autochdir
set hidden
set showcmd
set mouse=a
set ambiwidth=double
set number
set virtualedit=onemore
set visualbell
set showmatch
set wildmode=list:longest
set wrap
" sets.colorscheme
syntax enable
colorscheme molokai
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
if !has('gui_running')
  set t_Co=256
endif
" sets.tab
set expandtab
set tabstop=2
set smartindent
set shiftwidth=2
set showtabline=2
set laststatus=2
set clipboard+=unnamed
" sets font (ref : https://github.com/miiton/Cica)
set guifont=Cica:h12
set printfont=Cica:h8
" sets.search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

"KEYMAP ----------
" key.move
nnoremap j gj
nnoremap k gk
" key.searchoff
nnoremap /<C-[> :set hlsearch!<CR>
" key.leader
let g:mapleader = "\<Space>"
nnoremap <Leader>s :source %<CR>
nnoremap <Leader>, :new ~/.vimrc<CR>
" key.commands
cnoremap <C-d> ~/dev/

"utility commands -----

