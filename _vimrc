set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMATTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spaces instead of \t
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4 

" auto insert \n after 80 characters 
set lbr
set tw=80

set autoindent
set smartindent 

set wrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FONT 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark

" colorscheme blue
colorscheme spring-pastels

" show matching braces / brackets
set showmatch
set mat=2

if has("gui_running")
	set guifont=Hack:h10:cANSI
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE MANAGEMENT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn file backups off
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISCELANEOUS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically delete buffers to closed windows
set nohidden
" show line numbers
set number 

" menu for command completion
set wildmenu
set wildmode=list:longest,full

" auto update file when editted in other program
set autoread

" remmeber up to 700 line
set history=700

" enable filetype plugins
filetype plugin on
filetype indent on

" always show status line
set laststatus=2 

" equal size vertical and horizontal splits
set equalalways

" change vim's directory to directory of file on startup
" autocmd VimEnter * lcd %:p:h

" disable automatic comments on return, but not on 'o' or auto-wrap
autocmd BufRead * set formatoptions-=r


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SOUND
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set novisualbell
set noeb vb t_vb=
set vb t_vb=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LAYOUT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set default size
if has("gui_running")
    set lines=50 columns=175
endif

" remove clutter from gui 
if has("gui_running")
    set guioptions-=m 
    set guioptions-=M
    set guioptions-=t
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
endif

" make vsplit to right of opened file
" only after entire Vim initialization
autocmd VimEnter * :rightbelow vnew
"move cursor to right window after startup
autocmd VimEnter * :wincmd h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd
set cmdheight=1 
set ruler
au VimEnter * hi StatusLine guibg=#0078d7 guifg=white
au InsertEnter * hi StatusLine guibg=white guifg=black
au InsertLeave * hi StatusLine guibg=#0078d7 guifg=white


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fix ctrl-backspace
inoremap <C-BS> <C-\><C-o>db

"proper ctrl-del
nnoremap <C-Del> dw
inoremap <silent><C-Del> <ESC>dw

" enable pro mode
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" leader 
let mapleader = ";" 
let g:mapleader = ";"

" TODO(rayalan): more leader stuff
map <leader>w :w<cr>    
map <leader>v :rightbelow vsplit<cr>
map <leader>s :rightbelow split<cr>
" map f5 = save, build, debug
" map (key) = save, build
map <F5> :call BuildMacro()<cr>
map <F10> :call DebugMacro()<cr>

" navigate between buffers with alt+direction
" would like to switch to using vim keys for nav all the time
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l

" resize buffers with alt+direction
" NOTE(rayalan): this was useful, but easier to just use mouse
"map <A-h> <C-w><
"map <A-j> <C-W>-
"map <A-k> <C-W>+
"map <A-l> <C-w>>

