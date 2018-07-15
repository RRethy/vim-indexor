# indexor.vim

Indexor.vim is a plugin for adding indices to a list of items without having to tediously type them in yourself or using a complicated macro with <CTRL-a>.

Consider have a grocery list as follows:

```
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
```

We can also use upper and lower case letters with `<Leader>L` and `<Leader>l` respectively which results in the following:

```
  A. Bananas
  B. Oranges
  C. Milk
  D. Maple Syrup
  E. Dried Mango
```

And

```
  a. Bananas
  b. Oranges
  c. Milk
  d. Maple Syrup
  e. Dried Mango
```

## Installation

Install using your favorite package manager.

- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'RRethy/vim-indexor'` to .vimrc/init.vim
  2. Run `:PlugInstall`

## License

Copyright (c) Adam P. Regasz-Rethy.  Distributed under the same terms as Vim itself.
See `:help license`.
