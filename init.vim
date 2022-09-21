" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'folke/which-key.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'rose-pine/neovim', {'as': 'rose-pine', 'branch': 'main' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'kdheepak/lazygit.nvim'

call plug#end()

lua << EOF
  require('gitsigns').setup {}
  require('which-key').setup {}
EOF

" Look and feel
colorscheme tokyonight-moon
set number
set relativenumber

source ~/.config/nvim/coc-init.vim

" Telescope commands
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Vim Script
nnoremap <leader>wk <cmd>WhichKey<cr>

" Gitsigns
Gitsigns toggle_current_line_blame
Gitsigns toggle_linehl
nnoremap <leader>glb <cmd>Gitsigns toggle_current_line_blame<cr>
nnoremap <leader>gdiff <cmd>Gitsigns diffthis<cr>
nnoremap <leader>gsb <cmd>Gitsigns stage_buffer<cr>

" Lazygit
nnoremap <leader>lg <cmd>LazyGit<cr>

" User defined
nnoremap <leader>ca <cmd>CocAction<cr>
nnoremap <leader>fm <cmd>Format<cr>
nnoremap <leader>hm <cmd>HarpoonMenu<cr>
nnoremap <leader>ha <cmd>HarpoonAdd<cr>
nnoremap <leader>hr <cmd>HarpoonRemove<cr>
:command! ConfigOpen e ~/.config/nvim/init.vim
:command! ConfigReload source ~/.config/nvim/init.vim
:command! HarpoonMenu lua require("harpoon.ui").toggle_quick_menu()
:command! HarpoonAdd lua require("harpoon.mark").add_file()
:command! HarpoonRemove lua require("harpoon.mark").rm_file()
