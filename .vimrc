" #### VIM settings ####
" General {
    set nocompatible                        " Use Vim settings, rather then Vi settings
    set number                              " Show line numbers.
    set numberwidth=3                       " Gutter width for number column.
    set noswapfile                          " No .swp files
    set nobackup                            " Prevents keeping of backup after overwriting the file.
    set nowb                                " Prevents automatic write backup before overwriting file.
    set showmatch                           " Displays or matches the cursor after completing a bracket.
    set showcmd                             " Show incomplete cmds down the bottom.
    set noshowmode                          " Don't show current mode (Input/Replace) down the bottom. Use Airline for this.
    set laststatus=2                        " Always show the status bar.
    set statusline+=%f                      " Add full file path to your existing statusline
    set novisualbell                        " No visual bell.
    set autoread                            " Reload files changed outside vim.
    set history=1000                        " Store lots of :cmdline history.
    set wildmode=list:longest               " TAB completion in command mode. When more than one match, list all matches and complete till longest common string.
    set wildmenu
    set list listchars=tab:\ \ ,trail:·     " Display tabs and trailing spaces viually.
    set mouse=a                             " Mouse compatibility.
    set mousehide                           " Hide the mouse cursor while typing
    set hidden                              " Allow buffer switching without saving
    set cursorline                          " Highlight current line
    set backspace=indent,eol,start          " Backspace for dummies
    set clipboard=unnamedplus               " Use the system clipboard for yank/put/delete.
    set omnifunc=syntaxcomplete#Complete    " Turn on Omni completion (smart autocompletion for programs).
    set ssop-=options                       " Do not store global and local values in a session.
    set relativenumber                      " Show line numbers as relative to current line.
    set autochdir                           " Automatically change to the directory of loaded file.
    set tags=.ctags;/                       " Load ctags from the .ctags file, check the current folder for tags file and keep going one directory up all the way to the root folder.
    set modelines=0
    set encoding=utf-8
    set ttyfast
    set scrolloff=3                         " Minimal number of screen lines to keep above and below the cursor.
    let &showbreak='↪ '                     " String to put at the start of lines that have been wrapped.
    autocmd! bufwritepost .vimrc source %   " Autoreload .vimrc on save.
    syntax on                               " Turn on syntax highlighting.
" }

" Appearance {
    syntax enable               " Enable syntax highlighting.
    set t_Co=256                " Enable 256 colors. Don't forget TERM=xterm-256color
    colorscheme solarized
    let g:solarized_termcolors=256
    let rdark_current_line = 1
    set background=dark         " Tell Vim to use colors which look good on a dark background.
    let g:rehash256 = 1

    if has("gui_running")
        " set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
        set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
        set guioptions-=m       " Remove menu bar
        set guioptions-=T       " Remove toolbar
        set guioptions-=r       " Remove right-hand scroll bar
        set guioptions-=L       " Remove left-hand scroll bar
        set noro                " No read-only mode, no clue why this happens.
    endif
" }

" Folding {
    set foldmethod=indent
    set foldlevel=99
    set foldlevelstart=99
" }

" Indentation {
    set smartindent     " 
    set autoindent      " 
    set smarttab        " 
    set shiftwidth=4    " Shift width, no of spaces for auto indentation.
    set softtabstop=4   " Sets the soft tab stop, generally used when indenting in Insert mode.
    set tabstop=4       " Sets the tab stop to 4 spaces.
    set expandtab       " Spaces instead of tabs for indentation.
" }

" Wrapping {
    " set nowrap                                " Don't wrap lines.
    set wrap
    set linebreak                               " Wrap lines at convenient points.
    set textwidth=79                            " 
    set formatoptions=qrn1                      " Automatic wrapping enabled.
    set wrapmargin=0                            " Don't wrap based on terminal size.
    " Highlight characters that extend beyong the word wrap column.
    set colorcolumn=-1
    highlight ColorColumn ctermbg=lightgrey guibg=#1A1F21
    " augroup vimrc_autocmds
    "     autocmd BufEnter * highlight OverLength ctermbg=red guibg=#2C3538
    "     autocmd BufEnter * match OverLength /\%79v.\+/
    " augroup END
