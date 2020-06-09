" This is a 256 color colorscheme.
" Maintainer:   Bastien Chapusot
" Last Change:  June, 9 2020

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

hi CursorLine   cterm=bold
hi CursorColumn cterm=bold

hi TabLine      ctermfg=15     ctermbg=8
hi TabLineSel   ctermfg=8     ctermbg=15
hi TabLineFill  ctermfg=8      

hi SpecialKey   ctermfg=8
hi Directory    ctermfg=58        cterm=none
hi Title        ctermfg=7        cterm=bold
hi WarningMsg   ctermfg=red
hi WildMenu     ctermfg=yellow    ctermbg=white       cterm=none
hi ModeMsg      ctermfg=124       cterm=none
hi MoreMsg      ctermfg=124
hi Question     ctermfg=green     cterm=none
hi NonText      ctermfg=darkred
hi MatchParen   ctermfg=white     ctermbg=52

hi Pmenu        ctermfg=white        ctermbg=7
hi PmenuSel     ctermfg=7       ctermbg=white

hi StatusLine   ctermfg=white     ctermbg=8    cterm=none
hi StatusLineNC ctermfg=white     ctermbg=black    cterm=none
hi VertSplit    ctermfg=white     ctermbg=black    cterm=none

hi Folded       ctermfg=94    ctermbg=white cterm=bold
hi FoldColumn   ctermfg=64    ctermbg=white cterm=bold
hi LineNr       ctermfg=5
hi CursorLineNr ctermfg=13

hi DiffAdd      ctermbg=34    cterm=none
hi DiffChange   ctermfg=white ctermbg=94   cterm=none
hi DiffDelete   ctermfg=124
hi DiffText     ctermfg=white    ctermbg=8  cterm=bold
hi diffAdded    ctermfg=34
hi diffRemoved  ctermfg=124

hi Cursor       ctermfg=12 ctermbg=black

hi Comment      ctermfg=4

hi Constant     ctermfg=white cterm=bold
hi String       ctermfg=1 
hi Character    ctermfg=5
hi Number       ctermfg=6 
" hi Boolean
hi Float				ctermfg=6

hi Identifier   ctermfg=white cterm=none
hi Function     ctermfg=white

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
