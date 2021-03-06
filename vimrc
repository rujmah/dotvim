
filetype off

call pathogen#runtime_append_all_bundles()

nnoremap <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

nnoremap <leader>f :execute 'CommandTFlush'<CR>

if has("syntax")
  syntax on
end

set background=dark

if has("gui_running")
  set ruler
  set number
  colorscheme moria
  set guioptions=aAce
  if has("gui_macvim")
    set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
    set guifont=Monaco:h10 " use Monaco 10pt
  elseif has("gui_gtk")
    set guifont=Terminus\ 9
    set lines=60 columns=180
  endif
endif

map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

let g:bufExplorerShowRelativePath=1

set hidden
" ----------------------------------------------------------------------------
" Backups
" ----------------------------------------------------------------------------

set nobackup " do not keep backups after close
set nowritebackup " do not keep a backup while working
set noswapfile " don't keep swp files either

" ---------------------------------------------------------------------------
" File Types
" ---------------------------------------------------------------------------

filetype plugin indent on

" override default detection of .md files as modula2
autocmd! filetypedetect BufNewFile,BufRead *.md setfiletype markdown

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------

set autoindent " automatic indent new lines
set smartindent " be smart about it
set shiftwidth=2
set tabstop=2
set expandtab

" highlight trailing spaces and tabs
"set list listchars=trail:\ ,tab:>.
"highlight SpecialKey ctermfg=DarkGray ctermbg=Red

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                       " buffer number
set statusline+=%f\                           " filename
set statusline+=%h%m%r%w                      " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]  " file type
set statusline+=%=                            " right align remainder
"set statusline+=0x%-8B                        " character value
set statusline+=%-14(%l,%c%V%)                " line, character
set statusline+=%<%P                          " file position
