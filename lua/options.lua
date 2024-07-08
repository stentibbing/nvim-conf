vim.opt.ruler = false

-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- disable netrw cuz we usin' nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- cursor style
vim.opt.guicursor = "n-v-c:block-Cursor"

-- advanced gui from terminal suppoer
vim.opt.termguicolors = true

-- line numbers & relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- wrap lines exceeding window size (not saving into file)
vim.opt.wrap = true
vim.opt.breakindent = true

-- tabs appear 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indentation rules
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- swap
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- scroll document 8 lines before reaching end of window
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- wrap guide line
vim.opt.colorcolumn = "120"

-- set highlight on search
vim.opt.hlsearch = true

-- enable mouse mode
vim.opt.mouse = 'a'

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- highlight yanked code
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
