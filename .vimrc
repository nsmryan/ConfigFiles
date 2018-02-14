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

set t_Co=256
set cmdheight=1

" set the leader for mappings
nnoremap ,, ,
let mapleader=","

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

" Set up the statusline
set statusline=%n\ %t\ %m\ %r\ %y\ %F\ %=\ %l\/%L\ (\%%%-p)
set laststatus=2

""""""""""""""""""""""""""""""""
""General Keymap Settings"""""""
""""""""""""""""""""""""""""""""
" Source vimrc
nmap <Leader>s :source $MYVIMRC<CR><CR>
" Edit vimrc
nmap <Leader>rc :e $MYVIMRC<CR>
" remove search results
nmap <Leader>h :noh<CR>
" No beeping or screenflash
set vb t_vb=
" Make sure <Esc>==<C-[>
imap <C-[> <Esc>
nmap <C-[> <C-L>
" Insert mode movement
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
nmap <Tab> :b#<CR>
" Unmapping for windows
" unmap <C-A>
" unmap <C-V>
" unmap <C-X>
" Use vimbackup as the backup and swap directory if one exists
set backupdir=./_vimbackup,./.vimbackup,.
set directory=./_vimbackup,./.vimbackup,.
" Reformat whole document
nmap <Leader>= mzHmxgg=G`xzt`z
" Make current file executable
nmap <Leader>+x :!chmod +x %
" Arrows scroll
nmap <Down> <C-e>
nmap <Up> <C-y>
" toggle relative line numbers
nmap <Leader>er :set invrelativenumber<CR>
nmap <Leader>eo :colorscheme solarized<CR>
nmap <Leader>eg :colorscheme corporation<CR>
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

"" Python
" Run Python script
nmap <F6> :w<CR>:!python %<CR>

""" C/C++
" Open cpp and h file together
nmap <Leader>et :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

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

Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'

"" Editing Plugins
Plug 'easymotion/vim-easymotion'
"Plug 'ervandew/supertab'
"Plug 'Shougo/neocomplete.vim'
"Plug 'garbas/vim-snipmate'
Plug 'airblade/vim-rooter'
" Align text
Plug 'godlygeek/tabular'
" Search
Plug 'mileszs/ack.vim'
" Plug 'justinmk/vim-sneak'

"" Extra displays/Information
Plug 'tpope/vim-fugitive'
" Create scratch pad
Plug 'mtth/scratch.vim'
" Nice startup screen
Plug 'mhinz/vim-startify'
Plug 'severin-lemaignan/vim-minimap'
" See register contents in pane
" Plug 'junegunn/vim-peekaboo'
" Fast file search
Plug 'kien/ctrlp.vim'
Plug 'mikewest/vimroom'

"" Color Schemes
Plug 'altercation/vim-colors-solarized'
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
Plug 'duythinht/inori'
Plug 'jnurmine/Zenburn'

"" Haskell
Plug 'neovimhaskell/haskell-vim'
" Plug 'eagletmt/neco-ghc'
"Plug 'scrooloose/nerdcommenter'
Plug 'DanielG/ghc-mod'
Plug 'eagletmt/ghcmod-vim'

" Session Management
Plug 'vim-scripts/Session-manager'
" Plug 'tpope/vim-obsession'
" Plug 'dhruvasagar/vim-prosession'

" Plug 'junegunn/goyo.vim'

"
Plug 'jeetsukumaran/vim-buffergator'

Plug 'benmills/vimux'

Plug 'arcticicestudio/nord-vim'
Plug 'fcpg/vim-fahrenheit'


Plug 'vimwiki/vimwiki'

call plug#end()

""" Vim Diff
nmap <Leader>l :diffget LOCAL<CR>
nmap <Leader>o :diffget REMOTE<CR>

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

" Colorscheme
colorscheme gruvbox

" Startify
let g:startify_session_dir = '~/.vim_sessions'

"""" Vimux
nnoremap <leader>l :call VimuxRunCommandInDir("love .", 0)<CR>
nnoremap <leader>r :call VimuxRunCommandInDir("luajit main.lua", 0)<CR>
nnoremap <leader>k :call VimuxRunCommandInDir("stack build", 0)<CR>
nnoremap <leader>j :call VimuxRunCommandInDir("stack exec CADH", 0)<CR>

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

""" Prosession settings
let g:prosession_dir='~/vimfiles/session'

""" Tabularize Settings
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap ap :Tabularize 

""" Scratch settings
nmap <Leader>es :Scratch<CR>

""" Ctrl-p Settings
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

""" EasyMotion Settings
nmap <Leader>p <Plug>(easymotion-overwin-w)

""" Rooter settings
" if the file is not in a project, use current dir
let g:rooter_change_directory_for_non_project_files = 'current'

""" Fugitive settings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>

""" Session Manager
nmap <Leader>sm :call SessionManagerToggle()<CR>

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
""""""""""""""""""""""""
"""End of my Settings"""
""""""""""""""""""""""""
