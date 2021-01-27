" snippets 
source ~/.vim/snippets.vim

" plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug '~/.fzf'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

filetype plugin on
" custom sets
set rtp+=/usr/local/opt/fzf

" YouCompleteMe
"let g:ycm_use_clangd = 0 "youcompleteme
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_auto_trigger = 1
"autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine
"autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine

"ultiSnips
let g:UltiSnipsEditSplit="vertical"
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Ack
let g:ackprg = 'ag --nogroup --column'
"let g:ackpreview = 1
let g:ackhighlight = 1
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1
set switchbuf=newtab

cnoreabbrev Ack Ack!
nnoremap <Leader>/ :Ack!<Space>
vnoremap <Leader>a :<backspace><backspace><backspace><backspace><backspace>Ack!<cr>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NERDTree
let g:NERDTreeWinPos = "left"
map <Leader>n :NERDTreeToggle<cr>

" fuzzy finder 
noremap <leader>o :FZF<enter>
inoremap <leader>o <esc>:FZF<enter>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#bookmark#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='badwolf'
let g:airline_left_sep='>'
let g:airline_detect_spell=1

" mapLeader
map <space> <Leader>

" misc settings
set mouse=a
set scrolloff=10

" tabs
map <Leader>tn :tabnew<cr>
map <Leader>tl :tabnext<cr>
map <Leader>th :tabprevious<cr>
map <Leader>tf :tabfind
map <Leader>tm :tabmove
map <Leader>tc :tabclose<cr>
map <Leader>to :tabnew<enter>:FZF<enter>

" buffers
map <Leader>bl :bn<enter>
map <Leader>bh :bb<enter>
map <Leader>bc :bd<enter>


" run test
autocmd FileType javascript noremap <leader>rt :w<enter>:!clear && gulp test<enter>

" run build
autocmd FileType javascript noremap <leader>rb :w<enter>:!clear && sh localbuild.sh<enter>

nnoremap <Leader>ww <C-W>w
nnoremap <Leader>wl <C-W>l
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wc <C-W>c

" misc mappings
nnoremap <Leader>s :w<enter>
nnoremap <leader>a <C-A>


:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
"Mode Settings

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" mouse cursor corrections.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"gruvbox Settings
colorscheme gruvbox
:set bg=dark
let g:gruvbox_contrast_dark = 'hard'


:set number relativenumber
:set nu rnu

syntax on

set number
set linebreak
set showbreak=+++ 
set showmatch
set cursorline 
set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set wrap
set ruler

" Status line styling
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" highlight SpecialKey ctermfg=Grey
set undolevels=1000
set backspace=indent,eol,start

:imap jj <esc>

set ttyfast

" status bar
set laststatus=2

" Display options
set showmode
set showcmd
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set clipboard=unnamed
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
"nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc
