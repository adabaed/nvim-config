return {
	{
		"williamboman/mason.nvim",
		keys = {
			{
				"<leader>pm",
				"<cmd>Mason<CR>",
				desc="Mason"
			},
		},
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
