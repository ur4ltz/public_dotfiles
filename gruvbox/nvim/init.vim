syntax on

set nu rnu
set noerrorbells
 " Tab equal to 4 spaces
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set clipboard=unnamed

" Set cursor shapes for different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let mapleader = ' '

" Assign custom keybindings
nmap <leader>gy :Goyo<CR>
nmap <leader>rg :Rg <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ff :Files<CR>
nmap <leader>gf :GFiles<CR>
" You can get back to normal mode with <C-\> <C-N>
" Also creates one if there is no terminal
nmap <leader>t :FloatermToggle<CR>
" Easy definitions
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-definition)
" Easy copy pasting to other registers
nmap <C-c> "+y
nmap <C-p> "+p
" Move between windows faster
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

" Plugins YAY 
call plug#begin(stdpath('data') . '/plugged')
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'} " Best Youtuber and Streamer ever!!
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox' " Best theme ever
Plug 'vim-airline/vim-airline' " Themes
Plug 'vim-airline/vim-airline-themes' " Themes
Plug 'jremmen/vim-ripgrep' " Faster searching
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'voldikss/vim-floaterm' " Floating terminal
Plug 'junegunn/fzf' " Finder
Plug 'junegunn/fzf.vim' " Finder
Plug 'junegunn/goyo.vim' " For reading text
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Markdown Preview
" Plug 'mattn/emmet-vim' " Html autocompletion
call plug#end()

" Enable powerline fonts
let g:airline_powerline_fonts = 1
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_banner = 0

let $FZF_DEFAULT_OPTS='--reverse --preview="head -$LINES {}"'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Color scheme
colorscheme gruvbox
" Make the background equal to the one from the terminal
" hi Normal guibg=None ctermbg=None
