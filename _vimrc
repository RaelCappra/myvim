set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set nobackup
set nowritebackup
set noundofile

"set guifont="Lucida_Console:h11,Monospace:h12"

execute pathogen#infect()
syntax on
filetype plugin indent on

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set number
set ruler
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

vnoremap y ygv
"clipboard
if has("clipboard")
    vnoremap <C-c> "+ygv
    vnoremap <C-v> "+p
    nnoremap <C-Space> gg"+yG<C-o><C-o>
    nnoremap <C-c> "+y
    nnoremap <C-c><C-c> "+yy
endif

"python2/python3
function Usepy2()
    let g:syntastic_python_python_exec = '/bin/python' 
    let g:syntastic_python_pylint_exec = '/bin/pylint' 
endfunction

function Usepy3()
    let g:syntastic_python_python_exec = '/bin/python3' 
    let g:syntastic_python_pylint_exec = '/bin/python3-pylint' 
endfunction

call Usepy3()


inoremap <C-]> <ESC>

"INDENTATION
set expandtab
set shiftwidth=4
set softtabstop=4

"SYNTASTIC RECOMMENDED SETTINGS
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"coisa linda
colorscheme mac_classic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_sings = 1
"let g:syntastic_quiet_messages = {'level':'warning'}

set wildmenu
set wildmode=longest,full

