------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Set leader keys
vim.g.mapleader = " "

map({ "i", "n" }, "<esc>", "<nop>", { noremap = true })
map("i", "jj", "<esc>", { noremap = true })
map("i", "jk", "<esc>", { noremap = true })
map("n", ";", ":", { noremap = true })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<CR>==", { noremap = true, silent = true, desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { noremap = true, silent = true, desc = "Move up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Delete a word backwards
map("n", "dw", "vb_d", {noremap = true})

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- buffer management
map("n", "<leader>k", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "<leader>j", "<cmd>bp<cr>", { desc = "Previous Buffer" })
map("n", "<leader>d", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>y", "<cmd>Telescope neoclip<cr>", { desc = "Delete Buffer" })

--format
 map("n", "<leader>f", vim.lsp.buf.format)

-- misc
map("n", "<Leader>s", ":noh<cr>", opts)
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

--file navigations
map("n", "<Leader>e", ":NvimTreeFindFileToggle<cr>", opts)
map("n", "<Leader>a", ":Dirbuf<cr>", opts)


