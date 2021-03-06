fun! indexor#add_numbers() range
  let l:i=1
  let l:lnum=a:firstline
  let maxw=strlen(string(a:lastline - a:firstline + 1))
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, l:i, maxw)
    let l:i+=1
    let l:lnum+=1
  endwhile
endf

" Adds lowercase letters to the start of each line in the range (max of 26 lines currently)
fun! indexor#add_lowercase_letters() range
  let l:letters=['a', 'b', 'c', 'd', 'e',
        \ 'f', 'g', 'h', 'i', 'j',
        \ 'k', 'l', 'm', 'n', 'o',
        \ 'p', 'q', 'r', 's', 't',
        \ 'u', 'v', 'w', 'x', 'y',
        \ 'z']
  let l:i=0
  let l:lnum=a:firstline
  let maxw=(a:lastline - a:firstline + 1) / 26
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, repeat(l:letters[l:i%26], l:i / 26 + 1), maxw)
    let l:i+=1
    let l:lnum+=1
  endwhile
endfun

" Adds uppercase letters to the start of each line in the range (max of 26 lines currently)
fun! indexor#add_uppercase_letters() range
  let l:letters=['A', 'B', 'C', 'D', 'E',
        \ 'F', 'G', 'H', 'I', 'J',
        \ 'K', 'L', 'M', 'N', 'O',
        \ 'P', 'Q', 'R', 'S', 'T',
        \ 'U', 'V', 'W', 'X', 'Y',
        \ 'Z']
  let l:i=0
  let l:lnum=a:firstline
  let maxw=(a:lastline - a:firstline + 1) / 26
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, repeat(l:letters[l:i%26], l:i / 26 + 1), maxw)
    let l:i+=1
    let l:lnum+=1
  endwhile
endfun

fun! indexor#add_roman_numerals_upper() range
  let hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  let tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  let ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  let l:i=1
  let l:lnum=a:firstline

  let l:maxw=0
  while l:lnum <= a:lastline
    let cur=strlen(s:To_roman(l:i, hundreds, tens, ones, 'M'))
    if cur>l:maxw
      let l:maxw=cur
    endif
    let l:i+=1
    let l:lnum+=1
  endwhile

  let l:i=1
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, s:To_roman(l:i, hundreds, tens, ones, 'M'), l:maxw)
    let l:i+=1
    let l:lnum+=1
  endwhile
endfun

fun! indexor#add_roman_numerals_lower() range
  let hundreds = ["", "c", "cc", "ccc", "cd", "d", "dc", "dcc", "dccc", "cm"]
  let tens = ["", "x", "xx", "xxx", "xl", "l", "lx", "lxx", "lxxx", "xc"]
  let ones = ["", "i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix"]
  let l:i=1
  let l:lnum=a:firstline

  let l:maxw=0
  while l:lnum <= a:lastline
    let cur=strlen(s:To_roman(l:i, hundreds, tens, ones, 'm'))
    if cur>l:maxw
      let l:maxw=cur
    endif
    let l:i+=1
    let l:lnum+=1
  endwhile

  let l:i=1
  let l:lnum=a:firstline
  while l:lnum <= a:lastline
    call s:Prepend_index(l:lnum, s:To_roman(l:i, hundreds, tens, ones, 'm'), l:maxw)
    let l:i+=1
    let l:lnum+=1
  endwhile
endfun

fun! s:To_roman(n, hundreds, tens, ones, m)
  let numeral=""
  let curnum=a:n

  while curnum >= 1000
    let numeral.=a:m
    let curnum-=1000
  endwhile

  let h_count=curnum / 100
  let curnum=curnum % 100

  let t_count=curnum / 10
  let curnum=curnum % 10

  let numeral.=a:hundreds[h_count]
  let numeral.=a:tens[t_count]
  let numeral.=a:ones[curnum]

  return numeral
endfun

fun! s:Prepend_index(line, text, maxwidth)
  exe a:line . "norm 0i" . printf('%' . a:maxwidth . 's. ', a:text)
endfun
