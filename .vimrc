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
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" syntack
syntax on

" plugin
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))
" FetchList
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'hhvm/vim-hack'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'StanAngeloff/php.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" color
colorscheme peachpuff

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
