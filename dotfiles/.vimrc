set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=2
set showmatch
set smartcase
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set nf=alpha,hex

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
syntax on

" Leaderをspaceに
let mapleader = "\<Space>"
" 便利キーマップ
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nmap <Leader><Leader> V
vmap <silent> <expr> P <sid>Repl()
vmap <silent> <expr> p <sid>Repl()

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Tab表示
set list
set listchars=tab:>\ 

" 全角スペース
highlight ZenkakuSpace ctermbg=red
match ZenkakuSpace /　/

autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview
" autocmd BufRead,BufNewFile *.ts setfiletype typescript

map <C-u> <Esc>
inoremap <C-c> <ESC>
noremap <C-c> <ESC>
nmap <F1> <Nop>
vmap <F1> <Esc>
imap <F1> <Esc>

map <F2> :set paste<CR>
map <F3> :set nonumber<CR>
autocmd InsertLeave * set nopaste

" paste problem
vnoremap <silent> <C-p> "0p<CR>
vnoremap <silent> <C-P> "0P<CR>

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




""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('mattn/emmet-vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('triglav/vim-visual-increment')
  call dein#add('terryma/vim-expand-region')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


"""""""""""""""""""""""""
" pluginここまで
noremap <C-Z> :Unite file_mru<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')



" setting
let g:user_zen_settings = {
\  'indentation' : '  '
\}
let g:php_cs_fixer_path = "~/vendor/bin/php-cs-fixer"


let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['php']
  \}

let g:syntastic_php_checkers = ['phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--standard=PSR2'
let g:syntastic_php_php_args = '-l'

let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2


au BufRead *.scm :ExtemporeOpenConnection()

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

" Required:
" filetype plugin indent on

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2


"nnoremap <ESC><ESC> :nohlsearch<CR>

" hack for disable SQL completion with C-c
let g:loaded_sql_completion = 1
let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key = '<C-c>sql'


" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
