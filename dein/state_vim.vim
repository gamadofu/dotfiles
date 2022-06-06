if g:dein#_cache_version !=# 410 || g:dein#_init_runtimepath !=# '/Users/yajima/dotfiles/dein/repos/github.com/Shougo/dein.vim,/Users/yajima/.vim,/opt/homebrew/share/vim/vimfiles,/opt/homebrew/share/vim/vim82,/opt/homebrew/share/vim/vimfiles/after,/Users/yajima/.vim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#min#_load_cache_raw(['/Users/yajima/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/yajima/dotfiles/dein'
let g:dein#_runtime_path = '/Users/yajima/dotfiles/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/yajima/dotfiles/dein/.cache/.vimrc'
let &runtimepath = '/Users/yajima/dotfiles/dein/repos/github.com/Shougo/dein.vim,/Users/yajima/.vim,/opt/homebrew/share/vim/vimfiles,/Users/yajima/dotfiles/dein/.cache/.vimrc/.dein,/opt/homebrew/share/vim/vim82,/Users/yajima/dotfiles/dein/.cache/.vimrc/.dein/after,/opt/homebrew/share/vim/vimfiles/after,/Users/yajima/.vim/after'
filetype off
