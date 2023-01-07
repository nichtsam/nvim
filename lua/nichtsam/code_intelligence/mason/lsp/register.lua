-- Check for general options
local opts_ok, opts = pcall(require, "nichtsam.code_intelligence.mason.lsp.settings.opts")
if not opts_ok then
	vim.notify("basic options for LSP handlers not found!")
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	vim.notify("mason-lspconfig not found!")
	return
end

mason_lspconfig.setup({
	-- names in https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"eslint",
		"taplo",
		"jsonls",
		"tsserver",
	},
	automatic_installation = true,
})

mason_lspconfig.setup_handlers({
	-- Basic register
	function(server_name)
		require("lspconfig")[server_name].setup(opts)
	end,
	-- lua specific register
	["sumneko_lua"] = function()
		local specific_opts_ok, specific_opts =
			pcall(require, "nichtsam.code_intelligence.mason.lsp.settings.sumneko_lua")
		if not specific_opts_ok then
			vim.notify("Specific options for sumneko_lua handler not found!")
			return
		end

		require("lspconfig").sumneko_lua.setup(vim.tbl_deep_extend("force", opts, specific_opts))
	end,
	-- json specific register
	["jsonls"] = function()
		local specific_opts_ok, specific_opts = pcall(require, "nichtsam.code_intelligence.mason.lsp.settings.jsonls")
		if not specific_opts_ok then
			vim.notify("Specific options for sumneko_lua handler not found!")
			return
		end
		require("lspconfig").jsonls.setup(vim.tbl_deep_extend("force", opts, specific_opts))
	end,
})
