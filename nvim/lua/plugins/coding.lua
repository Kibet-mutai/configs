return {
	{
		"AlkslD/nvim-neoclip.lua",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim", "ibhagwan/fzf-lua",},
		},
		config = function()
			require("neoclip").setup({
         history = 1000,
        enable_persistent_history = true,
        db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
        preview = true,
        keys = {
          telescope = {}, -- not using telescope
          fzf = {
             select = 'default',
            paste = '<CR>',
            paste_behind = '<C-p>',
            custom = {},
          }
        },
      })

      -- keymap
      vim.keymap.set("n", "<leader>fy", function()
        require("neoclip.fzf")()
          end, { desc = "FZF: Yank History" })
      		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("nvim-surround").setup({
				surrounds = {
					["("] = {
						add = { "(", ")" },
					},
					["["] = {
						add = { "[", "]" },
					},
					["{"] = {
						add = { "{", "}" },
					},
					["<"] = {
						add = { "<", ">" },
					},
				},
			})
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			local keymap = vim.keymap

			keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}

