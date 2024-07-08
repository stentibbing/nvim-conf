return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = require "configs.treesitter",
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        })
    end,
}
