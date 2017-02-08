set nocompatible        " required
filetype off            " required

" set the runtime path to include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}


" all of your plugins must be added before the following line
call vundle#end()       " required
filetype plugin indent on " required

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*h match BadWhitespace /\s\+$/
set encoding=utf-8

highlight BadWhitespace ctermbg=red guibg=red
let python_highlight_all=1
syntax on


" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_based_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_based_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$']
set nu


" always use spaces instead of tab characters
"set expandtab
"set tabstop=8
"set softtabstop=0
"set shiftwidth=4
"set smarttab
"set number
"syntax on
"filetype indent plugin on
