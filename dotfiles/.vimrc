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

let g:user_zen_settings = {
\  'indentation' : '  '
\}

