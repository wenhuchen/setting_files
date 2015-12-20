set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'axiaoxin/vim-json-line-format'
Plugin 'axiaoxin/favorite-vim-colorscheme'
Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set pastetoggle=<F2>
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set laststatus=2

set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set nu                          "show line numbers

set expandtab                   "use spaces instead of tabs

set tabstop=4                   "insert 4 spaces whenever the tab key is pressed

set shiftwidth=4                "set indentation to 4 spaces

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

syntax on                       "syntax on
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
"adding nerd tree character
nmap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
colorscheme Tomorrow-Night-Bright 
"adding visual copy paste
"
set clipboard=unnamed,unnamedplus
set mouse=a

set smarttab 

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,


set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab> bash

" Plugin settings

let g:NERDSpaceDelims=1
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:ctrlp_show_hidden = 1
set completefunc=emoji#complete
let g:instant_markdown_slow = 1

" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
" " 开启tabline
let g:airline#extensions#tabline#enabled = 1
" " tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" " tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" " tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
"
" " jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"
" flake8
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
" autocmd! BufRead,BufWritePost *.py call Flake8()
"
" " gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
"
" " ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
" " jshint
autocmd! BufRead,BufWritePost *.js :JSHint
"
" " vim-table-mode: markdown
let g:table_mode_corner="|"
