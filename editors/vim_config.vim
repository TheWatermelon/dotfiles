" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" highlight tabs
set list
set listchars=tab:\|\ 

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd             " Show (partial) command in status line.
"set showmatch           " Show matching brackets.
set ignorecase           " Do case insensitive matching
"set smartcase           " Do smart case matching
set incsearch            " Incremental search
set autowrite            " Automatically save before commands like :next and :make
"set hidden              " Hide buffers when they are abandoned
set mouse=a              " Enable mouse usage (all modes)
set smartindent          " Auto indentation for C and C++
set number               " Show line number in the first column
"set foldmethod=indent   " Set fold method to indentation
set noexpandtab
set tabstop=2
set shiftwidth=2
"set statusline=%<%h%r\ %f\ %m%=\ %y\ %l,%c\ %P
set laststatus=2         " Always show status bar
set statusline=
"set statusline+=%m\
set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%#Comment#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" Change colorscheme
set t_Co=256
"set termguicolors
colorscheme white

" Netrw (directory browser)
let g:netrw_home = '$HOME/.netrw'
let g:netrw_dirhistmax = 0		" No recently-visited directory history
let g:netrw_liststyle = 3		" Tree view
let g:netrw_browse_split = 4	" Open file in a new tab
let g:netrw_winsize = 25		" Netrw takes 20% of window size
let g:netrw_altv = 1			" Open new window on right side
let g:netrw_mousemaps = 0		" Disable mouse


" Antlr 3 and 4 hightlight support
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call pathogen#infect()

map <C-x> :Vexplore <Esc>

" Set tmux title from vim current file
"autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
