local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
	-- Fundamental
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"nvim-tree/nvim-web-devicons", -- For file icons

	-- Explorer
	{
		"nvim-tree/nvim-tree.lua", -- A file explorer tree for neovim written in lua
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim", -- A snazzy buffer line (with tabpage integration) for Neovim
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Recommended (for coloured icons)
	},
	"moll/vim-bbye", -- Delete buffers and close files in Vim without closing your windows or messing up your layout.

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	-- Theme
	{
		"folke/tokyonight.nvim",
		config = function()
			local tokyonight = require("tokyonight")

			tokyonight.setup({
				transparent = true,
			})

			vim.cmd("colorscheme tokyonight")
		end,
	},

	-- Integrations
	"wakatime/vim-wakatime", -- WakaTime Integration
	"lewis6991/gitsigns.nvim", -- Git integration

	-- Completion Plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- Buffer completions
	"hrsh7th/cmp-path", -- Path completions
	"saadparwaiz1/cmp_luasnip", -- Snippet completions
	"hrsh7th/cmp-nvim-lsp", -- LSP completions
	"hrsh7th/cmp-nvim-lua", -- nvim-cmp source for neovim Lua API
	"hrsh7th/cmp-cmdline", -- cmdline completions

	-- Snippets
	"L3MON4D3/LuaSnip", -- Snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- Dependency: LSP util
			{ "neovim/nvim-lspconfig" }, -- Configurations for Nvim LSP
			{ "williamboman/mason.nvim" }, -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
			{ "williamboman/mason-lspconfig.nvim" }, -- Makes it easier to use lspconfig with mason.nvim
			{ "jay-babu/mason-null-ls.nvim" }, -- Bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.
			{ "jose-elias-alvarez/null-ls.nvim" }, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

			-- Dependency: Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Dependency: Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

	-- Terminal
	"akinsho/toggleterm.nvim", -- A Better Terminal

	-- Telescope
	{ "nvim-telescope/telescope.nvim", version = "0.1.0" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	-- Autopairs
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter

	-- Commenting
	"numToStr/Comment.nvim", -- Easily comment stuff
	"JoosepAlviste/nvim-ts-context-commentstring", -- Jsx comment support

	-- Practice Game
	"ThePrimeagen/vim-be-good",
})
