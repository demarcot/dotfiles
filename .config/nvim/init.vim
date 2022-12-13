set path+=**

set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set expandtab
set shiftwidth=2
set tabstop=2
set nowrap
set relativenumber 

set statusline=%F
set laststatus=2

call plug#begin()

Plug 'gruvbox-community/gruvbox'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'ThePrimeagen/harpoon' " TODO(Tom): setup keybinds and play around
Plug 'ThePrimeagen/vim-be-good'

Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

:colorscheme gruvbox

lua require("tcd")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

let loaded_matchparen = 1

" Leader
let mapleader = " "

" Biggest remaps
inoremap <C-c> <esc>
nnoremap U <C-r>

" Config edits
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>e<CR> :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>ze<cr> :edit ~/.zshrc<cr>

" File nav
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>f :e .
nnoremap <leader>sf :Vex<cr>

" Window/Buffer nav
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>nb :bnext<CR>
nnoremap <leader>pb :bprevious<CR>
nnoremap <leader>nw <C-W>l
nnoremap <leader>pw <C-W>h
nnoremap <leader>ww :only<cr>

" TODO(Tom): might want to revisit
" COC stuff
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>g<cr> :call CocActionAsync('jumpDefinition')<cr>
nnoremap K :call <sid>show_documentation()<cr>

" <c-space> to trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (idnex(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#pc#ready())
    call CocActionAsync('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" tab for completion
inoremap <silent><expr> <tab>
  \ pumvisible() ? "\<C-n>" :
  \ <sid>check_back_space() ? "\<tab>" :
  \ coc#refresh()
inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<C-h>"


