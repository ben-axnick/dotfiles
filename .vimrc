set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" assorted plugins
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'

" Default markdown support is borked
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattreduce/vim-mix'

call vundle#end()
" Regular config resumes here

syntax on
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1

set encoding=utf-8

set hlsearch
filetype plugin on
filetype plugin indent on

set backspace=2   " more powerful backspacing
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

autocmd Filetype php setlocal noexpandtab tabstop=4 shiftwidth=4

set splitright
set mouse=a
set clipboard+=unnamed

autocmd CursorHold * checktime
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:CommandTMaxFiles=20000
let g:CommandTMaxCachedDirectories=3

if has('gui_running')
    set guifont=Menlo:h12    " set fonts for gui vim
    set transparency=1        " set transparent window
endif

" Always enable indent guides
autocmd VimEnter * IndentGuidesEnable

" Folding
set foldmethod=syntax
set foldcolumn=0
set foldlevelstart=20

" ignore annoying obviously bad paths for ctrl p
set wildignore+=*.o,*.obj,*.swp,.git,.svn,tmp,log,.sass-cache,public,coverage,tests,content,node_modules

" coffeecheck highlight by default
let g:coffeeCheckHighlightErrorLine = 1

" yankring somewhere not stupid
let g:yankring_history_dir = '~/.yankring'

" rspec bindings
map <F5> :w<CR>:call RunCurrentSpecFile()<CR>
map <F6> :w<CR>:call RunNearestSpec()<CR>
map <F7> :call RunLastSpec()<CR>

" Open spec in vertical split
command! AA execute "vsplit | A"

" quickly open spec in new tab
" always show status line
set laststatus=2

set nowrap

" sensible indent for html
let g:html_indent_inctags = "html,body,head,tbody"

" don't let Command T traverse SCM
let g:CommandTTraverseSCM = "pwd"

" splitjoin awesome
nnoremap \ :SplitjoinSplit<cr>
nnoremap <c-\> :SplitjoinJoin<cr>

" help with jumping around lines
set relativenumber
set nu

" disable markdown auto folding
" who actually thinks this is a great user experience?
let g:vim_markdown_folding_disabled=1

" Run specs in tmux pane
" http://robots.thoughtbot.com/running-specs-from-vim-sent-to-tmux-via-tslime
let g:rspec_command = 'call Send_to_Tmux("ah-spec {spec}\n")'

" sensible pane switching
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" see column count
set ruler

" change leader to something easier
let mapleader= ","

" easier movement
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" ctrl p search mapping
map <leader>t :FZF<CR>

" no more .swp in project tree
:set directory=$HOME/.vim/swapfiles

" PHP uses questionable indentation practices aka tabs
autocmd FileType php setl sw=4 sts=4 noet

" Work around Syntastic bug
command E Ex

" Show long line warning/critical marker
let &colorcolumn="80,".join(range(120,999),",")

" Fuzzy finding
set rtp+=~/.fzf

" Just in case fzf isn't working
" Plugin 'ctrlpvim/ctrlp.vim'
" map <leader>t :CtrlP<CR>
