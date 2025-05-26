return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		--setup mason
		require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		--now install your shit
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"asm_lsp",
				"pyright",
			},
			automatic_installation = true,
		})
		--install your other shit
		mason_tool_installer.setup({
			ensure_installed = { "prettier", "stylua", "isort", "eslint_d", "asmfmt", "cpptools", "clang-format" },
			automatic_installation = true,
		})
	end,
}
