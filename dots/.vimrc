syntax on

"===== dein.vim =====
if filereadable(expand('dein/load.vim'))
  source dein/load.vim
endif

" New Setting 2016.09.15
" base
set encoding=utf8
set fencs=utf-8,euc-jp,sjis,iso-2022-jp,latin1
set tabstop=2
set shiftwidth=2
set nobk
set laststatus=2
set so=3
set incsearch
set ignorecase
set smartcase
set expandtab
" Color
colorscheme molokai
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
" indent
set cindent
"set smartindent
set autoindent
" other
set showmatch
set hlsearch
" ver 8.0用 deleteできないので
set backspace=indent,eol,start

let loaded_matchparen = 1

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" New Settings End

" ターミナルタイプによるカラー設定
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" 
 set t_Co=16
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-256color" || &term =~ "screen"
 set t_Co=256
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-color"
 set t_Co=8
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
endif


" StatusLine
set guifont=Ricty\ 10

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode'
      \ }
      \ }

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

