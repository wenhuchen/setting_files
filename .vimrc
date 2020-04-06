set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
" Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-fugitive'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'sickill/vim-monokai'
Plugin 'nvie/vim-flake8'
Plugin 'avakhov/vim-yaml'
Plugin 'davidhalter/jedi-vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'justmao945/vim-clang'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
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

" use darkburn color scheme
" colorscheme darkburn

set laststatus=2

set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set nu                          "show line numbers

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches
set tabstop=4                   "insert 4 spaces whenever the tab key is pressed
set shiftwidth=4                "set indentation to 4 spaces
set softtabstop=4               "insert 4 spaces whenever the tab key is pressed
set expandtab                   "use spaces instead of tabs
set autoindent

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
nmap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

"" Jump to the absolute line
nnoremap <CR> G
inoremap <S-TAB> <C-V><TAB>
map <C-c> :BD<cr>

syntax enable
set t_Co=256
set background=dark
let g:molokai_original = 1

"" setting delete key to blackhold register
nnoremap d "_d
vnoremap d "_d
set clipboard=unnamed

"" mouse click setting
set mouse=a

"" auto format your file
noremap <F3> :Autoformat<CR>

"" set smarttab

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,

set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab> bash
set cursorline cursorcolumn     " adding column cursor
" Plugin settings
let g:NERDSpaceDelims=1
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:ctrlp_show_hidden = 1
let g:instant_markdown_slow = 1
let g:nerdtree_tabs_open_on_console_startup=1
"
" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
"
" " jedi
autocmd FileType python setlocal completeopt-=preview
" flake8
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
" autocmd! BufRead,BufWritePost *.py call Flake8()
"
" " gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
"
" " set background transparent
hi Normal ctermbg=none
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
"
"
" Set lua-vim interpreter
let g:lua_compiler_name = "/data/users/v-wenhch/torch/install/bin/luajit"
let g:loaded_luainspect = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Set syntastic
let g:syntastic_python_pylint_exec = 'pylint1.6'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = {
	    \ "mode": "active",
	    \ "passive_filetypes": ["cpp","hpp","c","h"] }

" Set tagbar
nmap <F8> :TagbarToggle<CR>
" autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType c,cpp nested :TagbarOpen
aug python
    " ftype/python.vim overwrites this
    au FileType python setlocal ts=4 sts=4 sw=4
aug end 
