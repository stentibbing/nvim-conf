local map = vim.keymap.set
local nvim_tree_api = require("nvim-tree.api")
local harpoon = require("harpoon")
local builtin = require("telescope.builtin")

-- nvimtree
map("n", "<C-n>", function()
	nvim_tree_api.tree.toggle()
end)

-- harpoon
map("n", "<C-a>", function()
	harpoon:list():add()
end)

map("n", "<C-h>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), { title = " Harpoon ", title_pos = "center", border = "rounded" })
end)

map("n", "<C-j>", function()
	harpoon:list():prev()
end)

map("n", "<C-k>", function()
	harpoon:list():next()
end)

-- telescope
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})

-- lsp
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