" }

" Search/moving {
    " Turn off Vim’s crazy default regex characters and makes searches use
    " normal regexes.
    nnoremap / /\v
    vnoremap / /\v
    " If you search for an all-lowercase string your search will be
    " case-insensitive, but if one or more characters is uppercase the search
    " will be case-sensitive.
    set ignorecase
    set smartcase
    set gdefault                            " Apply substitutions globally on line
    " Highlight search results (as you type)
    set incsearch                           " Preview as you type.
    set showmatch                           " Highlight search matches.
    set hlsearch                            " Highlight previous search result.
    " Clear out a search by typing \<space>
    nnoremap <leader><space> :nohlsearch<cr>
    " Make the tab key match bracket pairs
    nnoremap <tab> %
    vnoremap <tab> %
" }

" #### Plugins loaded using Vundle ####
filetype off
set rtp+=~/.vim/bundle/Vundle.vim                           " Manually load Vundle.
call vundle#begin('~/.vim/bundle/')
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'                              " Let Vundle manage himself.
    Plugin 'tpope/vim-fugitive'                             " Best git interface for Vim.
    Plugin 'sjl/gundo.vim'                                  " Plugin to visualize your Vim undo tree. screenr.com/M9l
    Plugin 'bling/vim-airline'                              " Lean & mean status/tabline for vim that's light as air.
    Plugin 'scrooloose/nerdtree'                            " Allows you to explore your filesystem and to open files and directories.
    Plugin 'tpope/vim-surround'                             " Quoting/parenthesizing made simple.
    Plugin 'scrooloose/syntastic'                           " Syntax checking hacks for vim.
    Plugin 'airblade/vim-gitgutter'                         " Shows a git diff in the gutter (sign column) and stages/reverts hunks.
    Plugin 'majutsushi/tagbar'                              " Displays tags in a window, ordered by scope.
    Plugin 'kien/ctrlp.vim'                                 " Fuzzy file, buffer, mru, tag, etc finder.
    Plugin 'nvie/vim-flake8'                                " Flake8 plugin for Vim.
    Plugin 'Shougo/neocomplete.vim'                         " Next generation completion framework after neocomplcache.
    Plugin 'MarcWeber/vim-addon-mw-utils'                   " Interpret a file by function and cache file automatically
    Plugin 'garbas/vim-snipmate'                            " Implements some of TextMate's snippets features in Vim.
    Plugin 'vim-scripts/tlib'                               " Some utility functions.
    Plugin 'davidhalter/jedi-vim'                           " awesome Python autocompletion with VIM
    Plugin 'ervandew/supertab'                              " Perform all your vim insert mode completions with Tab
    Plugin 'jmcantrell/vim-virtualenv'                      " Work with python virtualenvs in vim.
    Plugin 'Rykka/InstantRst'                               " Instant preview for rst files.
    Plugin 'nvie/vim-rst-tables'                            " Easily create and reformat your RST (reStructuredText) tables as you change cell content.
    Plugin 'mileszs/ack.vim'                                " Plugin for the Perl module / CLI script 'ack'
    Plugin 'hynek/vim-python-pep8-indent'                   " Nicer indentation for python.
    Plugin 'Yggdroot/indentLine'                            " A vim plugin to display the indention levels with thin vertical lines.

    " Syntax highliters.
    Plugin 'octave.vim'                                     " Syntax highlighting for the GNU Octave programming language.
    Plugin 'Rykka/riv.vim'                                  " reStructuredText.
    Plugin 'rodjek/vim-puppet'                              " Puppet niceties for your Vim setup.
    Plugin 'chase/vim-ansible-yaml'                         " Support for Ansible.
    Plugin 'PotatoesMaster/i3-vim-syntax'                   " Displays tags in a window, ordered by scope.
    Plugin 'django.vim'                                     " Django syntax highliter.
    Plugin 'plasticboy/vim-markdown'                        " Markdown syntax highlighting.

    " Color schemes.
    Plugin 'altercation/vim-colors-solarized'               " Solarized color scheme.
    Plugin 'tomasr/molokai'                                 " Monokai color scheme.
    Plugin 'jnurmine/Zenburn'                               " Zenburn color scheme.
