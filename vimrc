execute pathogen#infect()

set nu
set nocompatible
set autoindent
set showcmd
set wildmenu
set wildmode=list:longest,full
set fileformat=unix
set fileformats=unix,dos
set tabpagemax=100
filetype off
filetype plugin off
syntax off
colorscheme industry
set noet ci sts=0 sw=4 ts=4
set cinoptions=(0,u0,U0
set incsearch
set hlsearch
set nohidden
set showtabline=2

let g:syntastic_javascript_checker="jshint"
let g:mustache_abbreviations=1
let g:jshint_highlight_color="red"
let g:racer_cmd="~/Documents/GitHub/apps/racer/target/release/racer"
let mapleader=","

function! ViewHtmlText(url)
	if !empty(a:url)
		new
		setlocal buftype=nofile bufhidden=hide noswapfile
		execute 'r !elinks ' . a:url . ' -dump -dump-width ' . winwidth(0)
		1d
	endif
endfunction

autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

nnoremap :E :e %:p:h/
nnoremap <Leader>gh :update<Bar>call ViewHtmlText(expand('%:p'))<CR>
nnoremap <silent> Y yy
nnoremap <silent> <Leader>s :source ~/.vim/vimrc<CR>
nnoremap <silent> <Leader>es :tabnew<CR>:e ~/.vim/vimrc<CR>
nnoremap <C-q> qa
nnoremap <C-@> @a
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <silent> <C-m><C-n> :tabm +1<CR>
nnoremap <silent> <C-m><C-p> :tabm -1<CR>
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-w> :q<CR>
nnoremap <silent> <C-a> ggVG
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
nnoremap <silent> gl ggzz
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<
nnoremap <Leader>: :VimuxRunCommand<space>
nnoremap <silent> K kJ
nnoremap <silent> <Leader>/ :noh<CR>
vnoremap <silent> <Tab> >
vnoremap <silent> <S-Tab> <
inoremap <silent> <C-d> <C-\><C-O><C-d>
inoremap <silent> <C-u> <C-\><C-O><C-u>
map N Nzz
map n nzz

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'benmills/vimux'
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
Plugin 'moll/vim-node'
Plugin 'vim-scripts/Smart-Tabs'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()

filetype on
filetype plugin indent on
syntax on
