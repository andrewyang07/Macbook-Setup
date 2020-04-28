" Reference: https://stevelosh.com/blog/2010/09/coming-home-to-vim/

" let g:VimTodoListsDatesEnabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap jk <ESC>

" The filetype and call lines are for loading Pathogen
filetype off

" Enable Syntax
syntax on

" call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Get rid of all the crap that Vim does to be vi compatible. It's 2010 °™ we don't need to be compatible with vi at the expense of functionality any more.
set nocompatible

" The modelines bit prevents some security exploits having to do with modelines in files.
set modelines=0

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
" set wildmode=list:longest
set wildmode=full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set encoding=utf-8
set clipboard=unnamedplus

" relativenumber changes Vim's line number column to display how far away each line is from the current one, instead of showing the absolute line number.
set relativenumber

" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. These files contain undo information so you can undo previous actions even after you close and reopen a file.
set undofile

" Set <leader> key
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Format API Metrics log entries
nmap <leader>fapi :%s/,/\r<cr>

" Searching/Moving - automatically enable regex when searching
" nnoremap / /\v
" vnoremap / /\v

" ignorecase and smartcase together make Vim deal with case-sensitive search intelligently. If you search for an all-lowercase string your search will be case-insensitive, but if one or more characters is uppercase the search will be case-sensitive. Most of the time this does what you want.
set ignorecase
set smartcase

" gdefault applies substitutions globally on lines. For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you want (when was the last time you wanted to only replace the first occurrence of a word on a line?) and if you need the previous behavior you just tack on the g again.
set gdefault

" incsearch, showmatch and hlsearch work together to highlight search results (as you type). It's really quite handy, as long as you have the next line as well.
set incsearch
set showmatch
set hlsearch

" The <leader><space> mapping makes it easy to clear out a search by typing ,<space>. This gets rid of the distracting highlighting once I've found what I'm looking for.
nnoremap <leader><space> :noh<cr>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Make the tab key match bracket pairs. I use this to move around all the time and <tab> is a hell of a lot easier to type than %.
nnoremap <tab> %
vnoremap <tab> %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" New Vim users will want the following lines to teach them to do things right:
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

vnoremap j gj
vnoremap k gk

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Next, get rid of that stupid goddamned help key that you will invaribly hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Save on losing focus.
au FocusLost * :wa

" Allow deleting single characters without updating the default register
noremap x "_x

" Paste in visual mode (when replacing text) without updating the default register
vnoremap p "_dP

" Quickly copy/paste to/from system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" F5 to set paste
set pastetoggle=<f5>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" The & command is a synonym for :s, which repeats the last substitution. Unfortunately, if any flags were used, the & command disregards them, meaning that the outcome could be quite different from the previous substitution.
" Making & trigger the :&& command is more useful. It preserves flags and therefore produces more consistent results. These mappings fix the & command in Normal mode and create a Visual mode equivalent:
nnoremap & :&&<CR> xnoremap & :&&<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neovim Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switching Between Terminal Mode and Normal Mode
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

" Highlight the terminal cursor
if has('nvim')
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Invoke the fzf file finder by pressing <C-p>
nnoremap <C-p> :<C-u>FZF<CR>

" minpac shortcuts
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Initialize minpac
packadd minpac 
call minpac#init()

call minpac#add('tpope/vim-unimpaired')
call minpac#add('aserebryakov/vim-todo-lists')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')

call minpac#add('k-takata/minpac', {'type': 'opt'})
