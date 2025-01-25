return {
	{
		"williamboman/mason.nvim",
		config = true, -- Default Mason configuration
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "zls" }, -- Automatically install ZLS
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Add LSP capabilities for autocompletion

			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					local keymap = vim.keymap.set

					-- Keybindings for LSP actions
					keymap("n", "gd", vim.lsp.buf.definition, opts)
					keymap("n", "K", vim.lsp.buf.hover, opts)
					keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
					keymap("n", "gr", vim.lsp.buf.references, opts)
					keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					keymap("n", "[d", vim.diagnostic.goto_prev, opts)
					keymap("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer",   -- Buffer completions
			"hrsh7th/cmp-path",     -- Path completions
			"L3MON4D3/LuaSnip",     -- Snippet engine
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP completion
					{ name = "buffer" },   -- Buffer words
					{ name = "path" },     -- Path completion
				}),
			})
		end,
	},
}

