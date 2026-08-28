""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. PLUGIN MANAGER (vim-plug) — auto-install if missing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'                 " colorscheme
Plug 'vim-airline/vim-airline'         " statusline + buffer tabline
Plug 'vim-airline/vim-airline-themes'  " gruvbox theme for airline
Plug 'preservim/nerdtree'              " file tree sidebar
Plug 'ryanoasis/vim-devicons'          " file icons (needs Nerd Font)
Plug 'jiangmiao/auto-pairs'            " auto close brackets/quotes

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. COLORSCHEME — Gruvbox (tuned to look its best)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark
let g:gruvbox_contrast_dark    = 'hard'   " 'soft' | 'medium' | 'hard'
let g:gruvbox_italic           = 1
let g:gruvbox_bold             = 1
let g:gruvbox_underline        = 1
let g:gruvbox_undercurl        = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_sign_column      = 'bg0'
let g:gruvbox_vert_split       = 'bg0'
silent! colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. AIRLINE — statusline + buffer bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5. NERDTree (file sidebar)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6. KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <Esc>
let mapleader = ","

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7. F6 — RUN CURRENT FILE (auto-detects language)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c           nnoremap <buffer> <F6> :w<CR>:!gcc % -o %< && ./%<<CR>
autocmd FileType cpp         nnoremap <buffer> <F6> :w<CR>:!g++ % -o %< && ./%<<CR>
autocmd FileType python      nnoremap <buffer> <F6> :w<CR>:!python3 %<CR>
autocmd FileType javascript  nnoremap <buffer> <F6> :w<CR>:!node %<CR>
autocmd FileType typescript  nnoremap <buffer> <F6> :w<CR>:!ts-node %<CR>
autocmd FileType java        nnoremap <buffer> <F6> :w<CR>:!javac % && java %<<CR>
autocmd FileType go          nnoremap <buffer> <F6> :w<CR>:!go run %<CR>
autocmd FileType rust        nnoremap <buffer> <F6> :w<CR>:!cargo run<CR>
autocmd FileType ruby        nnoremap <buffer> <F6> :w<CR>:!ruby %<CR>
autocmd FileType php         nnoremap <buffer> <F6> :w<CR>:!php %<CR>
autocmd FileType sh          nnoremap <buffer> <F6> :w<CR>:!bash %<CR>
autocmd FileType lua         nnoremap <buffer> <F6> :w<CR>:!lua %<CR>
autocmd FileType perl        nnoremap <buffer> <F6> :w<CR>:!perl %<CR>
autocmd FileType r           nnoremap <buffer> <F6> :w<CR>:!Rscript %<CR>
autocmd FileType html        nnoremap <buffer> <F6> :!xdg-open % &<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8. GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on

set number
set relativenumber
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set noswapfile
set nobackup
set nowritebackup
set hidden
set nowrap
set scrolloff=8
set incsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set mouse=a
set encoding=utf-8
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9. SPEED / PERFORMANCE TWEAKS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw          " don't redraw during macros/scripts
set ttyfast             " faster terminal redraw
set updatetime=300      " faster CursorHold-type events
set timeoutlen=400      " faster leader-key response
set synmaxcol=300       " skip syntax highlighting past this column (long lines)
set noshowmode          " airline already shows the mode
set shortmess+=I        " skip intro screen
set nocompatible