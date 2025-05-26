-- lua/colorscheme.lua

local clrs = {}

function clrs.setup()
	vim.opt.termguicolors = true
	--	vim.cmd.colorscheme("nightfly")
	vim.g.nightflyCursorColor = true
	vim.g.nightflyUnderlineMatchParen = true
	vim.g.nightflyItalics = true
end

return clrs
