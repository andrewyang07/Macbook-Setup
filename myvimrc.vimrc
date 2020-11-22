" Reference: https://stevelosh.com/blog/2010/09/coming-home-to-vim/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" jk to normal mode
inoremap jk <ESC>

" set <leader> key to space
let mapleader = " "
filetype off            " the filetype and call lines are for loading Pathogen
syntax on               " enable syntax processing              
set noerrorbells        " mute when you reached at the end of the line
filetype plugin indent on
set nocompatible        " get rid of all the crap that Vim does to be vi compatible
set modelines=0         " prevents some security exploits having to do with modelines in files
set tabstop=4           " 4 space tab
set shiftwidth=4        " 4 space tab
set softtabstop=4       " 4 space tab
set expandtab           " use spaces for tabs
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd             " show command in bottom bar
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

" use system clipboard for vim
" set clipboard=unnamedplus

" Searching/Moving - automatically enable regex when searching
" nnoremap / /\v
" vnoremap / /\v

set ignorecase           
set smartcase            " ignorecase and smartcase together make Vim deal with case-sensitive search intelligently. If you search for an all-lowercase string your search will be case-insensitive, but if one or more characters is uppercase the search will be case-sensitive. Most of the time this does what you want.
set gdefault             " gdefault applies substitutions globally on lines. For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you want (when was the last time you

" incsearch, showmatch and hlsearch work together to highlight search results (as you type). It's really quite handy, as long as you have the next line as well. wanted to only replace the first occurrence of a word on a line?) and if you need the previous behavior you just tack on the g again.
set incsearch
set showmatch
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings that only work on vim or nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Both absolute and relative line numbers are enabled by default, which produces “hybrid” line numbers. When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set number relativenumber       " relativenumber changes Vim's line number column to display how far away each line is from the current one, instead of showing the absolute line number.
set nobackup
set nowritebackup

set undodir=~/.vim/undodir
set undofile             " undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. These files contain undo information so you can undo previous actions even after you close and reopen a file.

" use a vertical column to measure length of each line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Save on losing focus.
au FocusLost * :wa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Faster saving
" nmap <leader>w :w!<cr>
nmap <leader>w :w<cr>

" Format API Metrics log entries
nmap <leader>fapi :%s/,/\r<cr>

" The <leader>/ mapping makes it easy to clear out a search by typing ,<space>. This gets rid of the distracting highlighting once I've found what I'm looking for.
nnoremap <leader>/ :noh<cr>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Make the tab key match bracket pairs. 
nnoremap <tab> %
vnoremap <tab> %

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map - <C-W>-
map + <C-W>+

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

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

" Faster movements - J, K can move 5 lines at one time
nnoremap J 5gj
nnoremap K 5gk
vnoremap J 5gj
vnoremap K 5gk

" Join the two lines - restore missng J funtioncality
nnoremap <leader>j J

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Next, get rid of that stupid goddamned help key that you will invaribly hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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

" Faster tab navigations
nnoremap H gT
nnoremap L gt

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" edit mappings
noremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

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

" Use true color
if has('nvim')
    set termguicolors
endif

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
" command! PackUpdate call minpac#update()
" command! PackClean call minpac#clean()

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

" more key remaps
Plug 'tpope/vim-unimpaired'

" todo list support
Plug 'aserebryakov/vim-todo-lists'

" ys
Plug 'tpope/vim-surround'

" dot repeat plugin operations
Plug 'tpope/vim-repeat'

" gcc to easily comment and uncomment
Plug 'tpope/vim-commentary'

" fast find/open files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" file manager for vim
Plug 'preservim/nerdtree'

" Vim Markdown Support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" fancy status bar!
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'itchyny/vim-gitbranch'

" undo tree visualization
Plug 'mbbill/undotree'

" file system explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" underline word under current cursor
Plug 'itchyny/vim-cursorword'

Plug 'justinmk/vim-sneak'

" auto completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Color Schemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Vim be good
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" diable folding for markdown
let g:vim_markdown_folding_disabled = 1

" toggle undo tree
nnoremap <leader>u :UndotreeToggle<CR>

" toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" automatically displays all buffers when there's only one tab open.
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" get rid of -- INSERT --
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color schemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox-material
set termguicolors
