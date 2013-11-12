set nocompatible               " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  required!
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'tpope/vim-fugitive'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'pangloss/vim-javascript'
Bundle 'mrtazz/molokai.vim'
Bundle 'vim-scala'
Bundle 'go.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'fugitive.vim'
Bundle 'klen/python-mode'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'wting/rust.vim'
Bundle 'wombat256.vim'
Bundle 'surround.vim'
Bundle 'vim-jsbeautify'

"Setting VIMHOME
"
let $VIMHOME = $HOME."/.vim"

"Setting PYTHONPATH
let $PYTHONPATH .= ":".$VIMHOME."/python"

"Setting PATH
let $PATH .= ":".$VIMHOME."/python"
let g:LustyJugglerSuppressRubyWarning = 1

"Loading bundle plugins
call pathogen#runtime_append_all_bundles()

syntax on
filetype indent on
filetype plugin on

"Hidden mode
set hidden
set number

"Backspace
set backspace=2

"Bad whitespaces
autocmd BufEnter * highlight BadWhitespace ctermbg=red guibg=red
autocmd BufEnter * match BadWhitespace /^\t\+/
autocmd BufEnter * match BadWhitespace /\s\+$/

"Setting up tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set tabpagemax=20
set showtabline=4
set autoindent
set expandtab
set smartindent
set smarttab
set wildmenu
set wildmode=list:longest
set scrolloff=3
set showmode
set showcmd
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nobackup
set noswapfile
set history=500         " remember more commands and search history
set undolevels=500      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set laststatus=2


" Python-mode
" Activate rope
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501,E126,E127,W1401,C0110,C0301,R0201"
let g:pymode_lint_select = ""

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_indent=0
let g:pymode_syntax=0

" Don't autofold code
let g:pymode_folding = 0

"Increase HTML indent
let g:html_indent_inctags="html,head,body,tbody"

"Start mappings
"==============
"NERDTree
nmap <silent> <c-p> :NERDTreeToggle<CR>

"Tabs navigation
nmap <C-Tab> gt
nmap <C-S-Tab> gT

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction

function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <C-tab> <c-r>=InsertTabWrapper()<cr>
map <Leader>o :call TrimWhiteSpace()<CR>

"Moving lines
noremap <C-j> :m+<CR>==
noremap <C-k> :m-2<CR>==
noremap <C-j> <Esc>:m+<CR>==gi
noremap <C-k> <Esc>:m-2<CR>==gi
noremap <C-j> :m'>+<CR>gv=gv
noremap <C-k> :m-2<CR>gv=gv

vnoremap <C-l> xp
vnoremap <C-h> xhP

"Split resizing
map <C-S-Left> <c-w><
map <C-S-Right> <c-w>>
map <C-S-Up> <c-w>-
map <C-S-Down> <c-w>+

"============
"End mappings

set t_Co=256
colorscheme wombat256mod
set guifont=SourceCodePro-Regular:h12

if has("gui_running")
    "Colorscheme
    colorscheme wombat256mod

    set guifont=SourceCodePro-Regular:h12
    set antialias

    set guioptions=egmt
    set guioptions-=m
    set fuoptions=maxvert,maxhorz

    set go-=T
    set bg=dark
    set guioptions=T
    set background=dark
endif

nmap <silent> <Leader>t :CtrlP<CR>
