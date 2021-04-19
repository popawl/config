" Pathogen
execute pathogen#infect()

" Don't make efforts to make Vim VI-compatible
set nocompatible

" Turn on filetype detection
:filetype on

" Turn on syntax highlighting if more than 1 color is available
syntax enable

" Turn on auto-indentation for C-syntax languages
:au FileType python,c,cpp,java set cindent

" Show matching brackets
set showmatch

" Set one depending on terminal type
set background=dark
" set background=light

" Makes backspace behave as expected
set backspace=2

"Set the tab key to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Turn on visual wrapping
set wrap

"Wrap at 120 characters
set textwidth=120

" Turn on highlighting for searching
set hlsearch

" Show cursor line and column position
set ruler

" Show line numbers
set number

" GUI settings
"set guifont=Consolas:h10
set guifont=Fira\ Code\ 10
colorscheme pencil
set background=light
set guioptions -=T
set mouse=c
au GUIEnter * simalt ~x

" Search highlighting
set hlsearch

" Extras
nmap <F9> :TagbarToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
let g:NERDCreateDefaultMappings = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

autocmd FileType python NERDTree | wincmd p
autocmd FileType python TagbarOpen
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F6> :w<CR>:exec '!pyflakes' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:exec '!pyflakes' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F7> :w<CR>:exec '!black' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F7> <esc>:w<CR>:exec '!black' shellescape(@%, 1)<CR>

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
