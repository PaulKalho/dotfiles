vim.cmd.colorscheme = "catppuccin"

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)
vim.keymap.set("n", "<C-a>", vim.cmd.NvimTreeToggle)

-- move around: 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- scroll:
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-u>zz")

-- search:
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- switch projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Define a mapping to copy text to the system clipboard in visual mode
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
