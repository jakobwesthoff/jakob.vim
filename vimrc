set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=/usr/share/vim/addons

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" "Sensible" defaults?
Bundle "tpope/vim-sensible"

" Display trailing whitespaces
Bundle 'jakobwesthoff/whitespacetrail'
" Fancy snippet machine
" Bundle 'SirVer/ultisnips'
" Nice title bar
Plugin 'bling/vim-airline'
" Git integration (needed for airline)
Plugin 'tpope/vim-fugitive'
" Syntax checks
" Bundle 'scrooloose/syntastic'
" Abbreviate and convenient substitute
Bundle 'tpope/vim-abolish'
" Solarized color scheme
Bundle "altercation/vim-colors-solarized"
" Insert mode autocomplete management
Bundle "ervandew/supertab"

" Re-indents pasted code
Bundle 'sickill/vim-pasta'

" Expand region
Bundle 'terryma/vim-expand-region'

" Advanced Keyword completion
" Bundle 'szw/vim-kompleter'

" Pastemode
Bundle 'jakobwesthoff/pastemode'

" Pasting Gists from VIM
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Approximate colorschemes
" Bundle 'godlygeek/csapprox'

" Fuzzy search through project files
Bundle 'kien/ctrlp.vim'

" Advanced "f" motion for 2 characters
" Bundle 'goldfeld/vim-seek'

" See if that fixes YAML highlighting
Bundle 'chase/vim-ansible-yaml'

" Support Dockerfiles Syntax
Bundle 'ekalinin/Dockerfile.vim'

" Required after Vundle did its job.
filetype plugin indent on

" Automatically reload .vimrc if it has changed
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

"""""""""""""""""""
" Standard settings
"""""""""""""""""""

" Set tab handling defaults for every file, which does not provide overrides
" Detailed information: http://vimcasts.org/episodes/tabs-and-spaces/
" Default: Use 4 spaces for each tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nopaste
set nohidden
set nowrap
set encoding=utf-8

" Be case insensitive in searches
set ignorecase
" If upper case letters occur, be case insensitive
set smartcase
" Infer the current case in insert completion
set infercase

" Remap the <leader>-key to , instead of \
" http://stevelosh.com/blog/2010/09/coming-home-to-vim
let mapleader = ","
let maplocalleader = ","

" Automatic indention and such around expressions/brackets
set indentexpr=
set smartindent

" Use more sophistacted path completion featuring a menu on the status bar
set wildmenu
set wildmode=list:longest

" Jump 5 lines when running out of the screen
set scrolljump=5
" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Display a statusbar including the cursor position
set ruler
set laststatus=2

" Deactivate original mode indicator, powerline does that
set noshowmode

" Mark the current line of the cursor by underlining it (only in INSERT mode)
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Use visual representation of the bell, as there is no real one ;)
set visualbell
" Disable visual bell to stop screen from flashing and minimize the scroll lag
set t_vb=
" Ensure Vim uses a bigger block size for drawing text
set ttyfast

" Allow using the backspace and del keys for indentations, lineendings and
" linestarts
set backspace=indent,eol,start

" Allow file inline modelines to provide settings
set modeline

" Show linenumbers by default
set number

" Enable customized non-visible character display
" http://vimcasts.org/episodes/show-invisibles/
nnoremap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬
set list " Activate display of invisibles by default

" Allow usage of all colors instead of only the terminal ones
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set background=light
colorscheme solarized
call togglebg#map("<leader>D")

syntax enable
colorscheme solarized

" Restore line number and column if reentering a file after having edited it
" at least once. For this to work .viminfo in the home dir has to be writable by the user.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Configure the search operations to be more user friendly
" Search case insensitive if all search chars are lowercase but switch to case
" sensitive search if at least one char is uppercase
set ignorecase
set smartcase
" Display matched pattern while searching
set incsearch
" Highlight all matching occurances
set hlsearch
" Allow the usage of <leader><SPACE> to hide highlighted search results after
" the required occurance has been located
nnoremap <silent><leader><space> :nohlsearch<cr>

