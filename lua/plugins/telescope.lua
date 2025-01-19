return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 
		'nvim-lua/plenary.nvim' 
	},
	keys = {
		{
			"<leader>ff", 
			function()
				require("telescope.builtin").find_files(
					{
						search_dirs = {"."}
					}
				)

			end,
			desc = "Telescope find files"
		},
		{
			"<leader>fg", 
			function()
				require("telescope.builtin").live_grep(
					{
						search_dirs = {"."}
					}
				)

			end,
			desc = "Telescope live grep"
		},
		{
			"<leader>fb", 
			function()
				require("telescope.builtin").buffers()

			end,
			desc = "Telescope find buffers"
		},
	},
}
