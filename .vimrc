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
"Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

map tt :NERDTree <CR>
map tg :NERDTreeToggle <CR>
map tb :Tab /= <CR>
:command F :echo expand('%:p')
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

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
nnoremap gr :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR> 

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
    if (s:nerd == 1)
      exec ":NERDTreeToggle <CR>"
    endif
    unlet s:nerd
  else
    if IsNerdTreeEnabled() 
      exec ":NERDTreeToggle <CR>"
      let s:nerd = 1
    else 
      let s:nerd = 0
    endif
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

  "----------------------------Vim Tips & Tricks:----------------------------
  " | Command        | Usage                                                |
  " |                |                                                      |
  " | ~              | switch case of letter under cursor                   |
  " | .              | repeats last command                                 |
  " | %              | go to matching bracket for bracket under cursor      |
  " | *              | search for word under cursor                         |
  " | =              | align indentation of block in visual mode            |
  " | ctrl-n, ctrl-p | next/previous word completion                        |
  " | ctrl-x ctrl-l  | line completion                                      |
  " | !<command>     | executes <command> in shell and puts you there       |
  " | .!<command>    | pastes output of <command> into current window       |
  " | %TOhtml        | Creates HTML version of the current document         |
  " | %s//bar/g      | replace each last searched-for word with bar         |
  " | \zs or \ze     | in search, marks the start and end of pattern        |
  " | foo\(bar\)\@!  | pattern, matches any foo that is not followed by bar |
