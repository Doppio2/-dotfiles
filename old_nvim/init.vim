"For plugins decomment this and create folder.
"set runtimepath+=/.vim/plugin/

syntax on

set nobackup		" do not keep a backup file
set nowritebackup
set autoindent		" always set autoindenting on
set smartindent     
set autoread		" Load changed files without alerting us all the time
set hlsearch
set incsearch
set noswapfile
set ruler

set switchbuf+=uselast

filetype plugin indent on

if has('mouse')
    set mouse=a
endif

set expandtab
set nosmarttab
set tabstop=4
set shiftwidth=4
set nowrap
set splitbelow
set splitright
set scrolloff=5 	 " Scroll vertially before hitting the edges of the window
set sidescrolloff=10 " Scroll horizontally before hitting the edges of the window
set ignorecase		 " Make search case-insensitive by default
set wildmenu
set wildmode=longest,list:full
set wildignorecase

" Works under ru
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set backspace=indent,eol,start

" Speed up
set ttyfast

language en_US

" Write files before many operations
"set autowrite
" … but keep the undo buffer when we switch files, otherwise autowrite can
" cause some nasty data loss
set hidden

set background=dark
set termguicolors
colorscheme ep4

" UI stuff.
set laststatus=1

" font
if exists("g:neovide")
    set guifont=Liberation\ Mono:h12.5
elseif has("win32")
    set guifont=Liberation\ Mono:11
elseif has("unix")
    set guifont=Liberation\ Mono\ 15
endif

" Disable leader timeout
set notimeout
set ttimeout

" File searche like in emacs
set autochdir

" File search
" nnoremap f :e 
" nnoremap m :b 
nnoremap t :Ex<CR>

set clipboard^=unnamed,unnamedplus

" Key Bindins

" Old
" inoremap <C-j> <Esc>
" cnoremap <C-j> <Esc>
" vnoremap <C-j> <Esc>
" snoremap <C-j> <Esc>
" onoremap <C-j> <Esc>

"For terminal mode
tnoremap <Esc> <C-\><C-n>

" Page up, page down.
nnoremap f <C-f>
nnoremap m <C-b>
vnoremap f <C-f>
vnoremap m <C-b>

" Visual block mode.
nnoremap , <C-v>
vnoremap , <C-v>

" Bindings for window's
nnoremap q <C-w>w
vnoremap q <C-w>w
nnoremap <M-2> :vsplit<CR>
nnoremap <M-1> <C-w>o

" Bindings for tabs.
nnoremap <M-e> gt

" Save buffers
nnoremap <M-s> :w<CR>
inoremap <M-s> <c-o>:w<cr>

" Bindings for search in file's
nnoremap <M-/> :noh<CR>

" Bindings for buffers
nnoremap <M-k> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <M-q> :b#<CR>
"nnoremap , :bp<CR>
"nnoremap . :bn<CR>

" NERDTree settings
""nnoremap <M-e> :NERDTreeFocus<CR>

" Autoread file with external changes
autocmd FocusGained * silent! checktime

" Disable useless macros recording.
let g:no_record_macros = 1

" Keys in insert mode.
inoremap <M-d> <Del>
inoremap <M-/> <C-n>
inoremap <C-z> <c-o><z-z>

" Disable auto comments.
autocmd FileType * set formatoptions-=ro

"disable search message
set shortmess-=S

" Neovide settings.
let g:neovide_cursor_trail_size = 0.0
let g:neovide_cursor_animation_length = 0.0
nnoremap <F11> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>

function! OpenQuickfixHere() abort
  copen
  let bufn = bufnr('%')
  let winn = winnr()
  wincmd p
  execute 'b'.bufn
  execute winn.'close'
endfunction

" Grep settigs.
map <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<CR>
map <F2> :execute "vimgrep /" . input("Grep: ") . "/gj **/*" <Bar> call OpenQuickfixHere()<CR>

" File Browsing settings
"let g:netrw_banner=0

" Gvim settings.
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=L  "disable creating scrollbar when spliting.
set belloff=all

"Language settings.
autocmd FileType html setlocal tabstop=2|setlocal shiftwidth=2

" Sometimes parentheses makes vim slow.
let g:loaded_matchparen=1
let c_no_curly_error=1
