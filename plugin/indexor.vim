" indexor.vim - Vim plugin for indexing lists
" Last Change:	2018 July 15
" Maintainer:	Adam P. Regasz-Rethy (RRethy) <rethy.spud@gmail.com>
" Version: 0.1

if exists("g:loaded_indexor")
  finish
endif
let g:loaded_indexor=1

" Add numbers mappings {{{
if !hasmapto('<Plug>IndexorAdd_numbers')
  vmap <silent> <unique> <Leader>n <Plug>IndexorAdd_numbers
endif
noremap <unique> <script> <Plug>IndexorAdd_numbers <SID>Add_numbers
noremap <SID>Add_numbers :call <SID>Add_numbers()<CR>
"}}}

" Add lowercase letters mappings {{{
if !hasmapto('<Plug>IndexorAdd_lowercase_letters')
  vmap <silent> <unique> <Leader>l <Plug>IndexorAdd_lowercase_letters
endif
noremap <unique> <script> <Plug>IndexorAdd_lowercase_letters <SID>Add_lowercase_letters
noremap <SID>Add_lowercase_letters :call <SID>Add_lowercase_letters()<CR>
"}}}

" Add uppercase letters mappings {{{
if !hasmapto('<Plug>IndexorAdd_uppercase_letters')
  vmap <silent> <unique> <Leader>L <Plug>IndexorAdd_uppercase_letters
endif
noremap <unique> <script> <Plug>IndexorAdd_uppercase_letters <SID>Add_uppercase_letters
noremap <SID>Add_uppercase_letters :call <SID>Add_uppercase_letters()<CR>
"}}}

" Add uppercase roman numeral mappings {{{
if !hasmapto('<Plug>IndexorAdd_roman_numerals_upper')
  vmap <silent> <unique> <Leader>R <Plug>IndexorAdd_roman_numerals_upper
endif
noremap <unique> <script> <Plug>IndexorAdd_roman_numerals_upper <SID>Add_roman_numerals_upper
noremap <SID>Add_roman_numerals_upper :call <SID>Add_roman_numerals_upper()<CR>
"}}}

" Add lowercase roman numeral mappings {{{
if !hasmapto('<Plug>IndexorAdd_roman_numerals_lower')
  vmap <silent> <unique> <Leader>r <Plug>IndexorAdd_roman_numerals_lower
endif
noremap <unique> <script> <Plug>IndexorAdd_roman_numerals_lower <SID>Add_roman_numerals_lower
noremap <SID>Add_roman_numerals_lower :call <SID>Add_roman_numerals_lower()<CR>
"}}}

function! s:Add_numbers() range
  let l:i=1
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, l:i)
    let l:i+=1
    let l:lnum+=1
  endwhile
endfunction

" Adds lowercase letters to the start of each line in the range (max of 26 lines currently)
function! s:Add_lowercase_letters() range
  if a:lastline - a:firstline + 1 > 26
    echoerr "Unable to add letters to a list with more than 26 lines :("
    return
  endif
  let l:letters=['a', 'b', 'c', 'd', 'e',
        \ 'f', 'g', 'h', 'i', 'j',
        \ 'k', 'l', 'm', 'n', 'o',
        \ 'p', 'q', 'r', 's', 't',
        \ 'u', 'v', 'w', 'x', 'y',
        \ 'z']
  let l:i=0
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, l:letters[l:i])
    let l:i+=1
    let l:lnum+=1
  endwhile
endfunction

" Adds uppercase letters to the start of each line in the range (max of 26 lines currently)
function! s:Add_uppercase_letters() range
  if a:lastline - a:firstline + 1 > 26
    echoerr "Unable to add letters to a list with more than 26 lines :("
    return
  endif
  let l:letters=['A', 'B', 'C', 'D', 'E',
        \ 'F', 'G', 'H', 'I', 'J',
        \ 'K', 'L', 'M', 'N', 'O',
        \ 'P', 'Q', 'R', 'S', 'T',
        \ 'U', 'V', 'W', 'X', 'Y',
        \ 'Z']
  let l:i=0
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, l:letters[l:i])
    let l:i+=1
    let l:lnum+=1
  endwhile
endfunction

function! s:Add_roman_numerals_upper() range
  let hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  let tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  let ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  let l:i=1
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, s:To_roman(l:i, hundreds, tens, ones, 'M'))
    let l:i+=1
    let l:lnum+=1
  endwhile
endfunction

function! s:Add_roman_numerals_lower() range
  let hundreds = ["", "c", "cc", "ccc", "cd", "d", "dc", "dcc", "dccc", "cm"]
  let tens = ["", "x", "xx", "xxx", "xl", "l", "lx", "lxx", "lxxx", "xc"]
  let ones = ["", "i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix"]
  let l:i=1
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, s:To_roman(l:i, hundreds, tens, ones, 'm'))
    let l:i+=1
    let l:lnum+=1
  endwhile
endfunction

function! s:To_roman(n, hundreds, tens, ones, m)
  let numeral=""
  let curnum=a:n

  while curnum >= 1000
    let numeral+=a:m
    let curnum-=1000
  endwhile

  let h_count=curnum / 100
  let curnum=curnum % 100

  let t_count=curnum / 10
  let curnum=curnum % 10

  let numeral=numeral . a:hundreds[h_count]
  let numeral=numeral . a:tens[t_count]
  let numeral=numeral . a:ones[curnum]

  return numeral
endfunction

function! s:Prepend_index(line, text)
  exe a:line . "norm ^i" . a:text . ". "
endfunction
