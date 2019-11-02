if &compatible
	set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim


if dein#load_state('~/.vim/dein')

	call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('itchyny/lightline.vim')
  call dein#add('yasukotelin/shirotelin', {'merged': 0})
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('jacoborus/tender')
  call dein#add('tomasr/molokai', {'merged': 0})

  call dein#end()
	call dein#save_state()
endif

filetype plugin indent on


if dein#check_install()
	call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")


" for GitBash terminal -----------------------
function! GitBash()
    " Setting UTF-8 (Japanese Windows set 'ja' as default)
    let l:env = {
                \ 'LANG': systemlist('"C:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                \ }

    " for remote
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif

    " term_start, then GitBash
    call term_start(['C:/Program Files/Git/bin/bash.exe', '-l'], {
                \ 'term_name': 'Git',
                \ 'term_finish': 'close',
                \ 'curwin': v:true,
                \ 'cwd': $USERPROFILE,
                \ 'env': l:env,
                \ })

endfunction

cnoremap <C-b> :<C-u>call GitBash()


" for LightLine.vim --------------------------
let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'active' : { 'left' : [['mode', 'paste'],
      \                         ['gitbranch', 'readonly', 'filepath', 'modified']],
      \               'right': [['lineinfo'],
      \                         ['percent'],
      \                         ['fileformat', 'fileencoding', 'filetype']]},
      \  'component_function' :{ 'gitbranch' : 'fugitive#head',
      \                          'filepath'  : 'FilePath' },
      \  'separator': {'left' : "рс", 'right': "ру"},
      \  'subseparator': {'left' : "рт", 'right': "рф"}
      \}

function! FilePath()
  if winwidth(0) > 180
    return expand("%:s")
  else
    return expand("%:t")
  endif
endfunction

" Sets ====================

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set mouse=a

": colorscheme
syntax enable
colorscheme molokai
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
if !has('gui_running')
  set t_Co=256
endif

set ambiwidth=double

set number
set virtualedit=onemore
set visualbell
set showmatch
set wildmode=list:longest
set wrap

set expandtab
set tabstop=2
set smartindent
set shiftwidth=2

set showtabline=2
set laststatus=2
set clipboard+=unnamed

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set guifont=Cica:h12
set printfont=Cica:h8


" KEYMAP ===============
" :move
nnoremap j gj
nnoremap k gk
nnoremap <C-j> }
nnoremap <C-k> {

" :commands
cnoremap <C-s> source $VIM/_vimrc
cnoremap <C-r> new $VIM/_vimrc
