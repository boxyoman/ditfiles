let s:uname = ""
if has("unix")
  let s:uname = substitute(system("uname"), '\n', '', '')
endif

" Change Leader
let mapleader = ","

" vim-plug, some plugin manager
call plug#begin('~/dotfiles/nvim/plugged/')

Plug 'SirVer/ultisnips'

" Colorfully stuff
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'jceb/vim-orgmode'

" Syntax stuff
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'vim-scripts/vim-xdc-syntax'
Plug 'lervag/vim-latex'
Plug 'keith/swift.vim'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'OrangeT/vim-csharp'
Plug 'ElmCast/elm-vim'
Plug 'idris-hackers/idris-vim'
Plug 'derekwyatt/vim-scala'
Plug 'raichoo/purescript-vim'
Plug 'frigoeu/psc-ide-vim'
Plug 'LnL7/vim-nix'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'parsonsmatt/intero-neovim'
" Plug 'alx741/vim-hindent'

" F#
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

" TypeScript
Plug 'mhartington/nvim-typescript'


" File finding stuff
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'kien/ctrlp.vim'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Other
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'editorconfig/editorconfig-vim'

" " Lints and completers
" Plug 'Valloric/YouCompleteMe', {'do': './install.sh '}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'Shougo/neco-vim'
Plug 'benekastah/neomake'

" Motions
Plug 'bkad/CamelCaseMotion'
Plug 'b4winckler/vim-angry'
Plug 'justinmk/vim-sneak'

" Random
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnable'}
Plug 'tpope/vim-commentary'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

call plug#end()


if has('nvim') " This way, you can also put this in your plain vim config

	" function which starts a nvim-hs instance with the supplied name
	function! s:RequireHaskellHost(name)
		" It is important that the current working directory (cwd) is where
		" your configuration files are.
		return jobstart(['stack', 'exec', 'my-nvim-hs', a:name.name], {'rpc': v:true, 'cwd': expand('$HOME') . '/dotfiles/nvim/'})
	endfunction

	" Register a plugin host that is started when a haskell file is opened
	call remote#host#Register('haskell', "*.l\?hs", function('s:RequireHaskellHost'))

	" But if you need it for other files as well, you may just start it
	" forcefully by requiring it
	let hc=remote#host#Require('haskell')
endif

" Deoplete
let g:deoplete#enable_at_startup = 1


" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Theme Stuff
colorscheme PaperColor
set background=light
let g:airline_theme='papercolor'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'

" Indent-Guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


" CTRlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*/build/*,*/STL/*,*/target/*,*/Debug/*,*/node_modules/*,*/bower_components/*,*/justinviews/*,*/img/*,*/typings/*,*/elm-stuff/*,*/public/*,*/dist/*,*/output/*

" C++ highighting
let g:cpp_class_scope_highlight = 1

" Rust
let g:rust_recommended_style = 0

" Racer
let g:racer_cmd = "/Users/Jonny/.cargo/bin/racer"
if s:uname == "Darwin"
  let $RUST_SRC_PATH="/Users/Jonny/Developer/home/computer/rust/rust/src/"
elseif s:uname == "Linux"
  let $RUST_SRC_PATH="/home/jonny/developer/computer/rust/src/"
endif

" " "YouCompleteMe
" let g:ycm_confirm_extra_conf = 0
" nnoremap yd :YcmCompleter GoTo<CR>
" nnoremap ydd :YcmCompleter GoToDefinition<CR>
" nnoremap ygt :YcmCompleter GetType<CR>
" nnoremap ygp :YcmCompleter GetParent<CR>
" nnoremap ycfi :YcmCompleter FixIt<CR>
" nnoremap yc :YcmDiags<CR>
" let g:Show_diagnostics_ui = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_rust_src_path = "/Users/Jonny/Developer/home/computer/rust/rust/src/"
" let ycm_filetype_blacklist = {
"       \ 'tagbar' : 1,
"       \ 'qf' : 1,
"       \ 'notes' : 1,
"       \ 'markdown' : 1,
"       \ 'unite' : 1,
"       \ 'text' : 1,
"       \ 'vimwiki' : 1,
"       \ 'pandoc' : 1,
"       \ 'infolog' : 1,
"       \ 'mail' : 1,
"       \ 'fsharp' : 1,
"       \ 'haskell' : 1,
"       \ 'elm' : 1
"       \}

"Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_haskell_enable_makers = ['hlint']
autocmd! BufWritePost * Neomake

"UltiSnip
let g:UltiSnipsSnippetsDir    = '~/dotfiles/nvim/UltiSnips'
let g:UltiSnipsExpandTrigger  = "<c-j>"
let g:UltiJumpForwardTrigger  = "<c-j>"
let g:UltiJumpBackwardTrigger = "<c-s-j>"

" NERDTree
nnoremap <leader>o :NERDTreeToggle<CR>

" CamelCaseMotion
map <silent> gw <Plug>CamelCaseMotion_w
map <silent> gb <Plug>CamelCaseMotion_b
map <silent> ge <Plug>CamelCaseMotion_e
map <silent> gge <Plug>CamelCaseMotion_ge
omap <silent> igw <Plug>CamelCaseMotion_ib
xmap <silent> igw <Plug>CamelCaseMotion_ib
omap <silent> ige <Plug>CamelCaseMotion_ie
xmap <silent> ige <Plug>CamelCaseMotion_ie

" Gundo
nnoremap <leader>u :MundoToggle<CR>

" Verilog
let b:verilog_indent_modules = 1

" Tab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" random settings
set encoding=utf-8
set spelllang=en_us
set showmode
set showcmd
set visualbell

set cursorline
set relativenumber
set number
set ruler

" undo setting
set undofile
set undolevels=1000
set undoreload=10000
set hidden
au FocusLost * :wa
set winaltkeys=no

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Search stuff
set incsearch
set smartcase
set ignorecase
set gdefault
set hlsearch
set showmatch
nnoremap <leader><space> :noh<cr>

" long lines
set wrap
set textwidth=80
set formatoptions=tqcnw1
set colorcolumn=81

" Moving
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
nnoremap <c-e> 4<c-e>
nnoremap <c-y> 4<c-y>

" Buffers
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" Quick Macro
nnoremap Q @q

" Sudo save
cmap w!! w !sudo /usr/bin/tee > /dev/null %

" Easy Copy and paste from clip board
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap Y y$

" Window mappings
nnoremap <leader>w <C-w>n<C-w>L
nnoremap <leader><leader> <c-w><c-w>
nnoremap <leader>. <c-w><c-h>
nnoremap <c-w>n :vnew<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" some file specific stuff
au BufReadPost,BufRead *.md set filetype=markdown

" Invisable Characters
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Open new tab with terminal
nnoremap <leader>tnw <C-w>n<C-w>L:term<cr>
nnoremap <leader>tnt :tabnew<cr>:term<cr>

" terminal mode
tmap <leader><leader> <c-\><c-n><leader><leader>
tmap gt <c-\><c-n>gt

" C++ options
set cino=N-s
set cino+=g0
set cino+=l1
set cino+=b0

" Open help vertially
autocmd FileType help wincmd L

" Bye bye trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

