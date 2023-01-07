-- decide colorscheme
local colorscheme = "tokyonight"

-- setup tokyonight
local tokyonight_ok, tokyonight = pcall(require, "tokyonight")

if tokyonight_ok then
	tokyonight.setup({
		transparent = true,
	})
else
	vim.notify("tokyonight not found!")
end

-- setup colorscheme
local colorscheme_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorscheme_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
