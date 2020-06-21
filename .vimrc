" Pathogen
execute pathogen#infect()

" Don't make efforts to make Vim VI-compatible
set nocompatible

" Turn on filetype detection
:filetype on

" Turn on syntax highlighting if more than 1 color is available
if &t_Co > 1
    syntax enable
endif

" Turn on auto-indentation for C-syntax languages
:au FileType c,cpp,java set cindent

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
set guifont=Source\ Code\ Pro\ Semibold\ 8
colorscheme pencil
set background=light

" Search highlighting
set hlsearch

" Extras
nmap <F8> :TagbarToggle<CR>
