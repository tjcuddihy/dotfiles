execute pathogen#infect()

if has("gui_running")
    set guioptions-=T
endif

set number
set linebreak
set nowrap  " No word wrap

au BufRead, BufNewFile *.py set expandtab
au BufRead, BufNewFile Makefile* set noexpandtab

set noanti          " Turn off anti-aliasing
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
    colorscheme solarized
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

" --- Key bindings --- "
nnoremap <space> <nop>
" Spacebar for President
let mapleader = "\<space>"

" Never press shift again
nnoremap ; :

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
