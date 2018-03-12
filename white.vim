" This is a 256 color colorscheme.
" Maintainer:   TheWatermelon
" Last Change:  March, 07 2018

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "white"

hi Normal       ctermfg=7
hi ErrorMsg     ctermfg=white       ctermbg=52         cterm=bold
hi Visual       ctermbg=black       cterm=reverse
hi VisualNOS    ctermbg=black       cterm=reverse
hi Search       ctermfg=8          ctermbg=136        cterm=bold
hi IncSearch    ctermfg=8          ctermbg=136

hi CursorLine   cterm=bold
hi CursorColumn cterm=bold

hi TabLine      ctermfg=15     ctermbg=8
hi TabLineSel   ctermfg=0     ctermbg=15
hi TabLineFill  ctermfg=8      

hi SpecialKey   ctermfg=8
hi Directory    ctermfg=58        cterm=none
hi Title        ctermfg=7        cterm=bold
hi WarningMsg   ctermfg=red
hi WildMenu     ctermfg=yellow    ctermbg=black       cterm=none
hi ModeMsg      ctermfg=124       cterm=none
hi MoreMsg      ctermfg=124
hi Question     ctermfg=green     cterm=none
hi NonText      ctermfg=darkred
hi MatchParen   ctermfg=white     ctermbg=52

hi Pmenu        ctermfg=7        ctermbg=172
hi PmenuSel     ctermfg=172       ctermbg=7

hi StatusLine   ctermfg=white     ctermbg=8    cterm=none
hi StatusLineNC ctermfg=black     ctermbg=black    cterm=none
hi VertSplit    ctermfg=black     ctermbg=black    cterm=none

hi Folded       ctermfg=94    ctermbg=black cterm=bold
hi FoldColumn   ctermfg=64    ctermbg=black cterm=bold
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=8    ctermbg=172   cterm=bold

hi DiffAdd      ctermbg=34    cterm=none
hi DiffChange   ctermfg=black ctermbg=94   cterm=none
hi DiffDelete   ctermfg=124
hi DiffText     ctermfg=white    ctermbg=8  cterm=bold
hi diffAdded    ctermfg=34
hi diffRemoved  ctermfg=124

hi Cursor       ctermfg=black ctermbg=8

hi Comment      ctermfg=229

hi Constant     ctermfg=white cterm=bold
hi String       ctermfg=white cterm=bold
hi Character    ctermfg=7
hi Number	ctermfg=white cterm=bold
" hi Boolean
" hi Float

hi Identifier   ctermfg=white      cterm=none
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

hi Underlined   ctermfg=8    cterm=underline

hi Ignore       ctermfg=black

hi Error        ctermfg=white  ctermbg=52   cterm=bold

hi Todo         ctermfg=white  ctermbg=130  cterm=bold
