# vim-arr-sea
Minimalist .vimrc for software development

Note that this assumes you have [vim-plug](https://github.com/junegunn/vim-plug) installed (easily done with a `curl` command).

Custom commands:

* ctrl+p for fuzzy-finding files (see [this comment](https://github.com/junegunn/fzf.vim/issues/160#issuecomment-226523789) for advanced usage)
* ctrl+f for find-in-files (powered by `vim-ack` and `ripgrep`)
* `\an`, `\ap` to cycle between lint errors in a file
* `\s` for .git blame
