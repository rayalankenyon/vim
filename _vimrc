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

" show current command vim is doing
set showcmd
set cmdheight=1 
set ruler

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
autocmd VimEnter * lcd %:p:h


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch


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
" TODO(rayalan): SOUND
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader 
let mapleader = ";" 
let g:mapleader = ";"

" TODO(rayalan): more leader stuff
map <leader>w :w<cr>    
map <leader>v :rightbelow vsplit<cr>
map <leader>s :rightbelow split<cr>
" map f5 = save, build, debug
" map (key) = save, build

" navigate between buffers with ctrl+direction
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" resize buffers with alt+direction
map <A-h> <C-w><
map <A-j> <C-W>-
map <A-k> <C-W>+
map <A-l> <C-w>>

" close current buffer 
map <leader>bd :bd!<cr>

" change vim directory to directory of current file
map <leader>cd :lcd %:p:h<cr>

" TODO(rayalan): figure out proper comment here
" macros? 
map <leader>t :startinsert!<cr>// TODO(rayalan): <cr><bs>
map <leader>n :startinsert!<cr>// NOTE(rayalan): <cr><bs>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO(rayalan): AUTO CORRECT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


iabbrev ret return


"abbrev fex for(int k = 0; k < size; k++)
"iabbrev fey for(int k = 0; k < size; k++)
"iabbrev fez for(int k = 0; k < size; k++)
