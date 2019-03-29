"
" NVim configuration
"

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set smartindent         " Auto indentation for C and C++
"set number             " Show line number in the first column
set foldmethod=indent   " Set fold method to indentation
set noexpandtab
set tabstop=4
set shiftwidth=4
set statusline=%<%h%r\ %f\ %m%=\ %y\ %l,%c\ %P

" Netrw (directory browser)
let g:netrw_home = '$HOME/.netrw'
let g:netrw_dirhistmax = 0		" No recently-visited directory history
let g:netrw_liststyle = 3		" Tree view
let g:netrw_browse_split = 4	" Open file in a new tab
let g:netrw_winsize = 25		" Netrw takes 20% of window size
let g:netrw_altv = 1			" Open new window on right side
let g:netrw_mousemaps = 0		" Disable mouse

" Change colorscheme
set t_Co=256
"set termguicolors
colorscheme colors-wal

"
" Mappings
"
map <C-x> Vexplore

"
" Plugins list
"

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes to load plugins from url

" Tagbar is a menu for ctags
Plug 'majutsushi/tagbar'

" Distraction-free plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Conversion between markup formats using pandoc
Plug 'vim-pandoc/vim-pandoc'

" Syntax checkers
Plug 'scrooloose/syntastic'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Sublime-like multiple selections
Plug 'terryma/vim-multiple-cursors'

" Completion plugin
Plug 'chun-yang/auto-pairs'

" Initialize plugin system
call plug#end()

"
" Plugins configuration
"

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
