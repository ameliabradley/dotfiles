set wrap
set linebreak
syntax on

filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

execute pathogen#infect()

" Sometimes I want to disable highlighting after I search
nmap <silent> <C-N> :silent noh<CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

""" Console
if v:version >= 700
    highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Black
    highlight PMenuSel   cterm=bold ctermbg=Black ctermfg=White
    highlight PMenuSbar  cterm=bold ctermbg=DarkGreen
    highlight PMenuThumb cterm=bold ctermbg=Yellow
    highlight SpellBad   ctermbg=Red
    highlight SpellRare  ctermbg=Red
    highlight SpellLocal ctermbg=Red
    highlight SpellCap   ctermbg=Yellow
endif

set ts=2 sts=2 sw=2 et ai
"set ts=4 sts=4 sw=4 et ai
" set ts=4 sts=4 sw=4 et ai

highlight SpellBad   ctermbg=9 ctermfg=0

" A way to easily identify tabs
"highlight BlahTabs ctermbg=darkgreen guibg=lightgreen
"match BlahTabs /\t/
"au InsertEnter * match BlahTabs /\t/
"au InsertLeave * match BlahTabs /\t/
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set list
"hi Conceal ctermfg=7 ctermbg=NONE guifg=LightGrey guibg=NONE
    
" The default is yellow, which I can not read on!
highlight Search     ctermfg=Black      ctermbg=White     cterm=NONE
  
" Just make doubly sure that I know where the cursor is
function s:Cursor_Moved()
  let cur_pos = winline()
  if g:last_pos == 0
    set cul
    let g:last_pos = cur_pos
    return
  endif 
  let diff = g:last_pos - cur_pos
  if diff > 1 || diff < -1
    set cul
  else
    set nocul
  endif
  let g:last_pos = cur_pos
endfunction
autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0

"  move text and rehighlight -- vim tip_id=224 
vnoremap > ><CR>gv 
vnoremap < <<CR>gv 

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

set rtp+=/Users/alpha/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
set laststatus=2   " Always show the statusline
set nocompatible   " Disable vi-compatibility
"let g:Powerline_symbols = 'unicode'
set t_Co=256
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'fancy'
"set rtp+=/Users/nate/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
" For powerline font in MacVim
set guifont=Menlo\ For\ Powerline

highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=15 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=15 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=15 ctermbg=88 gui=none guifg=bg guibg=Red

set runtimepath^=~/.vim/bundle/ctrlp.vim
