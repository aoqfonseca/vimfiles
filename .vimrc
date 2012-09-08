"Setting VIMHOME
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
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep



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


function ToggleFold()
   if foldlevel('.') == 0
" No fold exists at the current line,
" so create a fold based on indentation

      let l_min = line('.') " the current line number
      let l_max = line('$') " the last line number
      let i_min = indent('.') " the indentation of the current line
      let l = l_min + 1

" Search downward for the last line whose indentation > i_min
      while l <= l_max
" if this line is not blank ...
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            if indent(l) <= i_min

" we've gone too far
               let l = l - 1 " backtrack one line
               break
            endif
         endif
         let l = l + 1
      endwhile

" Clamp l to the last line
      if l > l_max
         let l = l_max
      endif

" Backtrack to the last non-blank line
      while l > l_min
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            break
         endif
         let l = l - 1
      endwhile

"execute "normal i" . l_min . "," . l . " fold" " print debug info

      if l > l_min
" Create the fold from l_min to l
         execute l_min . "," . l . " fold"
      endif
   else
" Delete the fold on the current line
      normal zd
   endif
endfunction

inoremap <C-tab> <c-r>=InsertTabWrapper()<cr>

"Mapping para code fold
vmap <space> zf
nmap <space> :call ToggleFold()<CR>

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

if has("gui_running")
    "Colorscheme
    colorscheme jellybeans

    "guifont
    "set guifont=Monaco:h14
    set guifont=Inconsolata:h16

    set guioptions=egmt
    set guioptions-=m
    set fuoptions=maxvert,maxhorz
endif

nmap <silent> <Leader>t :CtrlP<CR>

