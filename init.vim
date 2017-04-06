" ------------------------------------
" Basic Settings
" ------------------------------------
if !&compatible
  set nocompatible
endif

set clipboard=unnamed
set number
set t_Co=256
set noswapfile
set sh=zsh
set hlsearch
set ruler
set title
set incsearch
set wildmenu wildmode=list:full
set laststatus=2

filetype indent on
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2
autocmd ColorScheme * highlight LineNr ctermfg=242

augroup MyAutoCmd
  autocmd!
augroup END

" ------------------------------------
" vim-airline
" ------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 0
let g:Powerline_symbols='unicode'

" ------------------------------------
" Keybinding
" ------------------------------------
nnoremap PP "0p
noremap x "_x
nnoremap <C-j> i<CR><ESC>
nnoremap <C-m> O<ESC>
nnoremap <C-M> o<ESC>
nnoremap <Space> i<Space><ESC>

" Window
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

" Terminal
nnoremap tt :terminal<CR>

" Tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sc :<C-u>tabclose<CR>
nnoremap sn gt
nnoremap sp gT
tnoremap <silent> <ESC> <C-\><C-n>

" Delete
nnoremap <C-h> i<BS><RIGHT><ESC>
imap <C-k> <ESC>d$i
imap <C-y> <ESC>pi
imap <C-d> <ESC>xi

" Move
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>

inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <UP>
inoremap <C-d> <ESC>xi

imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>

" dein settings
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:lazy_toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:lazy_toml_file)
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
