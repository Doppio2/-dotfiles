highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

set background=dark

" Comment
highlight Comment guifg=#7D7D7D
" Bg and fg
highlight Normal guibg=#0d0d0d guifg=#bfae9f

" Constant
highlight Constant guifg=#d6d6d6 gui=NONE
highlight String guifg=#d6d6d6 
highlight Character guifg=#d6d6d6 
highlight Number guifg=#d6d6d6 
highlight Boolean guifg=#d6d6d6 
highlight Float guifg=#d6d6d6 

" Identifier
highlight Identifier guifg=#69c27d
highlight Function guifg=#69c27d

" Statemant
highlight Statement guifg=#de4040 gui=NONE
highlight Conditional guifg=#de4040 
highlight Repeat guifg=#de4040 
highlight Label guifg=#de4040 
highlight Operator guifg=#de4040 
highlight Keyword guifg=#de4040 
highlight Exception guifg=#de4040 

" PreProc
highlight PreProc guifg=#e3be5b gui=NONE
highlight Define guifg=#e3be5b 
highlight Macro guifg=#e3be5b 
highlight PreCondit guifg=#e3be5b 
highlight Include guifg=#e3be5b 

" Type
highlight Type guifg=#4dbdaf gui=NONE
highlight StorageClass guifg=#4dbdaf 
highlight Structure guifg=#4dbdaf 
highlight Typedef guifg=#4dbdaf 

"Special
highlight Special guifg=#bfae9f gui=NONE
highlight SpecialChar guifg=#bfae9f
highlight Tag guifg=#bfae9f
highlight Delimiter guifg=#bfae9f
highlight SpecialComment guifg=#bfae9f
highlight Debug guifg=#bfae9f

" Else stuff
highlight Todo guifg=#7D7D7D guibg=#0d0d0d gui=underline

" UI
if has("nvim") 
    highlight StatusLine guibg=#1d1d1d guifg=#bfae9f 
    highlight StatusLineNC guibg=#1d1d1d guifg=#bfae9f 
else 
    highlight StatusLine guibg=#bfae9f guifg=#313131
    highlight StatusLineNC guibg=#bfae9f guifg=#313131
endif

highligh WinSeparator guifg=#0d0d0d guibg=#0d0d0d 
highlight VertSplit guifg=#0d0d0d guibg=#0d0d0d 
highlight LineNr guifg=#bfae9f
highlight NonText guifg=#bfae9f
highlight IncSearch guibg=#E4E4EF guibg=#49483E
hi Search guibg=#49483E guifg=#E4E4EF

highlight PMenu guibg=#49483E guifg=#bfae9f
highlight PMenuSel guibg=#75BF3F guifg=#bfae9f

highlight Visual guifg=NONE guibg=#49483E 
highligh MatchParen guifg=#de4040 guibg=#0d0d0d 

highlight Cursor guifg=#49483E guibg=#38c758
highlight iCursor guifg=#49483E guibg=#D95B5B
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-Cursor
set guicursor+=t:ver25-Cursor
set guicursor+=i:blinkwait10
set guicursor+=a:blinkon0

highlight Variable guifg=#bfae9f gui=NONE

highlight link @lsp.type.variable.cpp Variable
highlight link @lsp.type.parameter.cpp Variable
highlight link @lsp.type.macro.cpp Macro

highlight link @function Function
highlight link @keyword Statement
highlight link @type Type
highlight link @string String
highlight link @comment Comment
highlight link @constant Constant
