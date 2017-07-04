execute pathogen#infect()
syntax on
filetype plugin indent on

set langmenu=en_US.UTF-8
language en_US

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set encoding=utf8
set guifont=<FONT_NAME>:h<FONT_SIZE>


map <C-n> :NERDTreeToggle<CR>

"autocmd VimEnter * NERDTree
"map <Leader>n <plug>NERDTreeTabsToggle<CR>

let NERDTreeShowHidden=1

set hlsearch
set ruler
set number
set autochdir

set shiftwidth=2
set tabstop=2
set expandtab

set nocompatible
set incsearch             

set clipboard=unnamed

set mouse=a

" colors

set termguicolors
syntax enable
function! AdjustTheme()
     hi! Normal guifg=#c0c5ce ctermfg=251 guibg=256 ctermbg=256 " <- example
endfunction

augroup ThemeOverrides
    autocmd!
    autocmd ColorScheme OceanicNext call AdjustTheme()
augroup END
colorscheme OceanicNext


"for swapfiles
set noswapfile

filetype on
filetype plugin on

set grepprg=grep\ -nH\ $*

set autoindent
set colorcolumn=120

vnoremap // y/<C-R>"<CR>
"let g:nerdtree_tabs_open_on_console_startup=1

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode = 'r'

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" vim-rspec"
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
