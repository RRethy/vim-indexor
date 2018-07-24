" indexor.vim - Vim plugin for indexing lists
" Last Change:	2018 July 15
" Maintainer:	Adam P. Regasz-Rethy (RRethy) <rethy.spud@gmail.com>
" Version: 0.1

if exists("g:loaded_indexor")
  finish
endif
let g:loaded_indexor = 1

let s:commands_dict = {'AddNumberedIndexes': 'add_numbers',
      \ 'AddLowercaseLetterIndexes': 'add_lowercase_letters',
      \ 'AddUppercaseLetterIndexes': 'add_uppercase_letters',
      \ 'AddUppercaseNumeralIndexes': 'add_roman_numerals_upper',
      \ 'AddLowercaseNumeralIndexes': 'add_roman_numerals_lower'
      \ }

for key in keys(s:commands_dict)
  if !exists(':' . key)
    exe 'command! -range=% ' . key . ' <line1>,<line2>call indexor#' . s:commands_dict[key] . '()'
  endif
endfor
