" Kelly McGucken's vimrc
" Forked from a template <https://missing.csail.mit.edu/2020/files/vimrc> 
" provided by MIT's Missing Semester Course <https://missing.csail.mit.edu/>

" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------
set nocompatible
set encoding=utf-8
set t_Co=256
set shortmess+=I
set noerrorbells visualbell t_vb=
set mouse+=a
set hidden
set backspace=indent,eol,start

" -----------------------------------------------------------------------------
" Plugin Management
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Git Integration
Plug 'tpope/vim-fugitive'                " Git wrapper

" File Navigation
Plug 'mbbill/undotree'                   " Visualization of undo tree
Plug 'preservim/nerdtree'                " File system explorer
Plug 'ryanoasis/vim-devicons'            " Icons for NERDTree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                  " Fuzzy finder

" Markdown and Writing Support
Plug 'godlygeek/tabular'                 " Text alignment
Plug 'plasticboy/vim-markdown'           " Enhanced markdown support
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'preservim/vim-pencil'              " Better writing experience
Plug 'junegunn/goyo.vim'                 " Distraction-free writing
Plug 'junegunn/limelight.vim'            " Focus mode

" Appearance
Plug 'joshdick/onedark.vim'              " OneDark theme
Plug 'vim-airline/vim-airline'           " Status bar
Plug 'vim-airline/vim-airline-themes'     " Status bar themes
call plug#end()

" -----------------------------------------------------------------------------
" Visual Settings
" -----------------------------------------------------------------------------
" Color and Syntax
syntax on
set wildmenu
colorscheme onedark
let g:onedark_terminal_italics = 1

" Line Numbers
set number
set relativenumber

" Status Line
set laststatus=2

" Cursor Line
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=40 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

" True Color Support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " Italics support 
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

" -----------------------------------------------------------------------------
" Search Settings
" -----------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch

" -----------------------------------------------------------------------------
" Plugin Configurations
" -----------------------------------------------------------------------------
" Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
set guifont=JetBrains\ Mono\ NL:h12

" Markdown
" -----------------------------------------------------------------------------
" Plugin Configurations
" -----------------------------------------------------------------------------
" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
" Concealment settings
set conceallevel=2
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_links = 1
" Ensure links are concealed
let g:markdown_syntax_conceal = 1
" Style settings
let g:vim_markdown_emphasis_multiline = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
" Enable conceal in markdown files specifically
autocmd FileType markdown setlocal conceallevel=2

" Goyo and Limelight Integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
command! Zen Goyo

" Vim-Pencil Configuration
let g:pencil_higher_contrast_ui = 1
augroup pencil
  autocmd!
  autocmd FileType markdown,md,text call pencil#init()
  autocmd FileType markdown,md,text setlocal spell spelllang=en_us
augroup end

" -----------------------------------------------------------------------------
" Key Mappings
" -----------------------------------------------------------------------------
" Disable arrow keys to build good habits
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Plugin shortcuts
nnoremap <C-z> :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Easier escape
inoremap jk <ESC>

" Terminal italics support
let &t_ZH="\e[3m" " Not sure if needed yet
let &t_ZR="\e[23m"

" -----------------------------------------------------------------------------
" Auto Commands
" -----------------------------------------------------------------------------
" NERDTree auto-close
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
