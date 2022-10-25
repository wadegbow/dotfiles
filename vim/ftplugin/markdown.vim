setlocal spell spelllang=en_us " enable spellcheck 
setlocal wrap
setlocal linebreak
setlocal breakindent

" remove statusline and endofbuffer
hi StatusLineNC ctermfg=none
hi EndOfBuffer ctermfg=0 ctermbg=0

" activate goyo
Goyo 80