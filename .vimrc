set nocompatible 
filetype plugin on
syntax on 

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

colorscheme gruvbox
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'valloric/youcompleteme'
Plugin 'pangloss/vim-javascript'
Plugin 'morhetz/gruvbox'
Plugin 'godlygeek/tabular'
Plugin 'tomlion/vim-solidity'

call vundle#end()
filetype plugin indent on

map tt :NERDTree <CR>
map tg :NERDTreeToggle <CR>
map tb :Tab /= <CR>
map <Leader>t :YcmCompleter GetType <CR>
map <Leader>f :YcmCompleter FixIt <CR>
map <Leader>g :YcmCompleter GetDoc<CR>

set background=dark
set vb t_vb=
set number
set hlsearch
set ts=2
set shiftwidth=2
set expandtab
set autoindent
if has ("mouse")
	set mouse=a
endif

  "----------------------------Vim Tips & Tricks:----------------------------
  " |  Command       |  Usage                                                |
  " |                |                                                       |
  " |  ~             |  switch case                                          |
  " |  %s//bar/g     |  replace each last searched-for word with bar         |
  " |  \zs or \ze    |  in search, marks the start and end of pattern        |
  " |  foo\(bar\)\@! |  pattern, matches any foo that is not followed by bar |
