local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Fundamental
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("kyazdani42/nvim-web-devicons") -- For file icons

  -- Explorer
  use({
    "kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
    requires = { "kyazdani42/nvim-web-devicons" }, -- optional, for file icons
  })

  -- Bufferline
  use({
    "akinsho/bufferline.nvim", -- A snazzy buffer line (with tabpage integration) for Neovim
    requires = { "kyazdani42/nvim-web-devicons" }, -- Recommended (for coloured icons)
  })
  use("moll/vim-bbye") -- Delete buffers and close files in Vim without closing your windows or messing up your layout.

  -- Theme
  use({
    "folke/tokyonight.nvim",
    config = function()
      local tokyonight = require("tokyonight")

      tokyonight.setup({
        transparent = true,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  })

  -- Integrations
  use("wakatime/vim-wakatime") -- WakaTime Integration
  use("lewis6991/gitsigns.nvim") -- Git integration

  -- Completion Plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- Buffer completions
  use("hrsh7th/cmp-path") -- Path completions
  use("saadparwaiz1/cmp_luasnip") -- Snippet completions
  use("hrsh7th/cmp-nvim-lsp") -- LSP completions
  use("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua API
  use("hrsh7th/cmp-cmdline") -- cmdline completions

  -- Snippets
  use("L3MON4D3/LuaSnip") -- Snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
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
  })

  -- Terminal
  use("akinsho/toggleterm.nvim") -- A Better Terminal

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- Autopairs
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

  -- Commenting
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("JoosepAlviste/nvim-ts-context-commentstring") -- Jsx comment support

  -- Practice Game
  use("ThePrimeagen/vim-be-good")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
