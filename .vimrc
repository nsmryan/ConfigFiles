
" Disable vi compatibility
set nocompatible

" set the leader for mappings
nnoremap ,, ,
let mapleader=","

" default to relative line numbers
set invrelativenumber
set number

" Tab/space settings
set ts=2
set sw=2
set bs=2

set expandtab

"" auto indent
set ai

" don't prompt about swap files
set shortmess+=A

" longer undo history
set history=1000

set clipboard=unnamedplus,autoselect

" smart backspace
set backspace=indent,eol,start

" add corner braces to matching pairs
set matchpairs+=<:>

" disable error bell 
set noeb

" No beeping or screenflash
set vb t_vb=

" disable line wrapping
set nowrap

" enable mouse use
set mouse=a

" set smarttab
set shortmess=a
set clipboard=unnamed
set go+=a

" Set font
set gfn=Lucida_Console:h8:b:cANSI

" completion for wildcard character
set wildmode=longest,list,full

" enhanced command line completion
set wildmenu

" completion more like an IDE
set completeopt=menuone,menu,longest,preview

" use magic regex
set magic

" disable backup files
set nobackup

" do not redraw when executing macros
set lazyredraw

" allow buffers to contain unsaved changes when not in use
set hidden

" disable backups
set nobackup

" more terminal colors
set t_Co=256

" minimal command height
set cmdheight=1

"" GUI
" Remove toolbar
set guioptions-=T
" Add bottom scrollbar
set guioptions+=b

" Alt-Space is System menu
if has("gui")
        noremap <M-Space> :simalt ~<CR>
        inoremap <M-Space> <C-O>:simalt ~<CR>
        cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" Don't add end of line- this can modify files unintentionally
set noeol

" Use a centralized directory for swap files, if one exists.
" otherwise use the current directory.
set directory=~/.vimfiles/swp,~/.vim/swp,.

"" Search
set smartcase
set incsearch
set hlsearch

" Set up the statusline. This is a veru simple and mostly static statusline
" designed for minimal distraction.
set laststatus=2
set statusline=%n\ %t\ %m\ %r\ %y\ %F\ %=\ %l\/%L\ (\%%%-p)
"              |   |   |   |   |   |   |    |  |   |
"              |   |   |   |   |   |   |    |  |   + Percent through file
"              |   |   |   |   |   |   |    |  + total lines in file
"              |   |   |   |   |   |   |    + current line   
"              |   |   |   |   |   |   + align to right        
"              |   |   |   |   |   + full path to file
"              |   |   |   |   + file type
"              |   |   |   + file type
"              |   |   + read only flag
"              |   + file name
"              + buffer number   


""""""""""""""""""""""""""""""""
"""""""""Key Bindings"""""""""""
""""""""""""""""""""""""""""""""
" Source vimrc
nmap <leader>s :source $MYVIMRC<CR><CR>
" Edit vimrc
nmap <leader>rc :e $MYVIMRC<CR>
" remove search results
nmap <leader>h :noh<CR>

" Make sure <Esc>==<C-[>
imap <C-[> <Esc>
nmap <C-[> <C-L>

" tab toggles to last buffer
" nmap <Tab> :b#<CR>

" exit insert mode with jk
inoremap jk <esc>

" Reformat whole document
nmap <leader>= mzHmxgg=G`xzt`z

" Arrows scroll
nmap <Down> <C-e>
nmap <Up> <C-y>

" toggle relative line numbers
nmap <leader>er :set invrelativenumber<CR>

" select last paste
nmap <leader>v V`]

" <leader>m for quickly saving a file
nmap <leader>m :w<CR>

" place delimiters around selection
vmap ,( c()<ESC>P
vmap ,) c()<ESC>P
vmap ,[ c[]<ESC>P
vmap ,] c[]<ESC>P
vmap ," c""<ESC>P
vmap ,' c''<ESC>P
vmap ,< c<><ESC>P
vmap ,> c<><ESC>P

" Splits
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

set splitbelow
set splitright

" Make Y more like other capitals
noremap Y y$

"""""""""""""""""""""""""""""""""
"""Language Specific Settings""""
"""""""""""""""""""""""""""""""""
"" JAS
au BufNewFile,BufRead *.jpp set filetype=c

"" FORTH
" forth syntax
au BufNewFile,BufRead *.frt set filetype=forth
au BufNewFile,BufRead *.fs set filetype=forth
au BufNewFile,BufRead *.forth set filetype=forth

"" C
" Add function to Unity unit tests
nmap <Leader>unit 0f(bywG?RUN_TEST<CR>oRUN_TEST(<ESC>pA);<ESC>,h


""""""""""""""""""""""""
"""Plugin Settings""""""
""""""""""""""""""""""""
syntax on
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
filetype plugin indent on
syntax on

""" vim-plug setup
call plug#begin('~/.vimfiles/plugged')

"" Utility Plugins
Plug 'kana/vim-textobj-user'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" NOTE reavaluate this plugin
" Plug 'majutsushi/tagbar'

Plug 'benmills/vimux'

"" Editing Plugins
Plug 'vim-scripts/a.vim'

Plug 'airblade/vim-rooter'

Plug 'scrooloose/nerdtree'

Plug 'tc50cal/vim-terminal'

" Align text
Plug 'godlygeek/tabular'

" Search
Plug 'mileszs/ack.vim'

Plug 'rust-lang/rust.vim'

"" Extra displays/Information
Plug 'tpope/vim-fugitive'

" Nice startup screen
Plug 'mhinz/vim-startify'

" Fast file search
Plug 'kien/ctrlp.vim'

"" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'hhff/SpacegrayEighties.vim'

call plug#end()

""" Vim Diff
nmap <leader>l :diffget LOCAL<CR>
nmap <leader>o :diffget REMOTE<CR>

" pane switching
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Colorscheme
colorscheme gruvbox

" Startify
let g:startify_session_dir = '~/.vim_sessions'

" ACk
" use ripgrep if available as the search tool
if executable("rg")
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

"""" Vimux
" rerun the last command
nnoremap <leader>r :call VimuxRunCommandInDir("!!", 0)<CR>

""" NERDTree Settings
map <leader>n :NERDTreeToggle<CR>

""" Ctrl-p Settings
map <silent> <leader>t :CtrlP()<CR>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

""" EasyMotion Settings
nmap <leader>p <Plug>(easymotion-overwin-w)

""" Rooter settings
" if the file is not in a project, use current dir
let g:rooter_change_directory_for_non_project_files = 'current'

""" Fugitive settings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>

""""""""""""""""""""""""
"""Hex Mode Settings""""
""""""""""""""""""""""""
" Enter and exit HexMode
nnoremap <leader>x :call ToggleHex()<CR>

" ex command for toggling hex mode
" command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
  
