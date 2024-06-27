return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
			enabled = false,
		},
	},

	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({ style = "darker" })
			require("onedark").load()
		end,
	},
}
