" References:
"  http://stevelosh.com/blog/2010/09/coming-home-to-vim/

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set rtp+=~/.vim/bundle/go
filetype plugin indent on

syntax on

" Make vim work nice inside a screen session.
" - HOME and END keys were not working in vim when inside a screen session
" - this if statement fixed that.
" - http://vim.wikia.com/wiki/GNU_Screen_integration
if match($TERM, "screen") != -1
	set term=xterm
endif

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

" Show buffer list and prompt for buffer number
" http://superuser.com/a/113213
map <F4> :ls<CR>:buffer<space>

" Map Ctrl-PgUp and Ctrl-PgDn to next and previous buffers
nnoremap [6;5~ :bprevious!<CR>
nnoremap [5;5~ :bnext!<CR>

" Tagbar
let g:tagbar_userarrows = 1
"let g:tagbar_type_javascript = {
"	\ 'ctagsbin' : '/usr/local/lib/jsctags'
"\}
nnoremap <leader>l :TagbarToggle<CR>

" SuperTab integration with OmniComplete
" http://mirnazim.org/writings/vim-plugins-i-use/
let g:SuperTabDefaultCompletionType = "context"

