"
" File:    plugins.vim
" Author:  Ben Chauvette <bdchauvette@gmail.com>
"
" ----
"
" This file serves two purposes:
"
"     1. Load plugins using Unbundle
"     2. Set plugin-specific settings
"
" ----

" 0. Download vim-plug if it's not already installed
" =============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" 1. Load Plugins
" =============================================================================
call plug#begin('~/.vim/bundle')
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'justinmk/vim-sneak'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Lazy Loaded plugins
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'html', 'jinja'] }

" JavaScript Plugins
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

" Jinja Plugins
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja' }
call plug#end()

" 2. Set plugin-specific settings
" =============================================================================


" vim-airline
" -----------------------------------------------------------------------------

" Clear the warning line
let g:airline_section_warning=''

" Disable powerline fonts
let g:airline_powerline_fonts = 0

" Enable extensions
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1


" CtrlP
" -----------------------------------------------------------------------------

" Quickly open CtrlP in buffer mode
nnoremap <leader>p :CtrlPBuffer<cr>

" if available, use ag for populating the buffer
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
endif


" neocomplete
" -----------------------------------------------------------------------------

" If set to 0, neocomplete will have to be started manually
let g:neocomplete#enable_at_startup = 1

" Max number of items to show in popup
let g:neocomplete#max_list = 20


" SuperTab
" -----------------------------------------------------------------------------

" UltiSnips intercepts <tab>, but if it doesn't find a snippet it will
" fall through and pass it along to SuperTab.
let g:SuperTabDefaultCompletionType='<c-x><c-o>'


" syntastic
" -----------------------------------------------------------------------------

" display all errors when using multiple checkers
let g:syntastic_aggregate_errors = 1

" label which checker produced the error message
let g:syntastic_id_checkers = 1

" javascript
let g:syntastic_javascript_checkers = ['eslint']


" tabular
" -----------------------------------------------------------------------------
noremap <F8> :Tabularize /
noremap <s-f8> :Tabularize<cr>


" tern
" -----------------------------------------------------------------------------

let g:tern_map_prefix = '<leader>'
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'


" UndoTree
" -----------------------------------------------------------------------------
noremap <f11> :UltiSnipsEdit<cr>


" UndoTree
" -----------------------------------------------------------------------------
noremap <leader>u :UndotreeToggle<cr>

" vim-jsx
" -----------------------------------------------------------------------------
let g:jsx_ext_required = 0
