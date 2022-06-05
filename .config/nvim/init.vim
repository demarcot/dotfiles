set path+=**

set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set expandtab
set shiftwidth=2
set tabstop=2
set nowrap
set number

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

Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

:colorscheme gruvbox

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
lua require("tcd")
" lua <<EOF
" local actions = require "telescope.actions"
" require('telescope').setup{ defaults = { file_ignore_patterns = { "node_modules", "/.git/" } }, pickers = { buffers = { mappings = { i = { ["<c-d>"] = actions.delete_buffer + actions.move_to_top, } } } } }
" require('telescope').load_extension "file_browser"
" EOF

let loaded_matchparen = 1
let mapleader = " "

"Navigate buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ft <cmd>Telescope file_browser<cr>

nnoremap <leader>sf :Telescope find_files cwd=~ hidden=true<CR>

inoremap <C-c> <esc>

"nvim config
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>e<CR> :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>ze<cr> :edit ~/.zshrc<cr>

nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>g<cr> :call CocActionAsync('jumpDefinition')<cr>
nnoremap K :call <sid>show_documentation()<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (idnex(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#pc#ready())
    call CocActionAsync('doHover')
  endif
endfunction

" tab for completion
inoremap <silent><expr> <tab>
  \ pumvisible() ? "\<C-n>" :
  \ <sid>check_back_space() ? "\<tab>" :
  \ coc#refresh()
inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <c-space> to trigger completion
inoremap <silent><expr> <C-space> coc#refresh()
