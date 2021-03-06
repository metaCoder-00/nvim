" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-------------Basic settings-------------
syntax on
set number
set relativenumber
set hlsearch
set smartcase
set ignorecase
set autoindent
set copyindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set incsearch
set wildmenu
set linebreak
set showmatch
set wrap
set ruler
set splitright
set splitbelow
set cursorline
set showcmd
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100

" ==================== Terminal Behaviors ====================
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

" ==================== Basic Mappings ====================
let mapleader=","
noremap ; :
nnoremap <leader><space> :nohlsearch<CR>
" Copy to system clipboard
vnoremap Y "+y

" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')

" Color theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Lsp
Plug 'neovim/nvim-lspconfig'

" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Undo Tree
Plug 'mbbill/undotree'

" indent-blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" fuzzy find
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

" git
Plug 'lewis6991/gitsigns.nvim'

" highlight yank
Plug 'machakann/vim-highlightedyank'

" pairs & bracket
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'

" clipboard
Plug 'AckslD/nvim-neoclip.lua'

" tmux
Plug 'aserowy/tmux.nvim'

" tabline
Plug 'crispgm/nvim-tabline'

call plug#end()

" ================nvim-tree===============
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
lua require('nvim-tree').setup()

" ===============lsp============
lua require('nvim-lspconfig')

" ==============snip=============
set completeopt=menu,menuone,noselect
lua require('nvim-snip')

" =============Treesitter========
lua require('treesitter-config')

" =============indent-blankline=========
lua require('indent-blankline')

" ===========neoclip===========
lua require('neoclip-config')

" ==========tmux========
lua require('nvim-tmux-config')

" ============telescope==========
lua require('telescope-config')
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fg <cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>

" ==============git==========
lua require('gitsigns-config')

"==============nvim-tabline========
lua require('tabline').setup({})

" ================set colorscheme===========
set t_Co=256
set termguicolors
set background=light
colorscheme onehalflight
let g:airline_theme='papercolor'
highlight Normal guibg=NONE ctermbg=None

" ==============pairs & bracket========
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ==============clangd=============
nnoremap <leader>sw :ClangdSwitchSourceHeader<cr>
