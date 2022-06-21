" This is a 256 color colorscheme.
" Maintainer:   Bastien Chapusot
" Last Change:  Jan, 2022

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "white"

hi Normal       ctermfg=7
hi ErrorMsg     ctermfg=white       ctermbg=52         cterm=bold
hi Visual       ctermfg=black ctermbg=white
hi VisualNOS    cterm=reverse
hi Search       ctermfg=8          ctermbg=136        cterm=bold
hi IncSearch    ctermfg=8          ctermbg=136

hi Cursor       ctermfg=12 cterm=reverse
hi CursorLine   cterm=bold
hi CursorLineNr ctermfg=8
hi CursorColumn cterm=bold

hi TabLine      ctermfg=15     ctermbg=8
hi TabLineSel   ctermfg=8     ctermbg=15
hi TabLineFill  ctermfg=0      

hi SpecialKey   ctermfg=8
hi Directory    ctermfg=58        cterm=none
hi Title        ctermfg=7        cterm=bold
hi WarningMsg   ctermfg=white     cterm=bold
hi WildMenu     ctermfg=yellow    ctermbg=white       cterm=none
hi ModeMsg      ctermfg=124       cterm=none
hi MoreMsg      ctermfg=124
hi Question     ctermfg=green     cterm=none
hi NonText      ctermfg=8
hi MatchParen   ctermfg=white     ctermbg=52

hi Pmenu        ctermfg=white        ctermbg=7
hi PmenuSel     ctermfg=7       ctermbg=white

hi StatusLine   ctermfg=white     cterm=none
hi StatusLineNC ctermfg=white     ctermbg=black    cterm=none
hi VertSplit    ctermfg=white     ctermbg=black    cterm=none

hi Folded       ctermfg=94    ctermbg=white cterm=bold
hi FoldColumn   ctermfg=64    ctermbg=white cterm=bold
hi LineNr       ctermfg=8

hi DiffAdd      ctermbg=34    cterm=none
hi DiffChange   ctermfg=white ctermbg=94   cterm=none
hi DiffDelete   ctermfg=124
hi DiffText     ctermfg=white    ctermbg=8  cterm=bold
hi diffAdded    ctermfg=34
hi diffRemoved  ctermfg=8

hi Comment      ctermfg=15 cterm=bold

hi Constant     ctermfg=white cterm=bold
hi String       ctermfg=white
hi Character    ctermfg=white
hi Number       ctermfg=white
" hi Boolean
hi Float				ctermfg=white

hi Identifier   ctermfg=white cterm=none
hi Function     ctermfg=white cterm=italic

hi Special      ctermfg=white
" hi SpecialChar
" hi Tag
" hi Delimiter
" hi SpecialComment
hi Debug        ctermfg=white   ctermbg=22      cterm=bold

hi Statement    cterm=bold ctermfg=white
" hi Conditional
" hi Repeat
" hi Label
" hi Operator
" hi Keyword
hi Exception    ctermfg=white   ctermbg=52

hi PreProc      ctermfg=white
" hi Include
" hi Define
" hi Macro
" hi PreCondit

hi Type         ctermfg=white   cterm=none
" hi StorageClass
" hi Structure
" hi Typedef

hi Underlined   ctermfg=8      cterm=underline

hi Ignore       ctermfg=white

hi Error        ctermfg=white  ctermbg=52   cterm=bold

hi Todo         ctermfg=white  ctermbg=130  cterm=bold
