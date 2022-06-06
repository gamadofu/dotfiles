"""===== dein.vim ======

"dein.vim dark power
let s:dein_dir = expand('~/dotfiles/dein')
"
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

set nocompatible
" dein.vim をインストールしていない場合は自動インストール
if !isdirectory(s:dein_repo_dir)
  echo "install dein.vim..."
  execute '!git clone git://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

"---------------------------
" Start dein.vim Settings.
"---------------------------

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/dotfiles/dein')

	call dein#add('tpope/vim-fugitive')
	call dein#add('itchyny/lightline.vim')
	call dein#add('tikhomirov/vim-glsl')
	call dein#add('pangloss/vim-javascript')
	call dein#add('maxmellon/vim-jsx-pretty')
	call dein#add('alampros/vim-styled-jsx')
	call dein#add('othree/yajs.vim')
	call dein#add('othree/es.next.syntax.vim')
  call dein#add('leafgarland/typescript-vim')
	call dein#add('tomasr/molokai')
  call dein#add('NLKNguyen/papercolor-theme')
  call dein#add('arzg/vim-colors-xcode')
  call dein#add('ghifarit53/tokyonight-vim')
  call dein#add('neoclide/coc.nvim', {'branch': 'release'})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" 未インストールを確認
if dein#check_install()
  call dein#install()
endif

"---------------------------
" End dein.vim Settings.
"---------------------------
