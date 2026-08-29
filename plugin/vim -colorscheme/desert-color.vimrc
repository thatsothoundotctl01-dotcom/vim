" Vim/Neovim color file
" Original:   desert.vim by Hans Fugal <hans@fugal.net> (2003)
" Upgrade:    true-color (guifg/guibg + matching cterm), Neovim Treesitter,
"             LSP semantic tokens, Diagnostics, Pmenu/CursorLine/StatusLine
"             and other groups that didn't exist in the 2003 original.
" Notes:      Palette intentionally kept close to the original desert look
"             (grey20 background, khaki/indianred/skyblue accents).

set background=dark

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "desert"

" Enable true color when the terminal supports it (safe no-op otherwise)
if has('termguicolors')
  set termguicolors
endif

" ---------------------------------------------------------------------------
" Core editor groups
" ---------------------------------------------------------------------------
hi Normal       guifg=White      guibg=grey20    ctermfg=White   ctermbg=232
hi Cursor       guibg=indianred  guifg=khaki
hi CursorLine   guibg=grey25                     cterm=NONE      ctermbg=235
hi CursorColumn guibg=grey25                     cterm=NONE      ctermbg=235
hi ColorColumn  guibg=grey25                                     ctermbg=235
hi LineNr       guifg=grey50     guibg=grey20    ctermfg=244
hi CursorLineNr guifg=khaki      guibg=grey25    gui=bold  ctermfg=222  cterm=bold
hi VertSplit    guibg=#c2bfa5    guifg=grey50    gui=none  ctermfg=250  cterm=reverse
hi Folded       guibg=grey30     guifg=gold      ctermfg=220  ctermbg=NONE
hi FoldColumn   guibg=grey30     guifg=tan       ctermfg=180  ctermbg=NONE
hi IncSearch    guifg=slategrey  guibg=khaki     ctermfg=yellow  ctermbg=green
hi ModeMsg      guifg=goldenrod                  ctermfg=136
hi MoreMsg      guifg=SeaGreen                   ctermfg=2
hi NonText      guifg=LightBlue  guibg=grey30    cterm=bold  ctermfg=blue
hi Question     guifg=springgreen                ctermfg=2
hi Search       guibg=grey30     guifg=#dfffdf   ctermfg=grey  ctermbg=blue
hi SpecialKey   guifg=yellowgreen                ctermfg=darkgreen
hi StatusLine   guibg=#c2bfa5    guifg=black     gui=none  cterm=bold,reverse
hi StatusLineNC guibg=#c2bfa5    guifg=grey50    gui=none  cterm=reverse
hi Title        guifg=indianred                  ctermfg=5
hi Visual       gui=none  guifg=khaki  guibg=olivedrab  cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg   guifg=salmon                     ctermfg=1
hi MatchParen   guibg=grey30     guifg=#dfffdf
hi Directory    guifg=SkyBlue                    ctermfg=darkcyan
hi ErrorMsg     guifg=White      guibg=firebrick  cterm=bold  ctermfg=7  ctermbg=1
hi WildMenu     guifg=black      guibg=khaki      ctermfg=0  ctermbg=3
hi Ignore       guifg=grey40                      cterm=bold  ctermfg=7

" Diff
hi DiffAdd      guibg=#264d26                    ctermbg=4
hi DiffChange   guibg=#4d4526                    ctermbg=5
hi DiffDelete   guifg=grey20  guibg=#4d2626  cterm=bold  ctermfg=4  ctermbg=6
hi DiffText     guibg=#6d3030  gui=bold  cterm=bold  ctermbg=1

" Popup menu (completion) — did not exist as a themeable group in 2003
hi Pmenu        guifg=White  guibg=grey30
hi PmenuSel     guifg=black  guibg=khaki  gui=bold
hi PmenuSbar    guibg=grey40
hi PmenuThumb   guibg=grey60

" Tabline
hi TabLine      guifg=grey60  guibg=grey30  gui=none
hi TabLineSel   guifg=White   guibg=grey20  gui=bold
hi TabLineFill  guibg=grey30

" ---------------------------------------------------------------------------
" Syntax highlighting groups
" ---------------------------------------------------------------------------
hi Comment      guifg=SkyBlue                    ctermfg=darkcyan
hi Constant     guifg=#ffa0a0                    ctermfg=brown
hi Identifier   guifg=palegreen                  ctermfg=6
hi Statement    guifg=khaki      gui=bold         ctermfg=3
hi PreProc      guifg=indianred                  ctermfg=5
hi Type         guifg=darkkhaki                  ctermfg=2
hi Special      guifg=navajowhite                ctermfg=5
hi Underlined   gui=underline    guifg=indianred  cterm=underline  ctermfg=5
hi Todo         guifg=orangered  guibg=yellow2    ctermfg=red      ctermbg=NONE
hi Error        guifg=White      guibg=firebrick  cterm=bold  ctermfg=7  ctermbg=1

" ---------------------------------------------------------------------------
" Neovim Treesitter groups (fall back gracefully to legacy groups above)
" ---------------------------------------------------------------------------
if has('nvim')
  hi link @variable          Identifier
  hi link @variable.builtin  Special
  hi link @function          Statement
  hi link @function.builtin  Special
  hi link @function.call     Statement
  hi link @keyword           Statement
  hi link @keyword.function  Statement
  hi link @keyword.return    Statement
  hi link @conditional       Statement
  hi link @repeat            Statement
  hi link @string            Constant
  hi link @string.escape     Special
  hi link @number            Constant
  hi link @boolean           Constant
  hi link @constant          Constant
  hi link @constant.builtin  Special
  hi link @type               Type
  hi link @type.builtin       Type
  hi link @property           Identifier
  hi link @field               Identifier
  hi link @parameter           Identifier
  hi link @comment            Comment
  hi link @punctuation.bracket   Special
  hi link @punctuation.delimiter Special
  hi link @operator             Special
  hi link @tag                  PreProc
  hi link @tag.attribute        Type
  hi link @tag.delimiter        Special

  " LSP semantic tokens (Neovim 0.9+)
  hi link @lsp.type.class      Type
  hi link @lsp.type.function   Statement
  hi link @lsp.type.variable   Identifier
  hi link @lsp.type.parameter  Identifier
  hi link @lsp.type.property   Identifier
  hi link @lsp.type.comment    Comment

  " Diagnostics — did not exist in 2003, essential in a modern LSP setup
  hi DiagnosticError guifg=#ff8080  ctermfg=1
  hi DiagnosticWarn  guifg=gold     ctermfg=3
  hi DiagnosticInfo  guifg=SkyBlue  ctermfg=6
  hi DiagnosticHint  guifg=palegreen ctermfg=2
  hi DiagnosticUnderlineError gui=underline guisp=#ff8080 cterm=underline
  hi DiagnosticUnderlineWarn  gui=underline guisp=gold     cterm=underline
  hi DiagnosticUnderlineInfo  gui=underline guisp=SkyBlue  cterm=underline
  hi DiagnosticUnderlineHint  gui=underline guisp=palegreen cterm=underline

  " GitSigns / gutter VCS markers (common modern plugin convention)
  hi link GitSignsAdd    DiffAdd
  hi link GitSignsChange DiffChange
  hi link GitSignsDelete DiffDelete
endif

" vim: sw=2 et
# desert updat 
