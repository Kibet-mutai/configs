return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "markdown", "markdown_inline", "go", "rust", "python", "javascript", "bash", "cpp", "c", "asm"},
				highlight = { enable = true },
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"elihunter173/dirbuf.nvim",
	},
  -- Example:  TODO: add comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
	},
	{
		"tpope/vim-fugitive",

		config = function()
			local keymap = vim.keymap

			keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
}

