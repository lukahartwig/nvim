-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cn", "<Cmd>cnext<CR>")
vim.keymap.set("n", "<leader>cp", "<Cmd>cprev<CR>")
vim.keymap.set("n", "<leader>cq", "<Cmd>cclose<CR>")

