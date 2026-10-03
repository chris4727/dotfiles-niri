" ==  VIMRC  =====================================
"  Requires:
"	- vim-plug: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" ==  GENERAL  ===================================

set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number
set relativenumber
set showmode
set showcmd
set nobackup
set nocursorline
set foldenable
set foldmethod=indent
set foldlevel=99  "fold levels to 99 opened by default
set history=5000
set guifont=Fira\ Code\ Nerdfont:12
set textwidth=72
let mapleader=" "
let maplocalleader=";"

" ---  INDENTATION  ------------------------------

set shiftwidth=2  " Equivalent number of spaces when pressing '>'
set tabstop=2     " Equivalent number of spaces when pressing <Tab>
set softtabstop=2
set autoindent    " Indents lines when pressing enter.
set smartindent   " Works for C type languages
set expandtab     " Replaces <TAB> with Spaces
set smarttab      " Ensures backspace removes expanded tabs as expected

" Define characters to represent hidden characters when 'set list' is active
" Tabstop, Space, Non-breaking space, End of line, Line extends beyond screen.
  set listchars=tab:\ \ ⇥,space:␣,nbsp:⌵,eol:↵,extends:…
" Soft linewraps are indented and indicated by '...'
  set showbreak=...

" ---  LINE WRAPPING  ----------------------------

" TODO Set toggleable soft line wrapping to keep 1 line/sentence for improved
" version control, while still being easy to read on small screens.
  set colorcolumn=80    " used by gruvbox_colorcolumn
  map Q gqq             " Use Q for line breaks instead of Ex mode.

" ---  AUTOCOMPLETE  -----------------------------

  set wildmenu
  set wildmode=list:longest
  set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.img,.xlsx
" TODO: Get this working
  set complete+=kspell            " <C-p> in insert mode to show spellings
  set completeopt=menuone,longest " Completion popup settings
  set shortmess+=c                " Removes notifications from footer bar

" ---  SPELLCHECK  -------------------------------

  set spelllang=en_us "Add new iso codes comma separated.
"hi clear SpellBad
  setlocal nospell

" ---  CURSOR  -----------------------------------

