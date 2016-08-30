""""""""""""""""""""""""
""Start of my Settings""
""""""""""""""""""""""""

""""""""""""""""""""""""
""General Settings""""""
""""""""""""""""""""""""
set nocompatible
set ai
set ic
set ruler
set ts=4
set sw=4
set bs=2
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set nobackup 
set backspace=indent,eol,start
set matchpairs+=<:>
set noeb
set nowrap
set number
set showmode
set smartindent
set mouse=a
set smarttab
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

" allow buffers to contain unsaved changes when not in use
set hidden

set t_Co=256
set cmdheight=1

" Set colors
colorscheme desert

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

"" Search 
set smartcase
set incsearch

" set runtimepath=~/_vim,$VIMRUNTIME

""""""""""""""""""""""""""""""""
""General Keymap Settings"""""""
""""""""""""""""""""""""""""""""
nmap <Leader>h :noh<CR> 

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
" Tab over and back in normal mode 
nmap <S-Tab> <gV
nmap <Tab> >gV
" quicker tab ball
nmap <Leader>b :tab ball<CR>
" Unmapping for windows 
" unmap <C-A> 
" unmap <C-V> 
" unmap <C-X> 
" Source vimrc
nmap <Leader>s :source $MYVIMRC<CR><CR>
" Edit vimrc
nmap <Leader>rc :tabnew<CR>:e $MYVIMRC<CR>
" Mappings for tabs
nmap <Leader>tn :tabnew<CR>
nmap <Leader>> :tablast<CR>
nmap <Leader>< :tabfirst<CR>
nmap <F8> :tabp<CR>
nmap <F9> :tabn<CR>
nmap <F4> :bnext<CR>
nmap <F5> :bprev<CR>
" Use backupdir if exists
set   backupdir=./_backup,.,/tmp
set   directory=.,./_backup,/tmp
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
imap ,__ ____<Left><Left>
imap ,_i __init__
imap ,_nm if __name__ == "__main__":<CR>

"" Java
" Run java program
nmap <Leader>ja !javac <C-R>% && java %<
" Java specific
nmap <f7> :w<CR>:!javac %<CR>:!java %<CR>

""" Haskell


""""""""""""""""""""""""
"""Plugin Settings""""""
""""""""""""""""""""""""
syntax on
filetype plugin indent on

" if has('win32') || has('win64')
"     set runtimepath=path/to/home.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,path/to/home.vim/after
" endif

" Set up plugins- ctrl-p, ghc-mod, neco-ghc, neocomplete, nerdcommenter,
" nerdtree, supertab, syntastic, tabular, tagbar, tlib_vim,
" vim-addon-mw-utils,
" vim-easymotion, vim-proc, vim-sneak, vim-snipmate
execute pathogen#infect()

""" Syntastic
map <Leader>y :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""" NERDTree Settings
map <Leader>n :NERDTreeToggle<CR>

""" Tabularize Settings
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

""" Ctrl-p Settings
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

""" EasyMotion Settings
nmap <Leader><Leader>l <Plug>(easymotion-overwin-w)

""" Tagbar Settings
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
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
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
