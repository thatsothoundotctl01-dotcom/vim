" ============================================================
" .vimrc — fast + good-looking Vim setup
" ============================================================

" ---- Basic settings ----
set nocompatible
syntax on
filetype plugin indent on

set number              " line numbers
set relativenumber      " relative line numbers (good for jumps)
set termguicolors       " true color support
set cursorline          " highlight current line
set ignorecase
set smartcase
set incsearch
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set noswapfile
set nobackup
set hidden
set updatetime=300
set scrolloff=8
set signcolumn=yes
set mouse=a              " mouse support (resize splits, click to move cursor)
if has('clipboard')
  set clipboard=unnamedplus " use system clipboard (only if Vim supports it)
endif
set splitright            " vertical splits open to the right
set splitbelow            " horizontal splits open below
set wildmenu               " nicer command-line completion
set lazyredraw              " don't redraw while running macros (smoother/faster)
set ttyfast                 " smoother scrolling/rendering over fast terminals
set timeoutlen=400           " faster which-key / leader response

" ---- Auto-install vim-plug if missing ----
let s:plug_path = expand('~/.vim/autoload/plug.vim')
if empty(glob(s:plug_path))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  if filereadable(s:plug_path)
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  else
    echom 'vim-plug download failed. Check curl/internet, then run: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
endif

" ---- Plugins ----
call plug#begin('~/.vim/plugged')

" Look
Plug 'joshdick/onedark.vim'              " colorscheme
Plug 'tomasiser/vim-code-dark'           " backup VSCode-look colorscheme
Plug 'vim-airline/vim-airline'           " statusline
Plug 'vim-airline/vim-airline-themes'    " airline themes

" Syntax / language support (all languages, kept up to date automatically)
Plug 'sheerun/vim-polyglot'              " auto syntax highlighting + indent for 100+ languages

" Speed / usability / navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                  " fuzzy finder
Plug 'preservim/nerdtree'                " file explorer
Plug 'tpope/vim-commentary'              " gc to comment/uncomment
Plug 'tpope/vim-surround'                " cs"' etc.
Plug 'airblade/vim-gitgutter'            " git diff signs in gutter
Plug 'tpope/vim-fugitive'                " git commands inside vim (:G, :Gblame, ...)
Plug 'jiangmiao/auto-pairs'              " auto-close (), [], "", etc.
Plug 'mbbill/undotree'                   " visual undo history tree
Plug 'mg979/vim-visual-multi'            " multiple cursors (Ctrl+n like VSCode)
Plug 'dense-analysis/ale'                " async lint + fix engine, many languages
Plug 'ludovicchabant/vim-gutentags'      " auto-generate ctags for jump-to-definition

" File-type icons — MUST be the last Plug (its own docs require this: it
" needs nerdtree/airline/etc. already registered so it can hook into them)
Plug 'ryanoasis/vim-devicons'            " icons for every filetype (needs a Nerd Font)

call plug#end()

" ---- Colorscheme ----
set runtimepath^=/home/thatsothoun/colorscheme/Vim-Plugin-/gruvbox-colorscheme/gruvbox
colorscheme gruvbox

" ---- Airline (prettier + buffer/tab navigation) ----
set laststatus=2
set noshowmode
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1        " needs a Nerd Font, set 0 if icons look broken
let g:airline#extensions#tabline#enabled = 1        " show open buffers as a tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer numbers in tabline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1         " show git branch
let g:airline#extensions#whitespace#enabled = 1      " warn about trailing whitespace/mixed indent
let g:airline#extensions#ale#enabled = 1             " show ALE lint counts in the statusline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch  = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr  = '☰'

" ---- File icons for every language (vim-devicons) ----
let g:webdevicons_enable_nerdtree = 1          " icons in the NERDTree file browser
let g:webdevicons_enable_airline_tabline = 1   " icons on each open buffer tab
let g:webdevicons_enable_airline_statusline = 1 " icon for the current file in the statusline
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " folder icons too, not just files
let g:DevIconsEnableFoldersOpenClose = 1        " different icon for open vs closed folders
let g:webdevicons_conceal_nerdtree_brackets = 1

" Move up/down through open buffers (shown in the airline tabline)
nnoremap <silent> <C-Up>   :bprevious<CR>
nnoremap <silent> <C-Down> :bnext<CR>

" ---- ALE (linting, kept lightweight/non-blocking) ----
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" ---- vim-visual-multi default mapping note ----
" Ctrl+n on a word = select next occurrence (like VSCode multi-cursor)
" NOTE: Ctrl+n is reserved for vim-visual-multi below, so NERDTree moved to <leader>e

" ---- Keymaps ----
let mapleader = " "

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>c :Commentary<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>g :G<CR>

" Move between splits with Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits fast with Alt + arrow keys
nnoremap <A-Up>    :resize +2<CR>
nnoremap <A-Down>  :resize -2<CR>
nnoremap <A-Left>  :vertical resize -2<CR>
nnoremap <A-Right> :vertical resize +2<CR>

" jj to escape insert mode
inoremap jj <Esc>

" ---- F5: browse current folder (NERDTree) ----
nnoremap <F5> :NERDTreeToggle<CR>

" Create a new file (prompts for a path, creates parent dirs if needed)
function! CreateNewFile()
  let l:name = input('New file: ')
  if empty(l:name)
    return
  endif
  let l:dir = fnamemodify(l:name, ':h')
  if l:dir !=# '.' && !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif
  execute 'edit ' . fnameescape(l:name)
  write
  echo 'Created file: ' . l:name
endfunction

" Create a new folder (relative to cwd, or an absolute path)
function! CreateNewFolder()
  let l:name = input('New folder: ')
  if empty(l:name)
    return
  endif
  call mkdir(l:name, 'p')
  echo 'Created folder: ' . l:name
endfunction

nnoremap <leader>nf :call CreateNewFile()<CR>
nnoremap <leader>nd :call CreateNewFolder()<CR>
" Inside NERDTree itself, the built-in 'm' key also opens an add/move/delete menu

" ---- F4: toggle a terminal split ----
function! ToggleTerm()
  if exists('t:term_buf') && bufexists(t:term_buf)
    execute 'bd! ' . t:term_buf
    unlet t:term_buf
  else
    botright 15split
    terminal
    let t:term_buf = bufnr('%')
    startinsert
  endif
endfunction

nnoremap <silent> <F4> :call ToggleTerm()<CR>
tnoremap <silent> <F4> <C-\><C-n>:call ToggleTerm()<CR>
" Esc leaves terminal insert mode so normal-mode maps (like F4) work
tnoremap <Esc> <C-\><C-n>

" ---- F6: compile and run current C / C++ file ----
" Works for both .c and .cpp, saves file first, shows compiler errors if any.
function! CompileAndRun()
  write
  let l:file = expand('%')
  let l:out  = expand('%:t:r') . '.out'
  if &filetype ==# 'c'
    execute '!gcc -std=c17 -O2 -Wall -Wextra ' . shellescape(l:file) . ' -o ' . shellescape(l:out) . ' && ./' . shellescape(l:out)
  elseif &filetype ==# 'cpp'
    execute '!g++ -std=c++17 -O2 -Wall -Wextra ' . shellescape(l:file) . ' -o ' . shellescape(l:out) . ' && ./' . shellescape(l:out)
  else
    echo 'F6 run is only set up for C/C++ files.'
  endif
endfunction

autocmd FileType c,cpp nnoremap <buffer> <F6> :call CompileAndRun()<CR>