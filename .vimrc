
" Disable vi compatibility
set nocompatible

" set the leader for mappings
nnoremap ,, ,
let mapleader=","

" default to relative line numbers
set invrelativenumber

" Tab/space settings
set ts=4
set sw=4
set bs=2

set expandtab

"" auto indent
set ai

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
"set autoindent
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
nmap <Leader>s :source $MYVIMRC<CR><CR>
" Edit vimrc
nmap <Leader>rc :e $MYVIMRC<CR>
" remove search results
nmap <Leader>h :noh<CR>

" Make sure <Esc>==<C-[>
imap <C-[> <Esc>
nmap <C-[> <C-L>

" Insert mode movement
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

" tab toggles to last buffer
nmap <Tab> :b#<CR>

" exit insert mode with jk
inoremap jk <esc>

" Reformat whole document
nmap <Leader>= mzHmxgg=G`xzt`z

" Arrows scroll
nmap <Down> <C-e>
nmap <Up> <C-y>

" toggle relative line numbers
nmap <Leader>er :set invrelativenumber<CR>

" select last paste
nmap <Leader>v V`]

" <Leader>m for quickly saving a file
nmap <Leader>m :w<CR>

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

" Reselect visual block after indenting
vnoremap < <gv
vnoremap > >gv

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

Plug 'scrooloose/nerdtree'

Plug 'benmills/vimux'

"" Editing Plugins
" NOTE reavaluate this plugin
" Plug 'easymotion/vim-easymotion'

" NOTE reassess this plugin
" Plug 'jeetsukumaran/vim-buffergator'

Plug 'airblade/vim-rooter'

" Align text
Plug 'godlygeek/tabular'

" Search
Plug 'mileszs/ack.vim'

"" Extra displays/Information
" NOTE reavaluate this plugin
Plug 'tpope/vim-fugitive'

" Nice startup screen
Plug 'mhinz/vim-startify'

" Fast file search
Plug 'kien/ctrlp.vim'

Plug 'mikewest/vimroom'

"" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'


call plug#end()

""" Vim Diff
nmap <Leader>l :diffget LOCAL<CR>
nmap <Leader>o :diffget REMOTE<CR>

" pane switching
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Colorscheme
colorscheme gruvbox

" Startify
let g:startify_session_dir = '~/.vim_sessions'

"""" Vimux
" rerun the last command
nnoremap <leader>r :call VimuxRunCommandInDir("!!", 0)<CR>

""" NERDTree Settings
map <Leader>n :NERDTreeToggle<CR>

""" Ctrl-p Settings
map <silent> <Leader>t :CtrlP()<CR>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

""" EasyMotion Settings
nmap <Leader>p <Plug>(easymotion-overwin-w)

""" Rooter settings
" if the file is not in a project, use current dir
let g:rooter_change_directory_for_non_project_files = 'current'

""" Fugitive settings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>


""""""""""""""""""""""""
"""Hex Mode Settings""""
""""""""""""""""""""""""
" Enter and exit HexMode
nnoremap <C-H> :call ToggleHex()<CR>
inoremap <C-H> <Esc>:call ToggleHex()<CR>
vnoremap <C-H> :<C-U>call ToggleHex()<CR>

" ex command for toggling hex mode
command -bar Hexmode call ToggleHex()

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
  
""""""""""""""""""""""""
""" Fix Issues with Syntax Highlighting an sessions"""
""""""""""""""""""""""""
fu! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()

set sessionoptions-=options  " Don't save options

