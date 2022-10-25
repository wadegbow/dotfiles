set nocompatible
filetype plugin on
syntax on

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'lumiliet/vim-twig'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-bufferline'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'dkarter/bullets.vim'
Plug 'dim13/smyck.vim'
Plug 'wadegbow/vim-jrnl'
call plug#end()

set autoindent 
set expandtab 
set tabstop=4 
set shiftwidth=4
set relativenumber
set number
set t_Co=256
colorscheme smyck
hi Normal ctermbg=none


com! FormatJSON %!python -m json.tool


""""""""""""""""""""""
" KEYBOARD SHORTCUTS "
""""""""""""""""""""""

" sensible yank to clipboard
nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$

" buffer navigation
for i in range(1,9)
  execute "map <Leader>".i." :buffer".i."<cr>"
endfor
map <Leader>] :bnext<cr>
map <Leader>[ :bprev<cr>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


""""""""""""""""""""""""""""""""""""
" PLUGIN CUSTOMIZATIONS & SETTINGS "
""""""""""""""""""""""""""""""""""""

" ctrlp, probably needs removal
let g:ctrlp_working_path_mode = 0

" vimwiki config
let g:vimwiki_list = [{'path': '~/.gdrive/personal/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" automatically update links on read diary
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch',
    \ 'jrnl'
    \]
    
let g:jrnl_config_location = '~/.config/jrnl/jrnl.yaml'

" customization for goyo so that it will quit the previous buffer if it's the only remaining buffer
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
