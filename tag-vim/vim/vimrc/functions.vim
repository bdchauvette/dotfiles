"
" File:    functions.vim
" Author:  Ben Chauvette <bdchauvette@gmail.com>
"
" ----
"
" Contains some useful functions that will be automatically loaded by vim
"
" ----


" ScreenMovement(movement)
" =============================================================================
" Author: Rick
" Source: http://stackoverflow.com/a/4952200
" Desc:   When wrap is turned on, makes movement keys follow display
"         lines instead of logical ones.
" -----------------------------------------------------------------------------
function! ScreenMovement(movement)
 if &wrap
  return "g" . a:movement
 else
  return a:movement
 endif
endfunction


" StripWhiteSpace()
" =============================================================================
" Author:  Mathias Bynens
" Source:  https://github.com/mathiasbynens/dotfiles/blob/master/.vimrc
" Desc:    Strips trailing whitespace from buffer
" -----------------------------------------------------------------------------
function! StripWhitespace()
  let old_cursor=getpos(".")
  let old_query=getreg('/')
  :%s/\s\+$//e
  call setpos('.', old_cursor)
  call setreg('/', old_query)
endfunction


" ToggleNonPrint()
" =============================================================================
" Desc:    Toggles the display of non-printing characters
" -----------------------------------------------------------------------------
function! ToggleNonPrint()
  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  set list!
endfunction


" OpenVimConfig()
" =============================================================================
" Desc:    Opens vim configuration files for editing
" -----------------------------------------------------------------------------
function! OpenVimConfig()
  let config_dir = "$HOME/.vim/vimrc/"
  let config_files = [
    \ "filetypes.vim",
    \ "functions.vim",
    \ "mappings.vim",
    \ "plugins.vim",
    \ "settings.vim"
    \]

  edit $MYVIMRC
  for file in config_files
    execute 'edit' config_dir . file
  endfor
endfunction

" CSScomb()
" =============================================================================
" Desc:     Cleans up css using csscomb
" -----------------------------------------------------------------------------
function! CSScomb()
  set autoread
  execute "silent !csscomb " . expand('%')
  redraw!
  set noautoread
endfunction
