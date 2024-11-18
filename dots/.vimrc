syntax on
" shell
set shell=/bin/zsh

" base
" encoding
set encoding=utf8
set fencs=utf-8,euc-jp,sjis,iso-2022-jp,latin1

set noswapfile
set nobk

set title

" indent
filetype plugin indent on 
set tabstop=2
set shiftwidth=2
set expandtab
set cindent
set autoindent
" search
set incsearch
set ignorecase

" other
set showmatch
set hlsearch
" ver 8.0用 deleteできないので
set backspace=indent,eol,start

set laststatus=2
set so=3
set smartcase

let loaded_matchparen = 1

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" New Settings End

" StatusLine
set guifont=Ricty\ 10

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ["coc"]]
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
      \   'mode': 'LightLineMode',
      \   'coc': 'coc#status',
      \ }
\}
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

" key bind
" " 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" dein-> jetpac 移行 ===== dein.vim =====
""if filereadable(expand('~/dein/load.vim'))
""  source ~/dein/load.vim
""endif
" cmd :JetpackSync
let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} " bootstrap
Jetpack 'tpope/vim-fugitive'
Jetpack 'itchyny/lightline.vim'
Jetpack 'tikhomirov/vim-glsl'
Jetpack 'pangloss/vim-javascript'
Jetpack 'maxmellon/vim-jsx-pretty'
Jetpack 'alampros/vim-styled-jsx'
Jetpack 'othree/yajs.vim'
Jetpack 'othree/es.next.syntax.vim'
Jetpack 'leafgarland/typescript-vim'
Jetpack 'tomasr/molokai'
Jetpack 'NLKNguyen/papercolor-theme'
Jetpack 'arzg/vim-colors-xcode'
Jetpack 'ghifarit53/tokyonight-vim'
Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
Jetpack 'posva/vim-vue'

call jetpack#end()
" Color
set t_Co=256
set t_Sf=^[[3%dm
set t_Sb=^[[4%dm
set background=light
colorscheme molokai

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

"Diagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>


autocmd BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.js set filetype=javascript
