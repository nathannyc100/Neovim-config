-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'wbthomason/packer.nvim',

	{
		'nvim-telescope/telescope.nvim', 
        tag = '0.1.6',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	'rebelot/kanagawa.nvim',

	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {

			-- LSP Support 
			{'neovim/nvim-lspconfig'},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
            {"onsails/lspkind.nvim"},

            -- auto complete
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
            {'windwp/nvim-autopairs'},
            {'windwp/nvim-ts-autotag'},
		}

	},

    'linux-cultist/venv-selector.nvim',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    'nvim-tree/nvim-web-devicons',
}

local opts = {}

require("lazy").setup(plugins, opts)

