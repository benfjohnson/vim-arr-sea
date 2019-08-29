" Minimalist VIm configuration
" Author: Ben Johnson
" March 2019

" ~~~ Plugin setup ~~~
" Plugins directory:
call plug#begin('~/.vim/plugged')

" Fuzzy file finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Find-in-folder
Plug 'mileszs/ack.vim'

" Language server protocol/lint tool
Plug 'w0rp/ale'

" Better status line
Plug 'itchyny/lightline.vim'

" Show simple git diff info in side gutter
Plug 'airblade/vim-gitgutter'

" Syntax highlighting for all languages!
" Especially awesome, as it only loads in relevant configuration to open
" file(s)
Plug 'sheerun/vim-polyglot'

" Color theme
Plug 'crusoexia/vim-monokai'

" Simple .git blame
Plug 'zivyangll/git-blame.vim'

" Initialize plugin system
call plug#end()
" ~~~ End plugin setup

" Show line numbers by default!
:set number

" Key binding for the .git blame plugin
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>


" Syntax highlighting for flow.js! (disabled by default)
let g:javascript_plugin_flow = 1

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\ 'javascript': ['flow', 'eslint'],
\ 'rust': ['rls']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Use ripgrep as default search engine for Ack.vim
let g:ackprg = 'rg --vimgrep --no-heading'
" Bind ack-vim to ctrl+f, don't auto-open results (! modifier)
nmap <C-f> :Ack!<space>

" Use ripgrep as default search engine for fzf!
" --files: List files that would be searched but do not search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

" Use ctrl+p to open fzf (not the default :Files command)
nnoremap <silent> <C-p> :FZF -m<cr>

" Font stuff:
set guifont=Fira\ Code\ Retina:h12

" Monokai theme
syntax on
colorscheme monokai
set termguicolors

" Tab key -> 2 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" git-gutter: faster git updates (default is 4000ms)
set updatetime=200

" prevent vim from wrapping words
set nowrap

" For some reason this is necessary for lightline to render?
set laststatus=2

" Show relative file path of open file in lightline!
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
