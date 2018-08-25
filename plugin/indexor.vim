" indexor.vim - Vim plugin for indexing lists
" Last Change:	2018 July 15
" Maintainer:	Adam P. Regasz-Rethy (RRethy) <rethy.spud@gmail.com>
" Version: 0.1

if exists("g:loaded_indexor")
  finish
endif
let g:loaded_indexor = 1

let s:commands_dict = {'IndexorNumbers': 'add_numbers',
      \ 'IndexorLowercaseLetters': 'add_lowercase_letters',
      \ 'IndexorUppercaseLetters': 'add_uppercase_letters',
      \ 'IndexorUppercaseNumerals': 'add_roman_numerals_upper',
      \ 'IndexorLowercaseNumerals': 'add_roman_numerals_lower'
      \ }

for key in keys(s:commands_dict)
  if !exists(':' . key)
    exe 'command! -range=% ' . key . ' <line1>,<line2>call indexor#' . s:commands_dict[key] . '()'
  endif
endfor
