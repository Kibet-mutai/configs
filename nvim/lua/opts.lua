local opt = vim.opt
local o = vim.o
local g = vim.g
local cmd = vim.cmd

--misc
o.showmode = false
o.laststatus = 3

o.cursorline = true
o.cursorlineopt = "number"

--Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- misc
opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = ""

--python stuff
g.python3_host_prog = "/usr/bin/python3"
g.python_host_prog = "/usr/bin/python"

--Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

--Disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.undolevels = 1000
o.wrap = true
o.hidden = true
o.backup = false
--o.termguicolors = true

--Popup
vim.opt.pumblend = 10
vim.opt.pumheight = 10

-- universal clipboard
vim.opt.clipboard = "unnamedplus"

-- I don't know in lua or doesn't work
vim.cmd([[
set foldmethod=marker
set t_ti= t_te=
]])

--------------------------------------AUTOCMDS----------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

--- 1) hightlight on yank
autocmd({ "TextYankPost" }, {
	group = augroup("highlight-yank", {}),

	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

--- 2) resize split if windows got resize
autocmd({ "VimResized" }, {
	group = augroup("resize_splits", {}),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext" .. current_tab)
	end,
})

--- 3) go to last file position when opening a file
autocmd({ "BufReadPost" }, {
	group = augroup("last_loc", {}),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
