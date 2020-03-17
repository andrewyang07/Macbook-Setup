" Reference: https://stevelosh.com/blog/2010/09/coming-home-to-vim/

inoremap jk <ESC>

" The filetype and call lines are for loading Pathogen
filetype off
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
syntax on
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

" Searching/Moving
nnoremap / /\v
vnoremap / /\v

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

" Make the tab key match bracket pairs. I use this to move around all the time and <tab> is a hell of a lot easier to type than %.
nnoremap <tab> %
vnoremap <tab> %

" New Vim users will want the following lines to teach them to do things right:
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Next, get rid of that stupid goddamned help key that you will invaribly hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Finally, I really like TextMate's "save on losing focus" feature. I can't remember a time when I didn't want to save a file after tabbing away from my editor (especially with version control and Vim's persistent undo):
au FocusLost * :wa

" F5 to set paste
set pastetoggle=<f5>