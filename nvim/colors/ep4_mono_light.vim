highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

set background=light

" Comment
highlight Comment guifg=#366b42
" Bg and fg
highlight Normal guibg=#d0d0d0 guifg=#121212
" #a6a4a4 - if d0d0d0 too bright.
" #d0d0d0 more light
" #b6b6b6 - gray, if too bright.

" Constant
highlight Constant guifg=#121212 gui=NONE
highlight String guifg=#121212
highlight Character guifg=#121212
highlight Number guifg=#121212
highlight Boolean guifg=#121212
highlight Float guifg=#121212

" Identifier
highlight Identifier guifg=#121212
highlight Function guifg=#121212

" Statemant
highlight Statement guifg=#121212 gui=bold
highlight Conditional guifg=#12121 gui=bold
highlight Repeat guifg=#12121 gui=bold
highlight Label guifg=#12121 gui=bold
highlight Operator guifg=#12121 gui=bold
highlight Keyword guifg=#12121 gui=bold
highlight Exception guifg=#12121 gui=bold

" PreProc
highlight PreProc guifg=#997517 gui=NONE
highlight Define guifg=#997517 
highlight Macro guifg=#997517 
highlight PreCondit guifg=#997517 
highlight Include guifg=#997517 

" Type
"highlight Type guifg=#56A69C gui=NONE
"highlight StorageClass guifg=#56A69C
"highlight Structure guifg=#56A69C
"highlight Typedef guifg=#56A69C

"Special
highlight Special guifg=#121212 gui=NONE
highlight SpecialChar guifg=#121212
highlight Tag guifg=#121212
highlight Delimiter guifg=#121212
highlight SpecialComment guifg=#121212
highlight Debug guifg=#121212

" Else stuff
highlight Todo guifg=#366b42 guibg=#d0d0d0  gui=underline

" UI
if has("nvim") 
    highlight StatusLine guibg=#9e9b9b guifg=#121212 
    highlight StatusLineNC guibg=#9e9b9b guifg=#121212 
else 
    highlight StatusLine guibg=#121212 guifg=#313131
    highlight StatusLineNC guibg=#121212 guifg=#313131
endif

highligh WinSeparator guifg=#d0d0d0 guibg=#d0d0d0 
highlight VertSplit guifg=#d0d0d0 guibg=#d0d0d0 
highlight LineNr guifg=#121212
highlight NonText guifg=#121212
highlight IncSearch guibg=#E4E4EF guibg=#49483E 
hi Search guibg=#49483E guifg=#E4E4EF

highlight PMenu guibg=#49483E guifg=#121212
highlight PMenuSel guibg=#75BF3F guifg=#121212

highlight Visual guifg=NONE guibg=#a6a4a4
highligh MatchParen guifg=#121212 guibg=#d0d0d0 

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
