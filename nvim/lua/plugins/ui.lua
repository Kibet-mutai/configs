return {
	{
		"rcarriga/nvim-notify",
		init = function()
			vim.notify = require("notify")
			vim.api.nvim_set_keymap(
				"n",
				"<space>x",
				':lua require("notify").dismiss()<cr>',
				{ noremap = true, silent = false }
			)
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
}

