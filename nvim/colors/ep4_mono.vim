highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

set background=dark

" Comment
highlight Comment guifg=#61c277
" Bg and fg
highlight Normal guibg=#121212 guifg=#d0d0d0 
" #a6a4a4 - if d0d0d0 too bright.
" #d0d0d0 more light
" #b6b6b6 - gray, if too bright.

" Constant
highlight Constant guifg=#d0d0d0 gui=NONE
highlight String guifg=#d0d0d0
highlight Character guifg=#d0d0d0
highlight Number guifg=#d0d0d0
highlight Boolean guifg=#d0d0d0
highlight Float guifg=#d0d0d0

" Identifier
highlight Identifier guifg=#d0d0d0
highlight Function guifg=#d0d0d0

" Statemant
highlight Statement guifg=#d0d0d0 gui=NONE
highlight Conditional guifg=#d0d0d0 gui=NONE
highlight Repeat guifg=#d0d0d0 gui=NONE
highlight Label guifg=#d0d0d0 gui=NONE
highlight Operator guifg=#d0d0d0 gui=NONE
highlight Keyword guifg=#d0d0d0 gui=NONE
highlight Exception guifg=d0d0d0 gui=NONE

" PreProc
highlight PreProc guifg=#edba32 gui=NONE
highlight Define guifg=#edba32 
highlight Macro guifg=#edba32 
highlight PreCondit guifg=#edba32 
highlight Include guifg=#edba32 

" Type
"highlight Type guifg=#56A69C gui=NONE
"highlight StorageClass guifg=#56A69C
"highlight Structure guifg=#56A69C
"highlight Typedef guifg=#56A69C

"Special
highlight Special guifg=#d0d0d0 gui=NONE
highlight SpecialChar guifg=#d0d0d0
highlight Tag guifg=#d0d0d0
highlight Delimiter guifg=#d0d0d0
highlight SpecialComment guifg=#d0d0d0
highlight Debug guifg=#d0d0d0

" Else stuff
highlight Todo guifg=#61c277 guibg=#121212  gui=underline

" UI
if has("nvim") 
    highlight StatusLine guibg=#3b3a3a guifg=#d0d0d0
    highlight StatusLineNC guibg=#3b3a3a guifg=#d0d0d0
else 
    highlight StatusLine guibg=#d0d0d0 guifg=#313131
    highlight StatusLineNC guibg=#d0d0d0 guifg=#313131
endif

highligh WinSeparator guifg=#121212 guibg=#121212 
highlight VertSplit guifg=#121212 guibg=#121212 
highlight LineNr guifg=#121212
highlight NonText guifg=#121212
highlight IncSearch guibg=#E4E4EF guibg=#49483E 
hi Search guibg=#49483E guifg=#E4E4EF

highlight PMenu guibg=#49483E guifg=#121212
highlight PMenuSel guibg=#75BF3F guifg=#121212

highlight Visual guifg=NONE guibg=#a6a4a4
highligh MatchParen guifg=#d0d0d0 guibg=#121212 

highlight cursor guifg=#121212 guibg=#52a866
set guicursor=a:block-Cursor
set guicursor+=i:ver25-Cursor
set guicursor+=t:ver25-Cursor
set guicursor+=i:blinkwait10
set guicursor+=a:blinkon0

highlight Variable guifg=#121212 gui=NONE

highlight link @lsp.type.variable.cpp Variable
highlight link @lsp.type.parameter.cpp Variable
highlight link @lsp.type.macro.cpp Macro

highlight link @function Function
highlight link @keyword Statement
highlight link @type Type
highlight link @string String
highlight link @comment Comment
highlight link @constant Constant
