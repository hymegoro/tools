set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=2
set showmatch

" Tab表示
set list
set listchars=tab:>\ 

" 全角スペース
highlight ZenkakuSpace ctermbg=red
match ZenkakuSpace /　/

map <C-u> <Esc>
nmap <F1> <Nop>
vmap <F1> <Esc>
imap <F1> <Esc>

map <F2> :set noautoindent<CR>
map <F3> :set nonumber<CR>
noremap <F4> <Esc>:syntax sync fromstart<CR>
inoremap <F4> <C-o>:syntax sync fromstart<CR>

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
autocmd! BufRead,BufNewFile *.tt set filetype=html

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" complete names with <TAB>
function InsertTabWrapper()
    let col = col('.') - 1 
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

function FirefoxReload()
    execute '!~/tools/scripts/firefox_reload'
    redraw!
endfunction

command! -bar FirefoxReload call FirefoxReload()
command! -bar StartReload StopReload | autocmd BufWritePost <buffer> FirefoxReload
command! -bar StopReload autocmd! BufWritePost <buffer>

map <F5> :StartReload<CR>

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/hacker/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/hacker/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'stephpy/vim-php-cs-fixer'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" setting
let g:user_zen_settings = {
\  'indentation' : '  '
\}

let g:php_cs_fixer_path = "~/vendor/bin/php-cs-fixer"
