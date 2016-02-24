"
" File:    settings.vim
" Author:  Ben Chauvette <bdchauvette@gmail.com>
"
" ----
"
" This file is laid out following the categories in :options.
"
"     01. Important
"     02. Moving around, searching and patterns
"     03. Tags & Completion
"     04. Displaying text
"     05. Syntax, highlighting and spelling
"     06. Multiple windows
"     07. Multiple tab pages
"     08. Terminal
"     09. Using the mouse
"     10. GUI
"     11. Printing
"     12. Messages and info
"     13. Selecting text
"     14. Editing text
"     15. Tabs and indenting
"     16. Folding
"     17. Diff mode
"     18. Mapping
"     19. Reading and writing files
"     20. The swap file
"     21. Command line editing
"     22. Executing external commands
"     23. Running make and jumping to errors
"     24. Language specific
"     25. Multi-byte characters
"     26. Various
"
" ----


" 01. Important
" =============================================================================
set nocompatible             " Disable compatibility with vi


" 02. Moving around, searching and patterns
" =============================================================================
set autochdir                " Change to directory of file in buffer

set ignorecase               " Ignore case when searching...
set smartcase                " except when uppercase chars are in search

set whichwrap=b,<,>,h,l      " allow these chars to move across lines

set wildmenu                 " c-line completion showslist of matches

" Tab completion for wildmenu:
"   * First tab tries longest complete
"   * Second tab brings up a list
"   * All other tabs cycle through completion choices
set wildmode=longest,list,full

" Filetypes to ignore while autocompleting
set wildignore=*.bak,*.jpg,*.gif,*.png,*.log,*.aux,*.out,*.bbl,*.blg,*.svg


" 03. Tags & Completion
" =============================================================================

set completeopt-=preview


" 04. Displaying text
" =============================================================================
set nowrap                   " disable softwrapping

set number                   " display current linenumber
set relativenumber           " display relative linenumbers for other lines

set lazyredraw               " don't redraw while executing macros


" 05. Syntax, highlighting and spelling
" =============================================================================
set background=dark          " Dark background color
colo gruvbox                 " Use the gruvbox colorscheme

set cursorline               " Highlight the current cursor line
set nocursorcolumn           " Highlight the current cursor column
set colorcolumn=80           " Additional columns to highlight

set hlsearch                 " highlight matches while searching

syntax on                    " enable syntax highlighting
filetype indent on           " filetype dependent auto-indenting
filetype plugin on           " filetype dependent plugin loading


" 06. Multiple windows
" =============================================================================
set hidden                   " Allow buffers to remain open in background
set laststatus=2             " Always show a status line for the last window


" 07. Multiple tab pages
" =============================================================================


" 08. Terminal
" =============================================================================


" 09. Using the mouse
" =============================================================================
set mouse=a                  " Enable mouse support
set mousefocus               " Window focus follows mouse


" 10. GUI
" =============================================================================
set guioptions-=m            " Remove the menubar
set guioptions-=T            " Remove the toolbar
set guioptions-=e            " Remove the tab bar
set guioptions-=lrb          " Remove the scrollbars

" Set the font in gvim
if has("gui_running")
  set guifont=Source\ Code\ Pro\ for\ Powerline\ 9
endif

" 11. Printing
" =============================================================================


" 12. Messages and info
" =============================================================================
set shortmess=atI            " Turn off default startup message

set showcmd                  " Show partial command keys in the status line

set noerrorbells             " Disable audio bells
set visualbell               " Enable visual bells instead of audio ones
set t_vb=                    " Prevents visible bells from flashing

" The same settings as above, only these ones are
" ensured to come after the GUI has started
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


" 13. Selecting text
" =============================================================================


" 14. Editing text
" =============================================================================
set textwidth=79             " maximum line length
set linebreak                " wrap lines using chars from 'breakat'
set nolist                   " don't show tabs or EOL characters

set formatoptions-=t         " don't auto-wrap text
set formatoptions+=l         " don't auto-wrap text in insert mode
set formatoptions+=c         " auto-wrap comments
set formatoptions+=q         " allow comments to be formatted with <gq>
set formatoptions+=j         " remove comment char when joining lines
set formatoptions+=n         " recognize numbered lists


" 15. Tabs and indenting
" =============================================================================
set expandtab                " expand tabs to spaces in insert mode

let s:tabsize=2              " define our tabsize
let &tabstop=s:tabsize       " width of a <tab> in spaces
let &shiftwidth=s:tabsize    " number of spaces used in indenting
let &softtabstop=s:tabsize   " number of spaces to insert a tab


" 16. Folding
" =============================================================================


" 17. Diff mode
" =============================================================================


" 18. Mapping
" =============================================================================
set timeoutlen=250           " timeout for keyboard input


" 19. Reading and writing files
" =============================================================================
set backup                   " Automatic backups when overwriting a file
set backupdir=~/.vim/backups " Directory for backup files


" 20. The swap file
" =============================================================================
set directory=~/.vim/swaps   " Directory for swapfiles


" 21. Command line editing
" =============================================================================


" 22. Executing external commands
" =============================================================================


" 23. Running make and jumping to errors
" =============================================================================

" if available, use ag for grepping
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif



" 24. Language specific
" =============================================================================


" 25. Multi-byte characters
" =============================================================================
set encoding=utf-8           " Character encoding used by vim


" 26. Various
" =============================================================================
set gdefault                 " Make 'g' flag default for search & replace

let g:netrw_liststyle=3      " Use tree-style in netrw
