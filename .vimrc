" A beginner's .vimrc file

" Use Vim settings, put Vi to sleep
" This must be first, because it overrides other options
" Also, this makes the filetype setting work, since
" filetype doesn't work well with compatible
set nocompatible


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color - find in in ~/.vim/colors
set t_Co=256
color wombat256mod


" Copy to the system cliboard.
" This won't work if :echo ('clipboard') returns 0, which is the
" case if you just apt-get vim.
" Vim needs to be compiled with the +clipboard option in order for
" this to work.
set clipboard=unnamedplus

" Make backspace behave in a sane way
" Has anybody else come up with a different comment?
" Or do we just see the command and this comment as a whole?
set backspace=indent,eol,start

" Enable mouse in all modes
set mouse=a

" Enable syntax highlighting, just in case it's not
syntax enable

" In case the file is changed from the outside, auto read it
set autoread

" Enable file type detection and do language-dependent indenting
" The indenting is done based on language specific files, which
" should live at ~/.vim/indent/the-language.vim
filetype off
filetype plugin indent on

" Show line numbers AND make them relative
" This means the cursor line will always be line 0,
" and numbering starts from here in both directions.
" So the the line above will be line #1, and the line
" below will also be line#1 
set relativenumber

" Increase the number of history lines vim saves
set history=100

" In case you change this file, in order to avoid reopening
" all your open files, just run <Leader>v and you will see 
" the new options
map <Leader>v :source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tabstop is the number of spaces a tab counts for,
" WHEN READING a file.
" When Vim opens a file and reads a TAB, it uses
" that many spaces to visually show the tab
set tabstop=4

" softtabstop is the number of spaces a tab counts for,
" WHEN EDITING
set softtabstop=4

" But, for some reason, it doesn't work unless the line below is present
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

" Smart tabs
set smarttab 

" Auto indent
set autoindent 

" Smart indent
set smartindent 

" Wrap long lines
set wrap 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move between splits without pressing <C-W>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Note that these bindings will work in any mode, since we
" don't use nmap, imap etc

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups - who needs them?
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This file doesn't itself manage plugins, but it sources (executes)
" another file that handles this task.
"
" Why? 
"
" Because there are a few plugin managers, and you might want to switch
" from one to another over time.
" Also, you might want to add or remove a plugin.
" So instead of updating .vimrc, you update
" .vimrc.bundles

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move vertically by visual line
" In case a line is wrapped to two lines, don't miss the wrapped text
nnoremap j gj
nnoremap k gk
