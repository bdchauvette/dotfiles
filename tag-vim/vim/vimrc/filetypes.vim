"
" File:    filetypes.vim
" Author:  Ben Chauvette <bdchauvette@gmail.com>
"
" ----
"
" Filetype-specfic settings
"
" ----

" Markdown
" =============================================================================
au BufRead,BufNewFile *.md set filetype=markdown|setlocal wrap


" Jinja
" =============================================================================
au BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.njs  set filetype=jinja


" Javascript
" =============================================================================
au BufNewFile,BufRead *.js,*.jsx,*.es6 set filetype=javascript
