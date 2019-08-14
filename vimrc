filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

set splitbelow
set splitright

" split navigations
" nnoremap remaps one key combination to another
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"imap ö <Esc> 
"nnoremap <ä> <C-W><C-W>

"exe "noremap <Char-196> }" | " LATIN CAPITAL A WITH DIAERESIS
"exe "noremap <Char-214> {" | " LATIN SMALL A WITH DIAERESIS
"exe "noremap <Char-228> ]" | " LATIN CAPITAL U WITH DIAERESIS
"exe "noremap <Char-246> [" | " LATIN SMALL U WITH DIAERESIS


set t_Co=256

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'
let g:SimplyFold_docstring_preview=1

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=100 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 

" Flagging unneccesary whitespaces
"au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

" Set up auto-intendation
"Plugin 'vim-scripts/indentpython.vim'

" Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

" Auto completion
Plugin 'valloric/youcompleteme'


" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

"if has('gui_running')
""	set background=grey
""	colorscheme Tomorrow-Night-Eighties
"else
""	colorscheme Tomorrow-Night-Eighties
"endif

colorscheme 256-jungle
colorscheme badwolf

call togglebg#map("<F5>")

" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <F2> :NERDTreeToggle<CR>
"nmap <silent> <special> <F2> :NERDTree<RETURN>

Plugin 'scrooloose/nerdcommenter'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_python = 1
let mapleader=","


imap <C-c> NERDCommenterInsert
set timeout timeoutlen=1500


" Super Searching
"Plugin 'kien/ctrlp.vim'

" tag explorer
Plugin 'majutsushi/tagbar'
nnoremap <F3> :TagbarToggle<CR>


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
let g:airline_extensions = ['branch', 'tabline']


nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>


Plugin 'tpope/vim-surround'

set nu

" getting things from clipboard outside of vim
set clipboard=unnamed


" turn hybrid line numbers on
" set number relativenumber
" :set nu rnu
"
" " turn hybrid line numbers off
" :set nonumber norelativenumber
" :set nonu nornu
"
" " toggle hybrid line numbers
" :set number! relativenumber!
" :set nu! rnu!

set cursorline
set cursorcolumn

" doesnt jump back to first line after change buffer
set nosol


"highlight CursorLine ctermbg=Black ctermfg=NONE guibg=NONE guifg=NONE
" black seems to not work in vim with tmux
"highlight LineNr ctermbg=Black


Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1


"Allows in vim terminal execution
" use ':ConqueTerm bash' to start a bash
Bundle 'rosenfeld/conque-term'



" automatically add delimiter for example for open bracket
Plugin 'Raimondi/delimitMate'

" tmux integration plugin and settings

Plugin 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-q> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-s> :TmuxNavigateDown<cr>
nnoremap <silent> <C-w> :TmuxNavigateUp<cr>
nnoremap <silent> <C-e> :TmuxNavigateRight<cr>

map <C-n> <nop>

command Vash :set nolist | 10split | ConqueTerm bash
command Vython :set nolist | 10split | ConqueTerm python

" templates for creating documentation

command! Btm call BeginTermM()
function! BeginTermM()
           normal! i~~~ {.text breaklines=true bgcolor=met fontsize=\footnotesize framesep=6mm frame=single rulecolor=att}
           normal! o
           normal! o~~~
      endfunction


command! Btl call BeginTermL()
function! BeginTermL()
           normal! i~~~ {.text breaklines=true bgcolor=lin fontsize=\footnotesize framesep=6mm frame=single rulecolor=att}
           normal! o
           normal! o~~~
      endfunction

command! Btw call BeginTermW()
function! BeginTermW()
           normal! i~~~ {.text breaklines=true bgcolor=win fontsize=\footnotesize framesep=6mm frame=single rulecolor=att}
           normal! o
           normal! o~~~
      endfunction

command! Bvl call BeginVicL()
function! BeginVicL()
           normal! i~~~ {.text breaklines=true bgcolor=lin fontsize=\footnotesize framesep=6mm frame=single rulecolor=vic}
           normal! o
           normal! o~~~
      endfunction

command! Bvw call BeginVicW()
function! BeginVicW()
           normal! i~~~ {.text breaklines=true bgcolor=win fontsize=\footnotesize framesep=6mm frame=single rulecolor=vic}
           normal! o
           normal! o~~~
      endfunction

command! Bvb call BeginBash()
function! BeginBash()
           normal! i~~~ {.bash breaklines=true bgcolor=bg fontsize=\footnotesize}
           normal! o
           normal! o~~~
      endfunction




command! Tem call InsertTemplate()
function! InsertTemplate()
           normal! i##
           normal! o|                                       |
           normal! o|-----------------------------------+---|
           normal! o| OS                                |   |
           normal! o| Network Name                      |   |
           normal! o| Access Exploit                    |   |
           normal! o| Local Privilege Escalation        |   |
           normal! o
           normal! o### Methodologies
           normal! o
           normal! o### Information Gathering
           normal! o
           normal! o### Service Enumeration
           normal! o
           normal! o### Getting Access
           normal! o
           normal! o### Internal Information Gathering
           normal! o
           normal! o### Local Privilege Escalation
           normal! o
           normal! o### Post Exploitation
           normal! o
      endfunction



