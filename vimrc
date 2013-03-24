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

nnoremap <leader>P :set paste<cr>
nnoremap <leader>p :set nopaste<cr>

"" From https://github.com/skwp/dotfiles/blob/master/vimrc

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" https://github.com/skwp/dotfiles/blob/master/vim/plugin/settings/yadr-window-killer.vim
" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

"" End From skwp


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
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
nnoremap <leader>l :TagbarToggle<CR>

" SuperTab integration with OmniComplete
" http://mirnazim.org/writings/vim-plugins-i-use/
let g:SuperTabDefaultCompletionType = "context"

nnoremap <leader>Hex :%!xxd<CR>
nnoremap <leader>hex :%!xxd -r<CR>

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

command! -complete=file -nargs=* Gorun call s:RunShellCommand('go run %'.<q-args>)

au BufRead,BufNewFile *.twig set filetype=htmljinja

