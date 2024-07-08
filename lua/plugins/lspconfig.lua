return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local mason_lspconfig = require 'mason-lspconfig'
        local configs = require "configs.lspconfig"

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = configs["servers"][server_name],
                    filetypes = (configs["servers"][server_name] or {}).filetypes,
                }
            end,
        }

        -- custom nvchad cmd to install all mason binaries listed
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            if configs["ensure_installed"] and #configs["ensure_installed"] > 0 then
                vim.cmd "Mason"
                local mr = require("mason-registry")
                mr.refresh(function()
                    for _, tool in ipairs(configs["ensure_installed"]) do
                        local p = mr.get_package(tool)
                        if not p:is_installed() then
                            p:install()
                        end
                    end
                end)
            end
        end, {})

        vim.g.mason_binaries_list = configs["ensure_installed"]
    end
}
