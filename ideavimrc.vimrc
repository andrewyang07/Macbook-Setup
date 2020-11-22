"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap jk <ESC>

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
set wildmode=full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set encoding=utf-8

set relativenumber number

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Set <leader> key to space
let mapleader = " "

set ignorecase           
set smartcase            " ignorecase and smartcase together make Vim deal with case-sensitive search intelligently. If you search for an all-lowercase string your search will be case-insensitive, but if one or more characters is uppercase the search will be case-sensitive. Most of the time this does what you want.

set gdefault             " gdefault applies substitutions globally on lines. For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you want (when was the last time you wanted to only replace the first occurrence of a word on a line?) and if you need the previous behavior you just tack on the g again.

set incsearch
set showmatch
set hlsearch             " incsearch, showmatch and hlsearch work together to highlight search results (as you type). It's really quite handy, as long as you have the next line as well.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Faster saving
" nmap <leader>w :w!<cr>
nmap <leader>w :w<cr>

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

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Faster movements
nnoremap J 5gj
nnoremap K 5gk
vnoremap J 5gj
vnoremap K 5gk

" Join the two lines
nnoremap <leader>j J

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

" Allow deleting single characters without updating the default register
noremap x "_x

" Paste in visual mode (when replacing text) without updating the default register
vnoremap p "_dP

" Quickly copy/paste to/from system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "*Y
noremap <Leader>P "*P

" The & command is a synonym for :s, which repeats the last substitution. Unfortunately, if any flags were used, the & command disregards them, meaning that the outcome could be quite different from the previous substitution.
" Making & trigger the :&& command is more useful. It preserves flags and therefore produces more consistent results. These mappings fix the & command in Normal mode and create a Visual mode equivalent:
nnoremap & :&&<CR> xnoremap & :&&<CR>

" faster tab navigations
nnoremap H gT
nnoremap L gt

" Tab navigation like Firefox.
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

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
" => IdeaVim Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set surround
set commentary
set textobj-entire
set exchange
set easymotion
set ideajoin

" diable system clipboard
set clipboard

" easy window navigation
nnoremap <leader>h gT
nnoremap <leader>l gt

" actions
nnoremap <leader>q :action CloseContent<CR>
nnoremap <leader>Q :action ReopenClosedTab<CR>
nnoremap <leader>E :action Switcher<CR>
nnoremap <leader>t :action FileStructurePopup<CR>
nnoremap <leader>T :action GotoSymbol<CR>
nnoremap <leader>a :action GotoAction<CR>
nnoremap <leader>b :action ToggleLineBreakpoint<CR>

" code navigation
nnoremap <leader>] :action GotoImplementation<CR>
nnoremap <leader>[ :action GotoSuperMethod<CR>
nnoremap <leader>u :action FindUsages<CR>
nnoremap <leader>k :action HighlightUsagesInFile<CR>
nnoremap \c :action CheckStyleCurrentFileAction<CR>
" nnoremap <leader>gt :action GotoTest<cr>
" nnoremap \r :action RunClass<cr>
" nnoremap \R :action Run<cr>
" nnoremap \d :action DebugClass<cr>
" nnoremap \D :action Debug<cr>
nmap <leader>g :action GotoImplementation<CR>
nmap <leader>d :action GotoDeclaration<CR>
nmap <leader>c :action GotoClass<CR>
nmap <C-p> :action SearchEverywhere<CR>
nmap <C-t> :action ActivateTerminalToolWindow<CR>

" unimpaired mappings
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k
nnoremap [q :action PreviousOccurence<cr>
nnoremap ]q :action NextOccurence<cr>
nnoremap [m :action MethodUp<cr>
nnoremap ]m :action MethodDown<cr>
nnoremap [c :action VcsShowPrevChangeMarker<cr>
nnoremap ]c :action VcsShowNextChangeMarker<cr>

" refactorings
vmap T :action Refactorings.QuickListPopupAction<cr>
nmap <leader>rr :action RenameElement<cr>
nmap <leader>rI :action OptimizeImports<cr>
nmap <leader>rI :action OptimizeImports<cr>
" Inspection
nmap <leader>rc :action InspectCode<cr>

