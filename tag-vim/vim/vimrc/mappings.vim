"
" File:    mappings.vim
" Author:  Ben Chauvette <bdchauvette@gmail.com>
"
" ----
"
" Custom keyboard mappings for vim
"
" Plugin-related bindings are found in `plugins.vim`
"
" ----


" 01. Fn Keys
" =============================================================================
" Prevent <f1> from opening the help window
map <f1> <nop>

"noremap <f1>
"noremap <f2>
"noremap <f3>
noremap <f4> :bwipeout!<cr>

"noremap <f5> @plugin: UndoTree
"noremap <f6>
"noremap <f7>
"noremap <f8> @plugin: tabular

noremap <f9> :call CSScomb()<cr>
"noremap <f10>
"noremap <f11>
"noremap <f12> @plugin: ultisnips


" 02. Motion
" =============================================================================

" If 'wrap' is on, make navigation keys
" use display lines instead of logical lines
"
" Ref: functions.vim
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")

vnoremap <silent> <expr> j ScreenMovement("j")
vnoremap <silent> <expr> k ScreenMovement("k")
vnoremap <silent> <expr> 0 ScreenMovement("0")
vnoremap <silent> <expr> ^ ScreenMovement("^")
vnoremap <silent> <expr> $ ScreenMovement("$")

nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

onoremap <silent> <expr> I ScreenMovement("^i")
onoremap <silent> <expr> A ScreenMovement("$a")

nnoremap <silent> <expr> I ScreenMovement("^i")
nnoremap <silent> <expr> A ScreenMovement("$a")


" 03. Editing
" =============================================================================

" Toggle search highlights
nnoremap <leader>h :nohlsearch<cr>

" Toggle spell-checking
nnoremap <leader>s :set spell!<cr>

" Strip trailing whitespace
nnoremap <leader>w :call StripWhitespace()<cr>

" Toggle display of non-printing characters
nnoremap <leader>np :call ToggleNonPrint()<cr>

" More intuitive increment / decrement
nnoremap + <c-a>
nnoremap - <c-x>


" 04. Motion
" =============================================================================

" Allow <.> to execute once for each line of a visual selection
vnoremap . :normal .<cr>

" Reselect visual block after in/outdent
vnoremap < <gv
vnoremap > >gv

" Jump to start and end of line using <H> and <L>
noremap H ^
noremap L g_

" Make <Y> yank till end of line
nnoremap Y y$
