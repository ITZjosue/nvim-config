local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- nvim color schemes
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use 'fatih/vim-go'
  use 'ray-x/go.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
  	'nvim-telescope/telescope.nvim', branch = '0.1.x',
-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}
  -- icons
  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-tree/nvim-tree.lua',
  }
  -- to navigate between splitted windows
  use 'christoomey/vim-tmux-navigator'
  -- maximize current window
  use 'szw/vim-maximizer'
  -- comment with gcc
  use 'numToStr/Comment.nvim'
  -- lualine
  use {
  'nvim-lualine/lualine.nvim',
  }
  -- autocompletion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  }
  use 'saadparwaiz1/cmp_luasnip'
  
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- managin & intalling lsp servers
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  use 'hrsh7th/cmp-nvim-lsp'
  
  use {"nvimdev/lspsaga.nvim"}
  use 'onsails/lspkind.nvim'
  -- symbols autocompletion
  use {
	  "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- html tags autocompletion
  use 'windwp/nvim-ts-autotag'
  -- git integration
  use 'lewis6991/gitsigns.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
