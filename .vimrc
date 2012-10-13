" References:
"  http://stevelosh.com/blog/2010/09/coming-home-to-vim/

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set nocompatible

set modelines=0

colorscheme desert
"colorscheme vividchalk/colors/vividchalk

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent
set showmode
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
set laststatus=2
set relativenumber

" nnoremap / /\v
" vnoremap / /\v
set ignorecase
set smartcase

set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" nnoremap <leader>P :set paste<cr>
" nnoremap <leader>p :set nopaste<cr>paste 

nnoremap ; :

" from https://bitbucket.org/tednaleid/vimrc/src/1316ff2f757e/.vimrc
" keep from having to hit ESC all the time
inoremap jk <Esc>
inoremap jj <Esc>
nnoremap <leader><F5> :source $MYVIMRC<cr>:echo 'sourced '.$MYVIMRC<cr>

" Tagbar
let g:tagbar_userarrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" SuperTab integration with OmniComplete
" http://mirnazim.org/writings/vim-plugins-i-use/
let g:SuperTabDefaultCompletionType = "context"

