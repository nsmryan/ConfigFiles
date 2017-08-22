""""""""""""""""""""""""
""Start of my Settings""
""""""""""""""""""""""""

""""""""""""""""""""""""
""General Settings""""""
""""""""""""""""""""""""
set nocompatible
set ai
" set ruler
set number
set ts=4
set sw=4
set bs=2
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set backspace=indent,eol,start
set matchpairs+=<:>
" disable error bell 
set noeb
" disable line wrapping
set nowrap
" set showmode
" set smartindent
set mouse=a
" set smarttab
"set autoindent
set shortmess=a
set clipboard=unnamed
set go+=a
set expandtab
set tabstop=2
set shiftwidth=2
" Set font
set gfn=Lucida_Console:h8:b:cANSI
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set mat=2
set magic
" highlight search text
set hlsearch
" default to relative line numbers
set invrelativenumber
" show tabs
set listchars=tab:>-
" show number of selected lines
set showcmd
"
" do not redraw when executing macros
set lazyredraw

" allow buffers to contain unsaved changes when not in use
set hidden

" disable backups
set nobackup

" Buffer cycling
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

set t_Co=256
set cmdheight=1

" set the leader for mappings
nnoremap ,, ,
let mapleader=","

" Set colors
" colorscheme desert


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

" Don't add end of line
set noeol

"" Search
set smartcase
set incsearch

" set runtimepath=~/_vim,$VIMRUNTIME

" Set up the statusline
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\
set statusline=%n\ %t\ %m\ %r\ %y\ %F\ %=\ %l\/%L\ (\%%%-p)
set laststatus=2

