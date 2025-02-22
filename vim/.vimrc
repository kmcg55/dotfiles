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
set noerrorbells
set visualbell
set t_vb=
set mouse+=a
set hidden
set backspace=indent,eol,start

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Tweaks for browsing with Vim's built-in navigator
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" -----------------------------------------------------------------------------
" Plugin Management
" -----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Git Integration
Plug 'tpope/vim-fugitive'                " Git wrapper

" File Navigation
Plug 'mbbill/undotree'                   " Visualization of undo tree
Plug 'preservim/nerdtree'                " File system explorer
Plug 'ryanoasis/vim-devicons'            " Icons for NERDTree
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'                  " Fuzzy finder

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
Plug 'vim-airline/vim-airline-themes'    " Status bar themes
call plug#end()

" -----------------------------------------------------------------------------
" Visual Settings
" -----------------------------------------------------------------------------
" Color and Syntax
filetype plugin indent on
if has("syntax")
  syntax on
endif 
let g:onedark_terminal_italics = 1 
colorscheme onedark

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

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
  \   exe "normal! g`\"" |
  \ endif
  

" -----------------------------------------------------------------------------
" Search Settings
" -----------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set wildmenu
set path=**

" -----------------------------------------------------------------------------
" Plugin Configurations
" -----------------------------------------------------------------------------
" Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
set guifont=JetBrains\ Mono\ NL:h12

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
" Concealment settings
let g:pencil#conceallevel = 2
set concealcursor=""  " Show concealed text when on the line
set conceallevel=2    " Enable concealing
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 1
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_urls = 1
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

" Set custom markdown header colors
function! s:CustomMarkdownColors()
    " First override onedark's markdown bold groups
    highlight! markdownBold guifg=#e5c07b gui=bold cterm=bold
    highlight! htmlBold guifg=#e5c07b gui=bold cterm=bold

    " Then set header specific groups with explicit markdown prefix
    highlight! markdownH1 guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH2 guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH3 guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH4 guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH5 guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH6 guifg=#56c298 gui=bold cterm=bold

    " And HTML prefix
    highlight! htmlH1 guifg=#56c298 gui=bold cterm=bold
    highlight! htmlH2 guifg=#56c298 gui=bold cterm=bold
    highlight! htmlH3 guifg=#56c298 gui=bold cterm=bold
    highlight! htmlH4 guifg=#56c298 gui=bold cterm=bold
    highlight! htmlH5 guifg=#56c298 gui=bold cterm=bold
    highlight! htmlH6 guifg=#56c298 gui=bold cterm=bold

    " Force any bold within headers to use header color
    highlight! markdownH1Bold guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH2Bold guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH3Bold guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH4Bold guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH5Bold guifg=#56c298 gui=bold cterm=bold
    highlight! markdownH6Bold guifg=#56c298 gui=bold cterm=bold

    " Force heading delimiters to match header color
    highlight! mkdHeading guifg=#56c298 gui=bold cterm=bold

endfunction

augroup CustomMarkdownColors
    autocmd!
    autocmd ColorScheme * call s:CustomMarkdownColors()
    autocmd FileType markdown call s:CustomMarkdownColors()
augroup END

" Goyo and Limelight Integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"command! Zen Goyo

" Vim-Pencil Configuration
let g:pencil_higher_contrast_ui = 1
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
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
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-p> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>z :Goyo<CR> 
nnoremap <leader>m :MarkdownPreview<CR>

" Easier escape
inoremap jk <ESC>

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv 

" -----------------------------------------------------------------------------
" Auto Commands
" -----------------------------------------------------------------------------
" NERDTree auto-close
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
