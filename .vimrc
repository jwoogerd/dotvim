if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" enable pathogen
execute pathogen#infect()

" turn off spellcheck by default
set nospell

" set indentation
set nocompatible	    " use vim defaults 
filetype off
filetype plugin indent on

set bs=indent,eol,start	" allow backspacing over everything in insert mode
set ai			        " always set autoindenting on
set si                  " smart indent on

" set tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" always show line numbers
set number
set numberwidth=3 
set ruler		" show the cursor position all the time

" bracket and paren auto expansion
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

set showmatch " matching braces highlighting
set mat=2 

" text width and wrapping 
set textwidth=80
set tw=80
set wrap
set wrapmargin=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" history
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			            " than 50 lines of registers
set history=50		    " keep 50 lines of command line history

" when compiled with support for autocommands, settings for non-code text
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt |  set tw=78 |
        \ set spell spelllang=en_us
    autocmd BufRead *.md |  set tw=78 |
        \ set spell spelllang=en_us
    autocmd BufRead README | set tw=78 |
        \ set spell spelllang=en_us
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" key remapping
imap jj <Esc>
nmap ; :


" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if &t_Co > 2 
  syntax on
  set hlsearch
endif

" set color scheme for MacVim
if has("gui_running")
  colorscheme earthsong
  " colorscheme github 
endif
  
"syntastic does not work with fish shell
set shell=/bin/bash

