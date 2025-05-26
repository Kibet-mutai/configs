return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.85,
          row = 0.35,
          col = 0.5,
          border = "rounded",
          preview = {
            layout = "flex", -- horizontal if wide, vertical if narrow
            scrollbar = "float",
            delay = 50,
          },
        },
        previewers = {
          bat = {
            theme = "OneHalfDark", -- use bat for previewing files
            config = nil,          -- auto-detect config
          },
        },
        fzf_opts = {
          ["--ansi"] = "",
          ["--info"] = "inline",
          ["--height"] = "100%",
          ["--layout"] = "reverse",
          ["--border"] = "none",
        },
      })

      -- keymaps
      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "FZF: Find Files" })
      vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "FZF: Git Files" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FZF: Open Buffers" })
      vim.keymap.set("n", "<leader>fk", fzf.live_grep, { desc = "FZF: Live Grep" })
      vim.keymap.set("n", "<leader>fc", fzf.commands, { desc = "FZF: Commands" })

      -- Git integration
      vim.keymap.set("n", "<leader>gc", fzf.git_commits, { desc = "FZF: Git Commits" })
      vim.keymap.set("n", "<leader>gb", fzf.git_bcommits, { desc = "FZF: Buffer Git Commits" })
      vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "FZF: Git Status" })

      -- LSP integration
      vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "FZF: LSP Definitions" })
      vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "FZF: LSP References" })
      vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "FZF: LSP Implementations" })
      vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "FZF: Document Symbols" })
    end,
  },
}


