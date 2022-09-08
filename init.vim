" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'folke/which-key.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

colorscheme onedark
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

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

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