" Save file as root using sudo
" Definition of a new command does not work because of the two exclamation
" marks
:cnoremap w!! w !sudo tee % >/dev/null

" Configure textwrapping options
set wrap
set textwidth=79
" These format options include the wrapping of all text (t) by default. This
" includes program source code if editing a programming language. The according
" ftplugin configs should set a more usable configuration for this.
set formatoptions=qrocnt1

" ReWrap the current paragraph of test using <leader>q
nnoremap <leader>q gqip

" MovingThroughCamelCaseWords
nnoremap <silent><C-Left>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> setlocal nopaste

" Map <leader>i to activate pastemode
noremap <silent> <leader>i :call pastemode#EnterPasteMode()<CR>

" Map <leader>W to toggle whitespacetrail
noremap <silent> <leader>W :call whitespacetrail#ToggleWhitespaceTrail()<CR>

" Twig template highlighting
autocmd BufRead *.twig set filetype=twig
autocmd BufRead *.html.twig set filetype=htmltwig
" Handle *.phps as PHP files
au BufRead,BufNewFile *.phps		set filetype=php

" Undo history between sessions
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Colored column (to see line size violations)
set colorcolumn=80

" Enhance Omnicompletion
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone

" Map <F5> to turn spelling on (VIM 7.0+)
map <F5> :setlocal spell! spelllang=en_us<cr>
" Map <F6> to turn spelling (de) on (VIM 7.0+)
map <F6> :setlocal spell! spelllang=de<cr>

" Syntastic configuration
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" Disable w3 syntax chcker. Horribly annoying on slow connections
let g:syntastic_html_checkers=['tidy']

" Exclude from Pasta
let g:pasta_disabled_filetypes = ["tex"]

" Configure Ultisnips
"let g:UltiSnipsExpandTrigger = "<Tab>"
"let g:UltiSnipsListSnippets = "<M-Tab>"
" Set a custom snippets directory
"let g:UltiSnipsSnippetsDir = $HOME . "/.vim/ultisnips/"
"let g:UltiSnipsSnippetDirectories = ["ultisnips"]

" Configure airline
let g:airline_powerline_fonts = 1

" Completion options
set completeopt=menu,preview
" Attempt to do semantic completion, then fall back to keywords
let g:SuperTabDefaultCompletionType = "context"

" Post private Gists by default
let g:gist_post_private = 1

" CTRL-P
set wildignore+=cache,src/var,src/data,.abc,build
" Ignore VCS dirs (copied from docs)
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|vendor)$'
" I want to search the current working dir only
let g:ctrlp_working_path_mode = ''

" Make moving in tabs more comfortable
nnoremap <leader>j :tabprevious<CR>
nnoremap <leader>k :tabnext<CR>
" Shift version moves current tab
nnoremap <leader><S-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <leader><S-k> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Make moving page wise more comfortable
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
" Jump to next/prev start of method
nnoremap <C-m> ]m
nnoremap <C-S-m> [m

" Expand region with v-v-v...
vmap v <Plug>(expand_region_expand)
vmap <S-v> <Plug>(expand_region_shrink)

" PHP expand objects
let g:expand_region_text_objects_php = {
    \ 'iw'  :0,
    \ 'i"'  :0,
    \ 'i''' :0,
    \ 'i]'  :1,
    \ 'ia'  :0,
    \ 'aa'  :0,
    \ 'i)'  :1,
    \ 'a)'  :1,
    \ 'i}'  :1,
    \ 'a}'  :1
    \ }

" y/p/d with system clipboard through leader
vmap <Leader>y "*y
vmap <Leader>d "*d
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P

" Create directory on save if it does not exist
" http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
augroup BWCCreateDir
    au!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" Source .vimlocalrc file if it is available on the system
" !! THIS DIRECTIVE NEEDS TO BE LAST COMMAND IN THIS FILE TO ENSURE ALL !!
" !! CONFIGURATION OPTIONS MAY BE OVERRIDDEN !!
if filereadable( $HOME . "/.vimlocalrc" )
    source ~/.vimlocalrc
endif
