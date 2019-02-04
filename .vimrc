set nocompatible              " be iMproved, required
filetype off                  " required

" ---- General settings --- "
set listchars=tab:>-,trail:~,extends:>,precedes:<  " Show tab chars
set list
set number  " Print with line numbers?
set linebreak  " Breaks at special chars, not in the middle of words
set nowrap  " No word wrap
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set autoindent
set backspace=indent,eol,start
set ruler  " Show line and column number
set showcmd
set gdefault  " Search globaly by default
set hidden  " Allow buffer switching without save
set nostartofline  " Don't move back to column 0 if possible
set textwidth=0  " Turn off auto line break
set wrapmargin=0  " Turn off auto line break
set autoread  " Auto reload changed files
set noswapfile
set nobackup
set ignorecase  " Ignore case in search by default
set smartcase  " Use case sentive when contains caps

syntax enable
set t_Co=256
set noanti  " Turn off anti-aliasing
set linespace=3  " Line spacing
set guifont=Andale\ Mono:h12 " Set the font family and the font size
set background=dark
if has("gui_running")
    set lines=999 columns=999  " Maximize window
    set guioptions-=T
else
    colorscheme torte
endif

set statusline =%1*\ %n\ %*            "buffer number
set statusline +=\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" ---- Key bindings ---- "
" Ditch ex mode
noremap Q <nop>

" Spacebar for President
nnoremap <space> <nop>
let mapleader = "\<space>"

" Buffer navigation
map <leader>b :buffers<CR>:buffer<space>
map <leader>l :bnext<CR>
map <leader>h :bprev<CR>

" clear search history
nnoremap <CR> :noh<CR><CR>

map <leader>w :w<CR>
map <leader>e :Lexplore<CR>
map <leader>v :vsplit<CR><C-^>
map <leader>p "*p<CR>
map <leader>y "*y<CR>

" Replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <Leader>' :s/"/'<CR>

" Completion in insert mode
imap <C-j> <C-p>

" Simplify window resizing
" Small changes
nnoremap <S-Up> <c-w>>
nnoremap <S-Down> <c-w><
" Big jumps
nnoremap <S-Left> :exe "vertical resize " . (winwidth(0) * 5/6)<CR>
nnoremap <S-Right> :exe "vertical resize " . (winwidth(0) * 6/5)<CR>

" Resize window to ~ 80 cols
map <F8> :vertical resize 83<CR>

" Spam jk to exit to Normal Mode
imap jk <ESC>
imap kj <ESC>

" Edit .vimrc in a new vsplit
nmap ,v :vsp $MYVIMRC<CR>

" ---- Autocommands ---- "

" Allow long lines in JS
autocmd FileType javascript setl colorcolumn=0
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Expand tabs in Python
au BufRead, BufNewFile *.py set expandtab
au BufRead, BufNewFile Makefile* set noexpandtab

" Autoreload .vimrc if it changes:
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.mkd,*.markdown setlocal filetype=ghmarkdown
augroup END

" Error on trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=#999999
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
