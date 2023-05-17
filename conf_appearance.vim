 " Cursor and Status Line
set ruler             " Show the cursor position.
set showcmd           " Show incomplete commands.
set showmode          " Show the current mode.
set showmatch         " Show matching brackets or quotes.
set laststatus=2      " Always show the status line.

" Completion and Navigation
set wildmenu          " Enable wildmenu for command-line completion.
set incsearch         " Highlight search matches as you type.
set ignorecase        " Ignore case when searching, unless using capital letters.
set smartcase         " Override 'ignorecase' if search includes capital letters.
set hlsearch          " Highlight all search matches.
set scrolloff=10      " Minimum number of lines to keep above and below the cursor during scrolling.

" Indentation and Formatting
set shiftwidth=4      " Number of spaces for each level of indentation.
set tabstop=4         " Number of spaces that a <Tab> character represents.
set expandtab         " Convert <Tab> to spaces.
set wrap              " Wrap lines visually
set ai                " Enable auto-indentation
set lbr               " Enable line break display
set si                " Enable smart indenting


" File and Editing Options
set nobackup          " Do not create backup files.
set history=1000      " Increase the number of commands stored in history.

" Syntax Highlighting
syntax on             " Enable syntax highlighting.
set number            " Display line numbers.

syntax enable
set background=dark
colorscheme slate 

set breakindent

set nocompatible
filetype plugin on
