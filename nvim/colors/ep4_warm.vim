let g:colors_name = "ep4_orange_amber_cursor"
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
highlight Constant guifg=#a8ce8d gui=NONE
highlight String guifg=#a8ce8d 
highlight Character guifg=#a8ce8d 
highlight Number guifg=#a8ce8d 
highlight Boolean guifg=#a8ce8d 
highlight Float guifg=#a8ce8d 

" Identifier
highlight Identifier guifg=#60B373
highlight Function guifg=#60B373

" Statemant
highlight Statement guifg=#d15030 gui=NONE
highlight Conditional guifg=#d15030 
highlight Repeat guifg=#d15030 
highlight Label guifg=#d15030 
highlight Operator guifg=#d15030 
highlight Keyword guifg=#d15030 
highlight Exception guifg=#d15030 

" PreProc
highlight PreProc guifg=#BFBFBF gui=NONE
highlight Define guifg=#BFBFBF 
highlight Macro guifg=#BFBFBF 
highlight PreCondit guifg=#BFBFBF 
highlight Include guifg=#BFBFBF 

" Type
highlight Type guifg=#e0a85f gui=NONE
highlight StorageClass guifg=#e0a85f
highlight Structure guifg=#e0a85f
highlight Typedef guifg=#e0a85f

"Special
highlight Special guifg=#a6978a gui=NONE
highlight SpecialChar guifg=#a6978a
highlight Tag guifg=#a6978a
highlight Delimiter guifg=#a6978a
highlight SpecialComment guifg=#a6978a
highlight Debug guifg=#a6978a

" Else stuff
highlight Todo guifg=#7D7D7D guibg=#181818 gui=underline

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
highligh MatchParen guifg=#ffb454 guibg=#181818 
highlight Cursor guifg=#18181c guibg=#ffb454 gui=NONE
highlight iCursor guifg=#18181c guibg=#ffb454 gui=NONE
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-Cursor
set guicursor+=t:ver25-Cursor
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
