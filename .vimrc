" Enable line numbers
set number                  " Show line numbers
set relativenumber          " Show relative line numbers

" Enable syntax highlighting
syntax on                   " Enable syntax highlighting

" Highlight comments in yellow
highlight Comment ctermfg=yellow guifg=yellow

" Enable auto-indentation
set autoindent              " Enable auto-indenting
set smartindent             " Enable smart indenting

" Set tab spacing
set tabstop=4               " Number of spaces tabs count for
set shiftwidth=4            " Number of spaces to use for each step of (auto)indent
set expandtab               " Use spaces instead of tabs

" Other useful settings
set clipboard=unnamedplus   " Use system clipboard
set ignorecase              " Ignore case when searching
set smartcase               " Override ignorecase if search contains uppercase

autocmd BufWritePost ~/Suckless/dwmblocks/config.h !cd ~/Suckless/dwmblocks && sudo make install && killall -q dwmblocks && setsid dwmblocks &

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

hi Directory guifg=#FF0000 ctermfg=blue

" Set Leader key to Ctrl
let mapleader = "\<C- >"

" Switch between tabs using Ctrl + tn and Ctrl + tp
nnoremap <C-t>n :tabnext<CR>
nnoremap <C-t>p :tabprev<CR>

