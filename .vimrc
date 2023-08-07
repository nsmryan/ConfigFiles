""" Editor Settings


" set the leader for mappings
nnoremap ,, ,
let mapleader=","

" default to relative line numbers
set invrelativenumber
" no vi compatibility
set nocompatible
" auto indent
set ai
" set ruler
set number
" tab/space settings
set ts=4
set sw=4
set bs=2
" longer undo history
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set backspace=indent,eol,start
set matchpairs+=<:>
" disable error bell 
set noeb
" disable line wrapping
set nowrap
" enable mouse use
set mouse=a
" don't prompt about swap files
set shortmess=a
set clipboard=unnamed
set go+=a
set expandtab
" Set font
set gfn=Lucida_Console:h8:b:cANSI
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set mat=2
set magic
" highlight search text
set hlsearch
" show tabs
set listchars=tab:>-
" show number of selected lines
set showcmd
" do not redraw when executing macros
set lazyredraw
" allow buffers to contain unsaved changes when not in use
set hidden
" disable backups
set nobackup
" more terminal colors
set t_Co=256
" height of vim cmd
set cmdheight=1
" Don't add end of line to avoid modifying files unintentially
set noeol
" Search
set smartcase
set incsearch
" No beeping or screenflash
set vb t_vb=
" default split below and right
set splitbelow
set splitright

"" GUI
" Remove toolbar
set guioptions-=T
" Add bottom scrollbar
set guioptions+=b

" Detector header files as c source, not cpp.
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Alt-Space is System menu
if has("gui")
        noremap <M-Space> :simalt ~<CR>
        inoremap <M-Space> <C-O>:simalt ~<CR>
        cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" Set up the statusline. This is a very simple and mostly static statusline
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
"
"" General Keymap Settings
" Source vimrc
nmap <Leader>s :source $MYVIMRC<CR><CR>
" Edit vimrc
nmap <Leader>rc :e $MYVIMRC<CR>
" remove search results
nmap <Leader>h :set hlsearch! hlsearch?<CR>

" Make sure <Esc>==<C-[>
imap <C-[> <Esc>
nmap <C-[> <C-L>
" Insert mode movement
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
" swapping tabs
nmap <Tab> :b#<CR>
nmap <BS> :b#<CR>
" Reformat whole document
nmap <Leader>= mzHmxgg=G`xzt`z
" Make current file executable
nmap <Leader>+x :!chmod +x %
" Arrows scroll
nmap <Down> <C-e>
nmap <Up> <C-y>
" toggle relative line numbers
nmap <Leader>er :set invrelativenumber<CR>
" select last paste
nmap <Leader>v V`]
" jk to esc from insert mode
inoremap jk <ESC>
" <Leader>m for quickly saving a file
nmap <Leader>m :w<CR>
" place parens around selection
vmap ,( c()<ESC>P
vmap ,) c()<ESC>P
vmap ,[ c[]<ESC>P
vmap ,] c[]<ESC>P
vmap ,{ c{}<ESC>P
vmap ,} c{}<ESC>P
vmap ," c""<ESC>P
vmap ,' c''<ESC>P
vmap ,< c<><ESC>P
vmap ,> c<><ESC>P
" Splits
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>
" pane switching
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
" Make a new line
nmap <CR> o<ESC>
nmap <S-CR> O<ESC>
" Quickly change current word
nmap <space> ciw


""" Plugin Settings
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

" Editor Plugins
" file explorer
Plug 'scrooloose/nerdtree'
" switch between files
Plug 'vim-scripts/a.vim'
" Maximum pane
Plug 'szw/vim-maximizer'
" file descriptions
Plug 'majutsushi/tagbar'
"" Editing Plugins
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
" Create scratch pad
Plug 'mtth/scratch.vim'
" Nice startup screen
Plug 'mhinz/vim-startify'
" Searching
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
" Editing
Plug 'mikewest/vimroom'
Plug 'benmills/vimux'
Plug 'majutsushi/tagbar'
Plug 'inside/vim-search-pulse'
Plug 'triglav/vim-visual-increment'
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-lion'
" Syntax
Plug 'tpope/vim-markdown'
Plug 'cespare/vim-toml'
"" Rust
Plug 'rust-lang/rust.vim'
" Zig
Plug 'ziglang/zig.vim'
"" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
" Manage tags
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Colorscheme
colorscheme gruvbox

"""" Vimux
nnoremap <leader>t :call VimuxRunCommand("cargo test\n", 0)<CR>
nnoremap <leader>r :call VimuxRunCommand("cargo run\n", 0)<CR>
nnoremap <leader>, :call VimuxRunCommand("!!\n", 0)<CR>

""" NERDTree Settings
map <Leader>n :NERDTreeToggle<CR>

""" Colorscheme Settings
syntax enable
set background=dark

""" Tabularize Settings
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap ap :Tabularize 

""" Scratch settings
nmap <Leader>es :Scratch<CR>

""" Maximizer Toggle
nmap <Leader>z :MaximizerToggle<CR>

""" Ctrl-p Settings
let g:ctrlp_custom_ignore = '\v[\/]dist$'
let g:ctrlp_max_files=0

""" EasyMotion Settings
nmap <Leader>p <Plug>(easymotion-overwin-w)

""" Rooter settings
" if the file is not in a project, use current dir
let g:rooter_change_directory_for_non_project_files = 'current'

""" Fugitive settings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>

" Pulse settings
let g:vim_search_pulse_duration = 51

""" Tagbar settings
nmap <Leader>b :TagbarToggle<CR>

""" Language Specific Settings
"" FORTH
" forth syntax
au BufNewFile,BufRead *.frt set filetype=forth
au BufNewFile,BufRead *.fs set filetype=forth

""" C/C++
" Open cpp and h file together
nmap <Leader>et :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" C aliases
imap prf printf("");<ESC>hhi


" HexMode stuff for easy hex editing
nnoremap <C-H> :call ToggleHex()<CR>
inoremap <C-H> <Esc>:call ToggleHex()<CR>
vnoremap <C-H> :<C-U>call ToggleHex()<CR>

" ex command for toggling hex mode - define mapping if desired
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
