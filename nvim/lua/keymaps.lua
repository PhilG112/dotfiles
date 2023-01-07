vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>w", ":w<CR>")

-- splitting windows
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- handling tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
