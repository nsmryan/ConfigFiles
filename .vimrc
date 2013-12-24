""""""""""""""""""""""""
""Start of my Settings""
""""""""""""""""""""""""
"" My options
set nocompatible
set ai
set ic
set ruler
set ts=4
set sw=4
set bs=2
set nobackup 
set backspace=indent,eol,start
set matchpairs+=<:>
set noeb
set nowrap
set number
set showmode
set smartindent
"set autoindent
set shortmess=a
set clipboard=unnamed
set go+=a
set expandtab
set tabstop=2
set shiftwidth=2
" Set font
set gfn=Lucida_Console:h8:b:cANSI

" Assemble z80 program with assemble.py
nmap <Leader>asm python ~/forth/assemble.py test.asm
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
nmap <Leader>h :noh<CR> 

" No beeping or screenflash
set vb t_vb=
" Make sure <Esc>==<C-[>
imap <C-[> <Esc>
nmap <C-[> <C-L>
" Select all and yank all into clipboard
nmap <Leader>a ggVG
nmap <Leader>ay ggVG"+y<CR>
" Clear line
nmap <Leader>d S<Esc>
" Insert space before and after character
nmap <Leader>i i <esc>wa <esc>
" Programming constructs
imap ,for for(int i = 0; i < <Esc>mai; i++) {<CR>}<Esc>`aa 
imap ,if <Esc>mzaif( ){<CR> <CR>}<Esc>`z3li
imap ,wh <Esc>mzawhile( ){<CR> <CR>}<Esc>`zwla
imap ,cl public class <C-R>%<Esc>dF.xa{<CR> <CR>public <C-R>%<Esc>dF.xa(){<CR> <CR>}<CR> <CR>}<Esc>
imap ,sys System.out.println();<Left><Left>
" Run java program
nmap <Leader>ja !javac <C-R>% && java %<
" Java open curly brace
imap )<space>{ )<space>{<cr>}<esc>O
" Save on f4
nmap <F4> :w<cr>
" Insert mode movement
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
" Make line without entering insert mode 
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>
" Make line in insert mode
imap ,o <Esc>o
imap ,O <Esc>O
" Mimics ctrl-v 
nmap <Leader>v "+p 
nmap <Leader>V "+P 
" Tab over and back in normal mode 
nmap <S-Tab> <gV
nmap <Tab> >gV
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
nmap <Leader>! F<i<!--<Esc>/\/><CR>la--><Esc><Leader>h
" Fold tab, fold all tabs
nmap <Leader>zt *V#jzf
nmap <Leader>zT :g:<<C-R><C-W>:norm 0t<wl,zt<CR>
" Open fold, open all folds
nmap <Leader>zo jzo
nmap <Leader>zO :g:<<C-R><C-W>:norm jzo
" &lgt; and &gt; to < and >
nmap <Leader>lt :%s:&lt;:<:g
nmap <Leader>gt :%s:&gt;:>:g
" Copy main register to system clipboard
nmap <Leader>y :let @+=@"<CR>
" Reuse last command
nmap <Leader><Leader> :<C-R>:
" Play commands on current line
nmap <Leader>play "zyy@z
" Edit end of previous line
imap ,- <Esc>kA
" Edit end of next line
imap ,+ <Esc>jA
" Use backupdir if exists
set   backupdir=./_backup,.,/tmp
set   directory=.,./_backup,/tmp
" Reformat whole document
nmap <Leader>= mzHmxgg=G`xzt`z
" Switch current word with one in yank register 0
nmap <Leader>sw diw"0P
" Switch current line with one in register 0
nmap <Leader>sl dd"0P
" Delete next line
nmap <Leader>dd jddk
" Put space on edges of next block
nmap <Leader><Space> %i <Esc>%a <Esc>
" In case of accidental return in insert mode
imap ,^ <Esc>ddkA
" Place ; at end of preceding line
imap ,; <Esc>mzkA;<Esc>`za
" Place ; at end of current line
nmap <Leader>; mzA;<Esc>`z
" Make getter and setter
nmap <Leader>gs mvw"zyww"xywGOpublic void set <Esc>"xpb~hXea(<C-R>z <C-R>x)<CR>{<CR>this.<C-R>x=<C-R>x;<CR>}<CR>public void get <C-R>x<Esc>b~hXea()<CR>{<CR>return <C-R>x;<CR>}<Esc>`v
" Make current file executable
nmap <Leader>+x :!chmod +x %
" Replace whole file with contents of clipboard
nmap <Leader>ar gg"zdG\V
"Python specific
imap ,__ ____<Left><Left>
imap ,_i __init__
imap ,_nm if __name__ == "__main__":<CR>
" Run script
nmap <F6> :w<CR>:!python %<CR>
" Java specific
nmap <f7> :w<CR>:!javac %<CR>:!java %<CR>
" Arrows scroll
nmap <Down> <C-e>
nmap <Up> <C-y>
" Asm do nothing
nmap \$ obreak<esc>
" Asm print Z
nmap \Z omov byte [videomem], 'Z'<esc>
" Run with makeos
nmap \r :w<cr>:!~/os/makeos.sh<cr>

"" vim2hs settings
let g:haskell_conceal_wide = 1

"haskell mode settings
au BufEnter *.hs compiler ghc
:let g:haddock_browser="/usr/bin/firefox"

"" Bundle settings
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
"
" " My bundles here:
Bundle 'dag/vim2hs'
Bundle 'lukerandall/haskellmode-vim'

filetype plugin indent on " required!

""""""""""""""""""""""""
"""End of my Settings"""
""""""""""""""""""""""""
