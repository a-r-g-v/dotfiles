" system
set number 
set laststatus=2
set statusline=%F%r%h%=%c%p
set incsearch
set history=10000
set autoindent
set list
set wildmenu wildmode=list:full
set listchars=tab:\ \ ,eol:$
set nohlsearch
set cursorline
" tab
set expandtab
set tabstop<
set softtabstop=2
set shiftwidth=2
set incsearch
set cursorcolumn
set cursorline

" key
set backspace=eol,indent
let mapleader = ","
nmap <F5> <Plug>(quickrun)

nnoremap sw <C-w>w
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap sf :<C-u>Unite file<CR>
nnoremap sF :<C-u>Unite file_mru<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <F12> <C-]>
nnoremap <F11> <C-w><C-]>
nnoremap bb <C-t>
nnoremap sq :q<CR>

" syntack
syntax on

" plugin
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))
" FetchList
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'aquach/vim-http-client'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'itchyny/lightline.vim'
NeoBundle '5t111111/alt-gtags.vim' 
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}

NeoBundle "sudo.vim"
NeoBundle 'w0rp/ale'



" erlang
NeoBundle 'jimenezrick/vimerl'
" golang
NeoBundle 'fatih/vim-go'
" serverspec
NeoBundle 'glidenote/serverspec-snippets'
" hack
NeoBundle 'hhvm/vim-hack'
" elixir
NeoBundle 'elixir-lang/vim-elixir'
" cpp
NeoBundle "rhysd/vim-clang-format"



call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" color
colorscheme peachpuff
set t_Co=256

" golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" light

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component': {
        \   'readonly': '%{&readonly?"⭤":""}',
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" neobundle

if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = [
      \'~/.vim/bundle/serverspec-snippets',
      \'~/.vim/bundle/neosnippet-snippets/neosnippets',
      \]
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)


" nerdtree
au VimEnter * NERDTree
let NREDTreeShowHidden=0

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif




" ale

let g:ale_linters = {
\   'python': ['mypy', 'isort', 'pylint', 'yapf', 'prospector'],
\}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1


