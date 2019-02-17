" https://realpython.com/vim-and-python-a-match-made-in-heaven/
set nocompatible              " required
filetype off                  " required

" jump between matching html/xml/jxs tags
runtime macros/matchit.vim


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" adds color to commented out code
hi Comment ctermfg=LightBlue

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasiser/vim-code-dark'
Plugin 'sheerun/vim-polyglot'
Plugin 'chemzqm/vim-jsx-improve' 
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" comments out highlighted code with gcc
Plugin 'tpope/vim-commentary'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set encoding=utf-8
 
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let python_highlight_all=1
syntax on

colorscheme codedark

set nu
set clipboard=unnamed

" Open NERD Tree when no file specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERD Tree when directory is specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" map Ctrl+n to toggling the NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Close NERD Tree when everything else is closed.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Keep NERD Tree open in new tabs
autocmd BufWinEnter * NERDTreeMirror

" Sets java script and html indentation to 2 spaces.
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2

let g:NERDTreeNodeDelimiter = "\u00a0"

" Preven Ctrlp from searching node modules and git
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
