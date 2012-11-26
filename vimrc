" Example Vim configuration.
" Copy or symlink to ~/.vimrc.

set nocompatible                  " Must come first because it changes other options.

call pathogen#infect()            " Pathogen plugin loading
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

" Colors
set t_Co=256
" Replace with your favorite colorscheme
" let g:zenburn_high_Contrast = 1
color jellybeans

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignorecase                " Ignore case when completing file names

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Line numbers.
set ruler                         " Cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch                     " Show matching brackets
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set autoread                      " Automatically reload file on external change

set novisualbell                  " No annoying flashing

set cursorline                    " Highlight current line.

set list                          " Show hidden characters (configured with listchars)
set listchars=tab:▸\ ,            " Show tabs with an arrow

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set softtabstop=2

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Indent
set autoindent

" GUI options
set guioptions-=T                 " Git rid of useless toolbar
set gfn=Monaco:h12

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Delete trailing whitespace when saving
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Arrow keys? We don't need no stinkin' arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" Keep visual selection after indenting
vnoremap > >gv
vnoremap < <gv

" Searching
map <leader>aa :Ack!<space>
map <leader>aj :Ack!<space>--type=js<space>
map <leader>ar :Ack!<space>--type=ruby<space>
" Highlight current word in all buffers and then ack for it in all files
map <leader>aw *#:Ack!<space><cword><cr>

" modifying the syntax for regex's
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
cmap ;\ \(\)<Left><Left>

" ruby syntax
map <leader>rs :setf<space>ruby<cr>
set fu
