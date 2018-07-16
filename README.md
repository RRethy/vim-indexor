# indexor.vim

Indexor.vim is a plugin for adding indices to a list of items without having to tediously type them in yourself or using a complicated macro with <CTRL-a>.

Consider have a grocery list as follows:

```
Bananas
Oranges
Milk
Maple Syrup
Dried Mango
Bananas
Oranges
Milk
Maple Syrup
Dried Mango
Bananas
Oranges
Milk
Maple Syrup
Dried Mango
```

We can add numbers to this list using `<Leader>n` which results in the following:

```
 1. Bananas
 2. Oranges
 3. Milk
 4. Maple Syrup
 5. Dried Mango
 6. Bananas
 7. Oranges
 8. Milk
 9. Maple Syrup
10. Dried Mango
11. Bananas
12. Oranges
13. Milk
14. Maple Syrup
15. Dried Mango
```

There is support for upper and lower case romand numerals with `<Leader>r` and `<Leader>R` respectively which results in the following:

```
   i. Bananas
  ii. Oranges
 iii. Milk
  iv. Maple Syrup
   v. Dried Mango
  vi. Bananas
 vii. Oranges
viii. Milk
  ix. Maple Syrup
   x. Dried Mango
  xi. Bananas
 xii. Oranges
xiii. Milk
 xiv. Maple Syrup
  xv. Dried Mango
```

and

```
   I. Bananas
  II. Oranges
 III. Milk
  IV. Maple Syrup
   V. Dried Mango
  VI. Bananas
 VII. Oranges
VIII. Milk
  IX. Maple Syrup
   X. Dried Mango
  XI. Bananas
 XII. Oranges
XIII. Milk
 XIV. Maple Syrup
  XV. Dried Mango
```

There is also support for upper and lower case letters with `<Leader>L` and `<Leader>l` respectively which results in the following:

```
a. Bananas
b. Oranges
c. Milk
d. Maple Syrup
e. Dried Mango
f. Bananas
g. Oranges
h. Milk
i. Maple Syrup
j. Dried Mango
k. Bananas
l. Oranges
m. Milk
n. Maple Syrup
o. Dried Mango
```

And

```
A. Bananas
B. Oranges
C. Milk
D. Maple Syrup
E. Dried Mango
F. Bananas
G. Oranges
H. Milk
I. Maple Syrup
J. Dried Mango
K. Bananas
L. Oranges
M. Milk
N. Maple Syrup
O. Dried Mango
```

## Installation

Install using your favorite package manager.

- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'RRethy/vim-indexor'` to .vimrc/init.vim
  2. Run `:PlugInstall`

## License

Copyright (c) Adam P. Regasz-Rethy.  Distributed under the same terms as Vim itself.
See `:help license`.
