set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'  " Vundle itself
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'raichoo/haskell-vim'  " Haskell syntax
Plugin 'jelera/vim-javascript-syntax'  " better javascript syntax
Plugin 'editorconfig/editorconfig-vim'  " editorconfig for vim
Plugin 'tomasr/molokai'  " Molokai colorscheme
Plugin 'scrooloose/syntastic'  " Linter
Plugin 'shutnik/jshint2.vim'  " JShint integration

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

if has("gui_running")
    set guioptions-=T
endif

"Show nice tabs
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set number
set linebreak
set nowrap  " No word wrap

au BufRead, BufNewFile *.py set expandtab
au BufRead, BufNewFile Makefile* set noexpandtab

set anti            " Turn on anti-aliasing
set gfn=Monaco:h16  " Set the font family and the font size

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start

set ruler
syntax on

set showcmd

set gdefault

"--- Nerdtree options ---
" Open automatically on startup
"autocmd vimenter * NERDTree
" Open if no files specified
autocmd vimenter * if !argc() | NERDTree | endif
" Remape Ctrl + n to open
map <C-n> :NERDTreeToggle<CR>
" Close if Nerdtree is last window
autocmd vimenter * if !argc() | NERDTree | endif

" Solarize options:
syntax enable
set background=dark
if has("gui_running")
    colorscheme molokai
    " TODO: install others
else
    colorscheme inkpot
endif

" Autoreload .vimrc if it changes:
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Turn off auto line break
:set textwidth=0
:set wrapmargin=0

" Highlight 80th col
:set colorcolumn=79

autocmd FileType javascript setl colorcolumn=0

" --- Key bindings --- "
nnoremap <space> <nop>
" Spacebar for President
let mapleader = "\<space>"

" Buffer navigation
map <leader>b :buffers<CR>
map <leader>l :bnext<CR>
map <leader>h :bprev<CR>

" Resize window to 80 cols
map <F8> :vertical resize 83<CR>

" spam jk to exit to Normal Mode
imap jk <ESC>
imap kj <ESC>

" .md is a markdown file
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Error on trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=#999999
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" JShint
let g:syntastic_javascript_checkers = ['jshint']

