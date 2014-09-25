" #### General settings ####
set nocompatible                        " Use Vim settings, rather then Vi settings
set number                              " Show line numbers.
set numberwidth=3                       " Gutter width for number column.
set noswapfile                          " No .swp files
set nobackup                            " Prevents keeping of backup after overwriting the file.
set nowb                                " Prevents automatic write backup before overwriting file.
set showmatch                           " Displays or matches the cursor after completing a bracket.
set showcmd                             " Show incomplete cmds down the bottom.
set noshowmode                          " Don't show current mode (Input/Replace) down the bottom.
set laststatus=2                        " Always show the status bar.
set novisualbell                        " No visual bell.
set autoread                            " Reload files changed outside vim.
set history=1000                        " Store lots of :cmdline history.
set wildmode=list:longest               " TAB completion in command mode behaves similarly to a shell.
set list listchars=tab:\ \ ,trail:·     " Display tabs and trailing spaces visually.
set mouse=a                             " Mouse compatibility.
set mousehide                           " Hide the mouse cursor while typing
set hidden                              " Allow buffer switching without saving
set cursorline                          " Highlight current line
set backspace=indent,eol,start          " Backspace for dummies
set clipboard=unnamedplus               " Use the system clipboard for yank/put/delete.
set omnifunc=syntaxcomplete#Complete    " Turn on Omni completion (smart autocompletion for programs).
set ssop-=options                       " Do not store global and local values in a session.
set ssop-=folds                         " Do not store folds in a session.
set relativenumber                      " Show line numbers as relative to current line.
let &showbreak='↪ '                     " String to put at the start of lines that have been wrapped.
autocmd! bufwritepost .vimrc source %   " Autoreload .vimrc.
syntax on                               " Turn on syntax highlighting.


filetype off
" Manually loaded plugins
set rtp+=~/.vim/bundle/Vundle.vim                           " The plug-in manager for Vim.
set rtp+=~/.vim/bundle/c.vim                                " Write and run C programs. Insert statements, idioms, comments etc.

" Plugins loaded using Vundle.
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'                              " Let Vundle manage himself.
    Plugin 'tpope/vim-fugitive'                             " Best git interface for Vim.
    Plugin 'plasticboy/vim-markdown'                        " Markdown syntax highlighting.
    Plugin 'altercation/vim-colors-solarized'               " Solarized color scheme.
    Plugin 'tomasr/molokai'                                 " Monokai color scheme.
    Plugin 'jnurmine/Zenburn'                               " Zenburn color scheme.
    Plugin 'sjl/gundo.vim'                                  " Plugin to visualize your Vim undo tree. screenr.com/M9l
    Plugin 'bling/vim-airline'                              " Lean & mean status/tabline for vim that's light as air.
    Plugin 'scrooloose/nerdtree'                            " Allows you to explore your filesystem and to open files and directories.
    Plugin 'tpope/vim-surround'                             " Quoting/parenthesizing made simple.
    Plugin 'Rykka/riv.vim'                                  " reStructuredText.
    Plugin 'nvie/vim-rst-tables'                            " Easily create and reformat your RST (reStructuredText) tables as you change cell content.
    Plugin 'rodjek/vim-puppet'                              " Puppet niceties for your Vim setup.
    Plugin 'scrooloose/syntastic'                           " Syntax checking hacks for vim.
    Plugin 'airblade/vim-gitgutter'                         " Shows a git diff in the gutter (sign column) and stages/reverts hunks.
    Plugin 'majutsushi/tagbar'                              " Displays tags in a window, ordered by scope.
    Plugin 'PotatoesMaster/i3-vim-syntax'                   " Displays tags in a window, ordered by scope.
    Plugin 'kien/ctrlp.vim'                                 " Fuzzy file, buffer, mru, tag, etc finder.
    Plugin 'nvie/vim-flake8'                                " Flake8 plugin for Vim.
    Plugin 'Shougo/neocomplete.vim'                         " Next generation completion framework after neocomplcache.
    Plugin 'chase/vim-ansible-yaml'                         " Support for Ansible.
call vundle#end()
filetype plugin indent on

" #### Folding ####
set foldmethod=syntax
set foldlevel=20
set foldlevelstart=20

" #### Indentation ####
set autoindent      " 
set smartindent     " 
set smarttab        " 
set shiftwidth=4    " Shift width, no of spaces for auto indentation.
set softtabstop=4   " Sets the soft tab stop, generally used when indenting in Insert mode.
set tabstop=4       " Sets the tab stop to 4 spaces.
set expandtab       " Spaces instead of tabs for indentation.

" #### Wrapping ####
" set nowrap                              " Don't wrap lines.
set linebreak                           " Wrap lines at convenient points.
set textwidth=0                         " 
set formatoptions=cqt                   " Automatic wrapping enabled.
set wrapmargin=0                        " Don't wrap based on terminal size.
" Highlight characters that extend beyong the word wrap column.
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter * match OverLength /\%74v.*/
augroup END
" #### Appearance ####
syntax enable               " Enable syntax highlighting.
set t_Co=256                " Enable 256 colors. Don't forget TERM=xterm-256color
set background=dark         " Tell Vim to use colors which look good on a dark background.

colorscheme desert

if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline\ 12
    set guioptions-=m       " Remove menu bar
    set guioptions-=T       " Remove toolbar
    set guioptions-=r       " Remove right-hand scroll bar
    set guioptions-=L       " Remove left-hand scroll bar
    set noro                " No read-only mode, no clue why this happens.
else

endif
" #### Keybindings ####

map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <C-s> :update<CR>
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
set pastetoggle=<F2>
noremap <C-Tab> :bn<cr>
noremap <C-S-Tab> :bp<cr>
" Toggle the highlight of characters that are over the wrapp line.
" Toggle automatic wrapping.
" Filetype fixes {
    autocmd FileType rst setlocal spell     " Enable spellchecking for rst files.
    autocmd FileType python set omnifunc=pythonComplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd BufWritePre *.py :%s/\s\+$//e " Remove trailing whitespace on save.
" }
" #### Airline ####
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#left_sep=''
" let g:airline#extensions#tabline#left_alt_sep ='|'

" #### NERDTree ####

let NERDTreeShowBookmarks=1     " Show bookmarks in NERDTree.
let NERDTreeChDirMode=2
" autocmd VimEnter * NERDTree     " Run NERDTree when launching.
" autocmd VimEnter * wincmd p     " Move cursor back to main window.

" autocmd BufWritePost *.py call Flake8() " Call flake8 whenever saving python files.
" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

" #### Neocomplete ####
let g:acp_enableAtStartup = 0               " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1     " Use neocomplete.

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Filetype fixes {
    autocmd FileType rst setlocal spell     " Enable spellchecking for rst files.
" }