function! FormatTestCases()
  norm gg0f Djj0f D
  4,$s:False:0:g
  4,$s:True:1:g
  4,$s/:: bool.*$//g
  4,$s/.:= //g
  4,$s/(# //g
  4,$s/#) :: Vect2.*%/,/g
  4,$s/^0\s*$/,0/g
  4,$s/^1\s*$/,1/g
  4,$norm 3J
  4,$s/ //g
endfunction

""""""""""""""""""""""""""""""""
""General Keymap Settings"""""""
""""""""""""""""""""""""""""""""
" remove search results
nmap <Leader>h :noh<CR>

" Set current directory to current file's directory
nmap <Leader>ed :cd %:p:h<CR>

" No beeping or screenflash
set vb t_vb=
" Make sure <Esc>==<C-[>
imap <C-[> <Esc>
nmap <C-[> <C-L>
" Select all and yank all into clipboard
nmap <Leader>a ggVG
nmap <Leader>ay ggVG"+y<CR>
" Save on f1
nmap <F1> :w<cr>
" Insert mode movement
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
" Make line without entering insert mode
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>
nmap <Tab> :b#<CR>
" quicker tab ball
nmap <Leader>b :tab ball<CR>
" Unmapping for windows
" unmap <C-A>
" unmap <C-V>
" unmap <C-X>
" Source vimrc
nmap <Leader>s :source $MYVIMRC<CR><CR>
" Edit vimrc
nmap <Leader>rc :e $MYVIMRC<CR>
" Mappings for tabs
nmap <Leader>tn :tabnew<CR>
nmap <Leader>> :tablast<CR>
nmap <Leader>< :tabfirst<CR>
nmap <F8> :tabp<CR>
nmap <F9> :tabn<CR>
nmap <F4> :bnext<CR>
nmap <F5> :bprev<CR>
" Use backupdir if exists
set backupdir=./_backup,.,/tmp
set directory=.,./_backup,/tmp
" Reformat whole document
nmap <Leader>= mzHmxgg=G`xzt`z
" Place ; at end of current line
nmap <Leader>; mzA;<Esc>`z
" Make current file executable
nmap <Leader>+x :!chmod +x %
" Replace whole file with contents of clipboard
nmap <Leader>ar gg"zdG\V
" Arrows scroll
nmap <Down> <C-e>
nmap <Up> <C-y>
" toggle relative line numbers
nmap <Leader>er :set invrelativenumber<CR>
" set colorscheme
nmap <Leader>eo :colorscheme solarized<CR>
nmap <Leader>ec :colorscheme corporation<CR>
" select last paste
nmap <Leader>v V`]
" jj to esc from insert mode
inoremap jj <ESC>
" <Leader>m for quickly saving a file
nmap <Leader>m :w<CR>
" place parens around selection
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
"""""""""""""""""""""""""""""""""
"""Language Specific Settings""""
"""""""""""""""""""""""""""""""""
"" JAS
au BufNewFile,BufRead *.jpp set filetype=c

"" FORTH
" forth syntax
au BufNewFile,BufRead *.frt set filetype=forth
au BufNewFile,BufRead *.fs set filetype=forth
" Set syntax to forth
nmap \f :set syntax=forth

"" Python
" Run Python script
nmap <F6> :w<CR>:!python %<CR>

"" Java
" Run java program
nmap <Leader>ja !javac <C-R>% && java %<
" Java specific
nmap <f7> :w<CR>:!javac %<CR>:!java %<CR>

""" Haskell

""" C/C++
nmap <Leader>{ $F{gElct{<CR><ESC>
nmap <Leader>et :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

""""""""""""""""""""""""
"""Plugin Settings""""""
""""""""""""""""""""""""
syntax on
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
filetype plugin indent on

""" vim-plug setup
call plug#begin('~/.vimfiles/plugged')

Plug 'kien/ctrlp.vim'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neocomplete.vim'
Plug 'garbas/vim-snipmate'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-rooter'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'

Plug 'neovimhaskell/haskell-vim'
" Plug 'eagletmt/neco-ghc'
Plug 'DanielG/ghc-mod'
Plug 'eagletmt/ghcmod-vim'

Plug 'mtth/scratch.vim'
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'
Plug 'alessandroyorba/alduin'

Plug 'jacoborus/tender.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'akmassey/vim-codeschool'
Plug 'vim-scripts/twilight256.vim'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'
Plug 'MaxSt/FlatColor'

" Plug 'junegunn/goyo.vim'
Plug 'mikewest/vimroom'

Plug 'mhinz/vim-startify'

Plug 'duythinht/vim-coffee'
Plug 'duythinht/inori'

" Plug 'junegunn/vim-peekaboo'
"

call plug#end()

" pane switching
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Cursor settings for Mintty in Cygwin
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"


" generate help documentation for loaded plugins
" Helptags

""" Syntastic
map <Leader>y :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
augroup syntastic_toggle
  autocmd!
  autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
augroup END

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

""" GHC Mod Settings
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

""" Super Tab Settings
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
augroup haskell_necoghcomni
  autocmd!
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

""" NERDTree Settings
map <Leader>n :NERDTreeToggle<CR>

""" Solarized Settings
syntax enable
set background=dark
colorscheme gruvbox

""" Prosession settings
let g:prosession_dir='~/vimfiles/session'

""" Tabularize Settings
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap ap :Tabularize 

""" Scratch settings
nmap <Leader>es :Scratch<CR>

""" Ctrl-p Settings
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

""" EasyMotion Settings
nmap <Leader><Leader>l <Plug>(easymotion-overwin-w)

""" Airline Settings
" let g:airline#extensions#tabline#enabled = 1
" set laststatus=2
" AirlineTheme luna

""" Rooter settings
" Add haskell-specific patterns
" this causes an error on startup
" let g:rooter_patterns+=["stack.yaml","*.cabal"]
" if the file is not in a project, use current dir
let g:rooter_change_directory_for_non_project_files = 'current'

""" Fugitive settings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>

""" Tagbar settings
nmap <Leader>g :TagbarToggle<CR>

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
""""""""""""""""""""""""
"""Hex Mode Settings""""
""""""""""""""""""""""""
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

""""""""""""""""""""""""
"""End of my Settings"""
""""""""""""""""""""""""