" Use a line cursor in insert mode and a block cursor everywhere else.
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[1 q"

" ---  ABBREVIATIONS  ----------------------------

"TODO Get this working to autocorrect 'teh' to 'the'
"iab teh the

" ---  SEARCH  -----------------------------------

set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

" ==  KEYBINDINGS  ===============================

" ---  LEADER  -----------------------------------

  map <Leader>c :source $MYVIMRC<CR>  " Source vimrc
"" Check file in shellcheck:
"	map <leader>s :!clear && shellcheck -x %<CR>
"" Open corresponding .pdf/.html or preview
"	map <leader>p :!opout "%:p"<CR>

" ---  FUNCTION KEYS  ----------------------------

"F1: Help
"F2: Rename
"F3: Find (Firefox, Chrome, Win Explorer)
"F4: Toggle line numbers:
  nnoremap <F4> :NumbersOnOff<CR> \| :NumbersToggle<CR>
"F5: Reload/compile
"TODO Save, then run compilation script
  map <F5> :w! \| !compile <c-r>%<CR><CR>
"F6: Open output of compilation
"TODO setup:map <F6> :!openout <c-r>%<CR><CR>
"F7: Spellcheck
  nnoremap <F7> :setlocal spell!<CR>
  inoremap <F7> <C-o>:setlocal spell!<CR>
"F8: Toggle visually showing all whitespace characters.
  nnoremap <F8> :set list!<CR>
"F9: Insert datestamp at cursor
  nnoremap <F9> :r! date "+\%Y-\%m-\%d \%H:\%M:\%S \%A"<CR>
  inoremap <F9> :r! date "+\%Y-\%m-\%d \%H:\%M:\%S \%A"
"F10: Opens menubar
"F11: Fullscreen. Toggles Goyo
  nnoremap <F11> :Goyo<CR>
"F12: Devtools, Shows dashboard

" ---  CLIPBOARD  --------------------------------

" Requires gvim for + and * registers for clipboard access.
" Yank selection into system clipboard (may need `+` instead of `*`)
  vnoremap <C-y> "+ygv"*y
  nnoremap <C-p> "+]p
" See :help clipboard. 
" You can :set clipboard=unnamed or :set clipboard=unnamedplus to make all yanking/deleting operations automatically copy to the system clipboard.
  set clipboard=unnamedplus,unnamed

" Copy/Yank selection into system clipboard
  vnoremap <leader>y "+y
" Copy the current buffer's path to your clipboard.
  nmap <leader>y :let @+ = expand("%")<CR>

" TODO Set binding to paste from system clipboard <leader>p
" Paste selection from system clipboard
  vnoremap <leader>p "+P

" + Register is system clipboard
" * Register is

" ---  NAVIGATION  -------------------------------

nnoremap j jzz
nnoremap k kzz

" ---  SPLITS  -----------------------------------

" Vertical split
  nnoremap <leader>v :vsp 
" Horizontal split
  nnoremap <leader>d :sp 

  set splitbelow splitright
" Switch between splits
  nnoremap <leader>w <C-w>w
" If not running in Tmux:
  if !exists('$TMUX')
" Navigate between splits with Alt+hjkl
" TODO hjkl keys not working
"    nmap <A-h> <C-w>h
"    nmap <A-j> <C-w>j
"    nmap <A-k> <C-w>k
"    nmap <A-l> <C-w>l
" Or with Alt+Arrow keys
    nnoremap <A-Left> <C-w>h
    nnoremap <A-Down> <C-w>j
    nnoremap <A-Up> <C-w>k
    nnoremap <A-Right> <C-w>l
  endif

" ---  AUTOCOMMANDS  -----------------------------

" Set filetypes
	autocmd BufRead,BufNewFile *.md,*.man set filetype=pandoc
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	autocmd BufRead,BufNewFile .bash*,.env* set filetype=sh

" ==  PLUGINS  ===================================

" TODO Only load plugins if Vim Plug is detected.
" vim-plug
"if filereadable(expand("~/.vim/autoload/plug.vim"))

call plug#begin('~/.vim/autoload')
" junegunn/plug

" Visual
  Plug 'morhetz/gruvbox'
  Plug 'rose-pine/vim'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'ap/vim-css-color'
  Plug 'junegunn/goyo.vim'
" Documents
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'vimwiki/vimwiki'
" Version control
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
" Utilities
  Plug 'vim-scripts/AutoComplPop'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
  Plug 'myusuf3/numbers.vim' "Smart relative line numbers
" Navigation
  Plug 'tpope/vim-vinegar'
  Plug 'junegunn/fzf.vim'
" Languages
  Plug 'jalvesaq/Nvim-R'
  Plug 'gaalcaras/ncm-R'
  Plug 'tbastos/vim-lua'
  Plug 'Fymyte/rasi.vim'
" TODO: Add/configure the following plugins 
"Plug 'will133/vim-dirdiff'
"Plug 'dhruvasagar/vim-table-mode'

call plug#end()

"endif
":PlugInstall
":PlugClean

" ==  PLUGIN CONFIG  =============================

" ---  VIMTEX  -----------------------------------
let g:vimtex_view_method = 'zathura'

" ---  VIMWIKI  ----------------------------------

let g:vimwiki_list = [{'path': '~/Notes/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

" ---  MARKDOWN  ---------------------------------

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1 " Allow LaTeX math
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
"TODO change these to `.md` aucmd
" Format table under cursor
  nnoremap <C-t> :TableFormat<CR>
"Check todo
  nnoremap <leader>x  :.s/^-\ \[\ \]/-\ \[x\]/<CR>

" ---  TABULAR  ----------------------------------

if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
endif

" ---  GOYO  -------------------------------------
let g:goyo_width = 70

"" ---  ULTISNIPS  --------------------------------
"" See https://www.ejmastnak.com/tutorials/vim-latex/ultisnips/
"let g:UltiSnipsJumpForwardTrigger="<C-n>"
"""UltiSnipEdit splits vertically
"let g:UltiSnipsEditSplit="vertical"
""" Specify absolute path to prevent scanning entire runtimepath
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
""" TODO Set vim and zettlr to share snippet directory if possible?

" ---  FZF  --------------------------------------
map <C-f> <Esc><Esc>:Files!<CR>			"FZF in directory
inoremap <C-f> <Esc><Esc>:BLines!<CR>	"FZF in document
map <C-g> <Esc><Esc>:BCommits!<CR>		"FZF git commits
"inoremap <C-g> <Esc><Esc>:Snippets!<CR>		"FZF snippets

" ==  COLORSCHEME  ===============================

set termguicolors
let g:disable_bg = 1
let g:disable_float_bg = 1

" --- DARK MODE  ---------------------------------
"
set background=dark
"let g:gruvbox_contrast_dark = 'medium'
"colorscheme gruvbox
colorscheme rosepine
"colorscheme catppuccin_mocha

" --- LIGHT MODE  --------------------------------

"set background=light
"colorscheme rosepine_dawn
"colorscheme catppuccin_latte

" --- COLORSCHEME SETTINGS -----------------------
"if (g:colors_name == 'gruvbox')
"  if (&background == 'dark')
"    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
"  else
"    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
"    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
"    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
"  endif
"endif

" Spelling mistakes will be colored up red.
"hi SpellBad cterm=bold,italic ctermfg=red guifg=red guibg=black
"hi SpellLocal cterm=bold,italic ctermfg=red guifg=red guibg=black
"hi SpellRare cterm=bold,italic ctermfg=red guifg=red guibg=black
"hi SpellCap cterm=bold,italic ctermfg=red guifg=red guibg=black
" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=1 ctermbg=NONE guisp=#eb6f92
hi SpellCap cterm=underline ctermfg=1 ctermbg=NONE guisp=#eb6f92
hi SpellRare cterm=underline ctermfg=1 ctermbg=NONE guisp=#eb6f92
hi SpellLocal cterm=underline ctermfg=1 ctermbg=NONE guisp=#eb6f92

" ==  STATUSLINE  ================================
" ---  REFERENCES  -------------------------------

"Define user highlight groups User<1-9>
" See :help cterm-colors
" Dark Grey
  hi User1 ctermfg=8 cterm=italic ctermbg=NONE
" Green
  hi User2 ctermfg=10 ctermbg=NONE
" Red
  hi User3 ctermfg=1 ctermbg=NONE
"Call user colors:
"	set statusline+=%<1-9>*
"Return to default colors:
"	set statusline+=%*

"Define current vim mode
"	Second 'string' is what will be displayed.
"TODO Figure out how to change color depending on currentmode
  let g:currentmode={
       \ 'n'  : '🅝 ',
       \ 'v'  : '🅥 ',
       \ 'V'  : '🅥 l',
       \ "\<C-V>" : '🅥 b',
       \ 'i'  : '🅘 ',
       \ 'R'  : '🅡 ',
       \ 'Rv' : '🅥 r',
       \ 'c'  : '🅒 ',
       \}
  set statusline=
"Set statusline colors:
"	Run <:so $VIMRUNTIME/syntax/hitest.vim> to view available 
"	colors to enter into next line:
  set statusline+=%#StatusLineNC#

" ---  LEFT STATUSLINE  --------------------------
"Set color to user 2, green
  set statusline+=%2*
"Show current mode from `currentmode` function
  set statusline+=\ %{toupper(g:currentmode[mode()])}
"Set color to user 1, grey
  set statusline+=%1*
"Show full file path
"TODO Set to filename only
  set statusline+=\ %f
"Show filetype???
"???
  set statusline+=\ %R
"Show filetype, or `none` if filetype is empty
  set statusline+=%{&filetype!=#''?&filetype.'':'none'}
"Indicate when file has unwritten changes `+`
  set statusline+=\ %M
" Use a divider to separate the left and right side
  set statusline+=%=

" ---  RIGHT STATUSLINE  -------------------------
"Current column number
  set statusline+=\ ⇥\ %c\ 
"Current line/total lines
  set statusline+=⤓\ %l/%L\ 
"Show the status on the second to last line
  set laststatus=2

"Potential unicode icons: 
" 🔒⚿ 
" Δ Ψ λ ζ μ 
" 🟘 🟖 🞉 
" 🅝 Ⓝ ⓝ 🅘 Ⓘ ⓘ 🅥 Ⓥ ⓥ 🅒 Ⓒ ⓒ 
"" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
""function! s:statusline_expr()
"  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"  let ro  = "%{&readonly ? '[RO] ' : ''}"
"  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"  let sep = ' %= '
"  let pos = ' %-12(%l : %c%V%) '
"  let pct = ' %P'
"
"  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
"endfunction
"
"let &statusline = s:statusline_expr()
