" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

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

"
" Completion plugins
"
Plug 'chun-yang/auto-pairs'

" Initialize plugin system
call plug#end()

"
" Plugins configuration
"

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