call vundle#end()
filetype plugin indent on

" #### Plugin settings ####

" Jedi {
    autocmd FileType python setlocal completeopt-=preview   " Don't popup docstring window during completion.
    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#popup_select_first = 0                       " Don't select the first line of the completion menu.
" }

" NERDTree {
    let NERDTreeIgnore = ['\.pyc$']
    let NERDTreeShowBookmarks=1     " Show bookmarks in NERDTree.
    let NERDTreeChDirMode=2
    " autocmd VimEnter * NERDTree     " Run NERDTree when launching.
    " autocmd VimEnter * wincmd p     " Move cursor back to main window.
" }

" Airline {
    let g:airline_theme='solarized'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#branch#enabled=1
    let g:airline#extensions#syntastic#enabled=1
    let g:airline#extensions#virtualenv#enabled=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#fnamemod = ':t'        " Show just the filename.
    " let g:airline#extensions#tabline#left_sep=''
    " let g:airline#extensions#tabline#left_alt_sep ='|'
" }

" Syntastic {
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_python_checkers = ['pylint', 'python', 'flake8']
    let g:syntastic_python_pylint_exec = 'pylint --load-plugins pylint_django'
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*

    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 1
    " let g:syntastic_check_on_open = 1
    " let g:syntastic_check_on_wq = 0
" }

" Neocomplete {
    let g:acp_enableAtStartup = 0               " Disable AutoComplPop.
    let g:neocomplete#enable_at_startup = 1     " Use neocomplete.
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" }


" CtrlP {
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    set wildignore+=*.pyc
    set wildignore+=*/venv/*
" }

" #### Filetype settings ####
" Python {
    autocmd BufWritePre *.py :%s/\s\+$//e " Remove trailing whitespace on save.
    autocmd BufRead *.py setlocal makeprg=python\ %
    " autocmd BufRead *.py nmap <F5> :!python %<CR>
    " autocmd FileType python setlocal iskeyword-=_
    " autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    " im :<CR> :<CR><TAB>


" }
autocmd FileType make setlocal noexpandtab
" Differrent shift width {
    augroup different_shiftwidth
        autocmd!
        autocmd FileType html,yaml,json,css,javascript setlocal shiftwidth=2
    augroup END
" }
" Automatically enable spellchecking. {
    augroup auto_spellchecking
        autocmd!
        autocmd FileType rst setlocal spell
    augroup END
" }
" Autocompletion functions {
    augroup auto_completion
        autocmd!
        " autocmd FileType python setlocal omnifunc=pythonComplete#CompleteJS
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html setlocal omnifunc=htmlcomplete#CompleTags
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType less setlocal omnifunc=csscomplete#CompleteCSS
    augroup END
" }

" Indent using tabs for makefiles {
    augroup mygroup
        autocmd!
        autocmd FileType make setlocal noexpandtab
    augroup END
" }


" #### Keybindings ####
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <space> za
vnoremap <space> zf
nnoremap <C-Space> zA
vnoremap <C-Space> zA

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
noremap <C-Tab> :bn<cr>
noremap <C-S-Tab> :bp<cr>
nnoremap <C-P> :CtrlP<cr>
nnoremap <C-A-P> :CtrlPTag<cr>
nnoremap <F5> :make<CR>

map <leader>g :GundoToggle<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <leader>t :enew<cr>

" Bring current selected text from visual mode into command line.
vnoremap : y:<C-r>"<C-b>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

" autocmd FocusLost * :wa                 " Save file when editor loses focus.

" #### Custom commands and functions ####
fun! Project(arg)
    " execute '!python ' . expand( '%' )
    "
    " let g:ProjectDir = "~/Desktop/projects/unisport/code/"
    " cd vim.eval("g:ProjectDir")
    " set tags = ProjectDir . "/.ctags"'
endfunction
command! -nargs=* Project call Project('<args>')

" Add the virtualenv's site-packages to vim path
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
