vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)
vim.keymap.set("n", "<C-a>", vim.cmd.NvimTreeToggle)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz") 

-- search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- clipboard
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })

-- switch to previous file
vim.keymap.set('n', '<leader>sf', ':e #<CR>', { noremap = true })
