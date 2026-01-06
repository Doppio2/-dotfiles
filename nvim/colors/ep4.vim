highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

set background=dark

" Comment
highlight Comment guifg=#7D7D7D
" Bg and fg
highlight Normal guibg=#181818 guifg=#a6978a

" Constant
highlight Constant guifg=#BFBFBF gui=NONE
highlight String guifg=#BFBFBF
highlight Character guifg=#BFBFBF
highlight Number guifg=#BFBFBF
highlight Boolean guifg=#BFBFBF
highlight Float guifg=#BFBFBF

" Identifier
highlight Identifier guifg=#60B373
highlight Function guifg=#60B373

" Statemant
highlight Statement guifg=#d95b5b gui=NONE
highlight Conditional guifg=#d95b5b
highlight Repeat guifg=#d95b5b     
highlight Label guifg=#d95b5b      
highlight Operator guifg=#d95b5b   
highlight Keyword guifg=#d95b5b    
highlight Exception guifg=#d95b5b  

" PreProc
highlight PreProc guifg=#D8A51D gui=NONE
highlight Define guifg=#D8A51D
highlight Macro guifg=#D8A51D
highlight PreCondit guifg=#D8A51D
highlight Include guifg=#D8A51D

" Type
highlight Type guifg=#56A69C gui=NONE
highlight StorageClass guifg=#56A69C
highlight Structure guifg=#56A69C
highlight Typedef guifg=#56A69C

"Special
highlight Special guifg=#a6978a gui=NONE
highlight SpecialChar guifg=#a6978a
highlight Tag guifg=#a6978a
highlight Delimiter guifg=#a6978a
highlight SpecialComment guifg=#a6978a
highlight Debug guifg=#a6978a

" Else stuff
highlight Todo guifg=#75BF3F guibg=#181818 

" UI
if has("nvim") 
    highlight StatusLine guibg=#313131 guifg=#a6978a 
    highlight StatusLineNC guibg=#313131 guifg=#a6978a 
else 
    highlight StatusLine guibg=#a6978a guifg=#313131
    highlight StatusLineNC guibg=#a6978a guifg=#313131
endif

highligh WinSeparator guifg=#181818 guibg=#181818 
highlight VertSplit guifg=#181818 guibg=#181818 
highlight LineNr guifg=#a6978a
highlight NonText guifg=#a6978a
highlight IncSearch guibg=#E4E4EF guibg=#49483E
hi Search guibg=#49483E guifg=#E4E4EF

highlight PMenu guibg=#49483E guifg=#a6978a
highlight PMenuSel guibg=#75BF3F guifg=#a6978a

highlight Visual guifg=NONE guibg=#49483E 
highligh MatchParen guifg=#D95B5B guibg=#181818 

highlight Cursor guifg=#49483E guibg=#75BF3F 
highlight iCursor guifg=#49483E guibg=#D95B5B
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-Cursor
set guicursor+=v:hor25-Cursor
set guicursor+=i:blinkwait10
set guicursor+=a:blinkon0

highlight Variable guifg=#a6978a gui=NONE

highlight link @lsp.type.variable.cpp Variable
highlight link @lsp.type.parameter.cpp Variable
highlight link @lsp.type.macro.cpp Macro

highlight link @function Function
highlight link @keyword Statement
highlight link @type Type
highlight link @string String
highlight link @comment Comment
highlight link @constant Constant
