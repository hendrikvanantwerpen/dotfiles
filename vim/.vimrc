set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set number
set foldmethod=syntax
imap <S-Tab> <C-o><<
nmap <S-Left> <C-W><Left>
nmap <S-Right> <C-W><Right>
nmap <S-Up> <C-W><Up>
nmap <S-Down> <C-W><Down>
nnoremap <ESC>q gqip

set modeline

set wildmode=longest,list

set history=1000

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on
let javascript_enable_domhtmlcss=1 
