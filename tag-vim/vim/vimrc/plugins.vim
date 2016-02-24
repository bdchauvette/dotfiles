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
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'justinmk/vim-sneak'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Color schemes
Plug 'morhetz/gruvbox'

" Lazy Loaded plugins
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'html', 'jinja', 'css'] }
Plug 'csscomb/vim-csscomb', { 'for': ['css'] }

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


" deoplete
" -----------------------------------------------------------------------------

" If set to 0, deoplete will have to be started manually
let g:deoplete#enable_at_startup = 1


" EasyGrep
" -----------------------------------------------------------------------------

" Default to searching the whole project repository when using :GrepRoot
let g:EasyGrepRoot = 'repository'

" Use the default `grepprg` (ag) rather than `vimgrep`
let g:EasyGrepCommand = 1

" Ignore the following files
let g:EasyGrepFilesToExclude=".git,node_modules"

" Open results in a split rather than tabs
let g:EasyGrepReplaceWindowMode = 1

" Mappings
map <silent> <leader>go <plug>EgMapGrepOptions
map <silent> <leader>gw <plug>EgMapGrepCurrentWord_v
vmap <silent> <leader>gw <plug>EgMapGrepSelection_v
map <silent> <leader>gW <plug>EgMapGrepCurrentWord_V
vmap <silent> <leader>gW <plug>EgMapGrepSelection_V
map <silent> <leader>ga <plug>EgMapGrepCurrentWord_a
vmap <silent> <leader>ga <plug>EgMapGrepSelection_a
map <silent> <leader>gA <plug>EgMapGrepCurrentWord_A
vmap <silent> <leader>gA <plug>EgMapGrepSelection_A
map <silent> <leader>gr <plug>EgMapReplaceCurrentWord_r
vmap <silent> <leader>gr <plug>EgMapReplaceSelection_r
map <silent> <leader>gR <plug>EgMapReplaceCurrentWord_R
vmap <silent> <leader>gR <plug>EgMapReplaceSelection_R

" NerdTree
" -----------------------------------------------------------------------------
nnoremap <C-t> :NERDTreeToggle<cr>
let NERDTreeMapActivateNode = 'l'
let NERDTreeMapOpenRecursively = 'L'
let NERDTreeMapCloseDir = 'h'
let NERDTreeMapCloseChildren = 'H'

" NeoMake
" -----------------------------------------------------------------------------
let g:neomake_javascript_enabled_makers = ['eslint_d']

" Run neomake whenever a buffer is written
autocmd! BufWritePost * Neomake

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
let g:syntastic_javascript_eslint_exec = "eslint_d"


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
