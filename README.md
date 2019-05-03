# vim-arr-sea
Minimalist .vimrc for software development

Note that this assumes you have [vim-plug](https://github.com/junegunn/vim-plug) installed (easily done with a `curl` command).

Custom commands:

* ctrl+P for fuzzy-finding files (see [this comment](https://github.com/junegunn/fzf.vim/issues/160#issuecomment-226523789) for advanced usage)
* `:Ack <SEARCH_TERM>` for `ripgrep`-powered text search
* `\an`, `\ap` to cycle between lint errors in a file
* `\s` for .git blame
