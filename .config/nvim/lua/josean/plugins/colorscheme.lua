function DisableTransparantBackground()
	-- Kembalikan latar belakang ke normal (non-transparan)
	vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
	vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]])
end

function TransparantBackground()
	-- -- make background transparant
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{
		"joshdick/onedark.vim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			TransparantBackground()
			-- -- change color line number
			vim.cmd([[hi CursorLineNr guifg=#02EEEE]]) -- change current line number
			vim.cmd([[hi LineNr guifg=#988cbb]]) -- change other line number
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	-- {
	--   "folke/tokyonight.nvim",
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   config = function()
	--     local bg = "#011628"
	--     local bg_dark = "#011423"
	--     local bg_highlight = "#143652"
	--     local bg_search = "#0A64AC"
	--     local bg_visual = "#275378"
	--     local fg = "#CBE0F0"
	--     local fg_dark = "#B4D0E9"
	--     local fg_gutter = "#627E97"
	--     local border = "#547998"
	--
	--     require("tokyonight").setup({
	--       style = "night",
	--       on_colors = function(colors)
	--         colors.bg = bg
	--         colors.bg_dark = bg_dark
	--         colors.bg_float = bg_dark
	--         colors.bg_highlight = bg_highlight
	--         colors.bg_popup = bg_dark
	--         colors.bg_search = bg_search
	--         colors.bg_sidebar = bg_dark
	--         colors.bg_statusline = bg_dark
	--         colors.bg_visual = bg_visual
	--         colors.border = border
	--         colors.fg = fg
	--         colors.fg_dark = fg_dark
	--         colors.fg_float = fg
	--         colors.fg_gutter = fg_gutter
	--         colors.fg_sidebar = fg_dark
	--       end,
	--     })
	--     -- load the colorscheme here
	--     vim.cmd([[colorscheme tokyonight]])
	--   end,
	-- },
}
