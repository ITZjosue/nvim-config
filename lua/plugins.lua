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
  use {'nyoom-engineering/oxocarbon.nvim'}
  use 'jaredgorski/fogbell.vim'
  use 'shaunsingh/nord.nvim'
  use 'LuRsT/austere.vim' 
  use 'joshdick/onedark.vim'
  -- nvim color schemes
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- functions folding

  use 'fatih/vim-go'
  use 'ray-x/go.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
  	'nvim-telescope/telescope.nvim', branch = '0.1.x',
-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}
  
  use 'nvim-tree/nvim-web-devicons' -- icons

  use 'nvim-tree/nvim-tree.lua' -- navigate between files
  
  use 'christoomey/vim-tmux-navigator' -- to navigate between splitted windows
  
  use 'szw/vim-maximizer' -- maximize current window
 
  use 'numToStr/Comment.nvim' -- comment with gcc
  
  use 'nvim-lualine/lualine.nvim' -- lualine
  -- autocompletion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- autocompletion

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  }
  use 'saadparwaiz1/cmp_luasnip'
  -- snippets
  --
  use 'nvim-treesitter/nvim-treesitter' -- syntax highlighting

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

  -- transparent background
  use 'xiyaowong/transparent.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugin
  if packer_bootstrap then
    require('packer').sync()
  end
end)