" move by words with shift+l/h 
" move by block with shift+j/k 
map L w
map H b
map J )
map K (

" remap [ ] to  home and endl
nmap [ 0
nmap ] $

" close current buffer 
map <leader>bd :bd!<cr>

" change vim directory to directory of current, print directory
map <leader>cd :lcd %:p:h<cr>:pwd<cr>

" leader _ search back for _ (useful for loop abbrevs)
" TODO(rayalan): should I make this replace _ with word 
" under cursor? 
" yes, this is useful
" fix this so it cuts from ')' to end of line and shorten
" commands to one normal mode :execute
" I think it's good to keep underscore just to be obvious
" about the keybinding
" <leader>_ might also handle inserting { }
map <leader>_ :call UnderscoreMacro()<cr>
map _ :call UnderscoreMacro()<cr>
"map <leader>/ :call CommentMacro()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO(rayalan): AUTO CORRECT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hopefully these work 
iabbrev TODO TODO(rayalan):
iabbrev todo TODO(rayalan):
iabbrev td TODO(rayalan):
iabbrev nt NOTE(rayalan):
iabbrev note NOTE(rayalan):
iabbrev NOTE NOTE(rayalan):


" TODO(rayalan): fix set of macros like these
"   and make them specific to c/c++ file types
"   add more for loop types 
"   add user types 
iabbrev fei for(int i = 0; i < _; i++)
iabbrev fej for(int j = 0; j < _; j++)
iabbrev fek for(int k = 0; k < _; k++)

iabbrev feiu16 for(u16 i = 0; i < _; i++)
iabbrev feju16 for(u16 j = 0; j < _; j++)
iabbrev feku16 for(u16 k = 0; k < _; k++)

iabbrev feiu32 for(u32 i = 0; i < _; i++)
iabbrev feju32 for(u32 j = 0; j < _; j++)
iabbrev feku32 for(u32 k = 0; k < _; k++)

iabbrev feiu64 for(u64 i = 0; i < _; i++)
iabbrev feju64 for(u64 j = 0; j < _; j++)
iabbrev feku64 for(u64 k = 0; k < _; k++)


iabbrev fei16 for(s16 i = 0; i < _; i++)
iabbrev fej16 for(s16 j = 0; j < _; j++)
iabbrev fek16 for(s16 k = 0; k < _; k++)
iabbrev feis16 for(s16 i = 0; i < _; i++)
iabbrev fejs16 for(s16 j = 0; j < _; j++)
iabbrev feks16 for(s16 k = 0; k < _; k++)

iabbrev fei32 for(s32 i = 0; i < _; i++)
iabbrev fej32 for(s32 j = 0; j < _; j++)
iabbrev fek32 for(s32 k = 0; k < _; k++)
iabbrev feis32 for(s32 i = 0; i < _; i++)
iabbrev fejs32 for(s32 j = 0; j < _; j++)
iabbrev feks32 for(s32 k = 0; k < _; k++)

iabbrev fei64 for(s64 i = 0; i < _; i++)
iabbrev fej64 for(s64 j = 0; j < _; j++)
iabbrev fek64 for(s64 k = 0; k < _; k++)
iabbrev feis64 for(s64 i = 0; i < _; i++)
iabbrev fejs64 for(s64 j = 0; j < _; j++)
iabbrev feks64 for(s64 k = 0; k < _; k++)


iabbrev fex for(int x = 0; x < _; x++)
iabbrev fey for(int y = 0; x < _; x++)
iabbrev fez for(int z = 0; x < _; x++)

iabbrev fexu16 for(u16 x = 0; x < _; x++)
iabbrev feyu16 for(u16 y = 0; x < _; x++)
iabbrev fezu16 for(u16 z = 0; x < _; x++)

iabbrev fexu32 for(u32 x = 0; x < _; x++)
iabbrev feyu32 for(u32 y = 0; x < _; x++)
iabbrev fezu32 for(u32 z = 0; x < _; x++)

iabbrev fexu64 for(u64 x = 0; x < _; x++)
iabbrev feyu64 for(u64 y = 0; x < _; x++)
iabbrev fezu64 for(u64 z = 0; x < _; x++)


iabbrev fex16 for(s16 x = 0; x < _; x++)
iabbrev fey16 for(s16 y = 0; x < _; x++)
iabbrev fez16 for(s16 z = 0; x < _; x++)
iabbrev fexs16 for(s16 x = 0; x < _; x++)
iabbrev feys16 for(s16 y = 0; x < _; x++)
iabbrev fezs16 for(s16 z = 0; x < _; x++)

iabbrev fex32 for(s32 x = 0; x < _; x++)
iabbrev fey32 for(s32 y = 0; x < _; x++)
iabbrev fez32 for(s32 z = 0; x < _; x++)
iabbrev fexs32 for(s32 x = 0; x < _; x++)
iabbrev feys32 for(s32 y = 0; x < _; x++)
iabbrev fezs32 for(s32 z = 0; x < _; x++)

iabbrev fex64 for(s64 x = 0; x < _; x++)
iabbrev fey64 for(s64 y = 0; x < _; x++)
iabbrev fez64 for(s64 z = 0; x < _; x++)
iabbrev fexs64 for(s64 x = 0; x < _; x++)
iabbrev feys64 for(s64 y = 0; x < _; x++)
iabbrev fezs64 for(s64 z = 0; x < _; x++)

iabbrev ret return
iabbrev main int main(int argc, char* argv[])

" TODO(rayalan): fix these for # and < special symbols
" abbrevs for C/C++ std includes 
"iabbrev #inc #include
"iabbrev stdio <cstdio>
"iabbrev stdlib <cstdlib>
"iabbrev <ass <cassert>
"iabbrev <mat <cmath>
"iabbrev <ios <iostream>
"iabbrev <ran <random>
"iabbrev <str <string>
"iabbrev <vec <vector>
"

" abbreviations for english
iabbrev teh the
iabbrev Teh The
iabbrev TEh The
iabbrev THe Tha



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO(rayalan): FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" replace _ with everything after ') ' 
function UnderscoreMacro()
    " search backwards for )
    call search(')', 'b')
    execute "normal l"
    execute "normal c$"
    execute "normal 3b"
    execute "normal P"
    " search backwards for _
    call search('_', 'b')
    execute "normal xX"
    execute "normal $"
    return
endfunction

" TODO(rayalan): make this work to toggle comments on / off
" TODO(rayalan): make this work for selected region? 
function CommentMacro()
    execute "normal 0"
    execute "insert"
endfunction

function BuildMacro() 
    execute "!build"
    execute "!run"
endfunction

function DebugMacro() 
    execute "!debug"
endfunction
