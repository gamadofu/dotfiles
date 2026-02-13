" サーバ用 Vim 最小設定（プラグインなし）
syntax on
set encoding=utf-8
set noswapfile
set nobk

" 表示
set number
set title
set showmatch
set laststatus=2
set scrolloff=3

" インデント
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" 検索
set incsearch
set ignorecase
set smartcase
set hlsearch

" 括弧補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" 背景透過
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight EndOfBuffer ctermbg=none

" 前回のカーソル位置を復元
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" delete キー対応
set backspace=indent,eol,start
