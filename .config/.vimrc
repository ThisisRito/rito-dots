set relativenumber
set number

set nocompatible

filetype plugin on

set hidden

set hls
nnoremap <esc><esc> :noh<return><esc>

set clipboard=unnamedplus
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" netrw
" set tree mode as default in Netrw
let g:netrw_liststyle = 3

" automatic installation https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin Vim-Plug plugin manager
call plug#begin('~/.vim/plugged')

" theme
Plug 'joshdick/onedark.vim'

" fadeout
Plug 'TaDaa/vimade'

" limelight
Plug 'junegunn/limelight.vim'

" hide
" Plug 'junegunn/goyo.vim'

Plug 'tpope/vim-surround'

" fzf plugin for Vim
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" chatGPT
Plug 'madox2/vim-ai', { 'do': './install.sh' }

" End Vim-Plug plugin manager
call plug#end()

" Begin Vim-Plug plugin config

" fzf
let g:fzf_preview_window = ['up,50%', 'ctrl-/']

" fzf key bidings
nnoremap <silent> <Leader>b :Buffers<CR>

" maps control+f to search files with fzf
nnoremap <silent> <C-f> :Files<CR>

" maps \f to finding in files with rg 
nnoremap <silent> <Leader>f :Rg<CR>

nnoremap <silent> <Leader>/ :BLines<CR>

nnoremap <silent> <Leader>' :Marks<CR>

nnoremap <silent> <Leader>g :Commits<CR>

nnoremap <silent> <Leader>H :Helptags<CR>

nnoremap <silent> <Leader>hh :History<CR>

nnoremap <silent> <Leader>h: :History:<CR>

nnoremap <silent> <Leader>h/ :History/<CR>

" keybidings in fzf preview
" CTRL-T open in a new tab
" CTRL-X open in a new split
" CTRL-V open in a new vertical split


" onedark
colorscheme onedark

" fadeout
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

" limelight
" set background=dark
" highlight Normal ctermbg=235

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let g:limelight_conceal_termfg = 'gray'
let g:limelight_conceal_termfg = 240 " 
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" TODO let g:limelight_bop = '{\%([^{]*{[^}]*}\)*'
let g:limelight_bop = '{'
let g:limelight_eop = '}'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" autocmd VimEnter * Limelight

" ChatGPT
xnoremap <leader>c :AIChat<CR>
nnoremap <leader>c :AIChat<CR>

let myprompt = "Please add comments to the code explaining the code line by line".", and keep in mind that you can only write comments"
command! -range -nargs=? AICode <line1>,<line2>call vim_ai#AIRun(<range>, myprompt . "Noted that the programming syntax is " . &filetype)

xnoremap <leader>e :AICode<CR>
nnoremap <leader>e :AICode<CR>

