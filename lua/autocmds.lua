local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-- lsp format on save
local _augroups = {}
local get_augroup = function(client)
    if not _augroups[client.id] then
        local group_name = 'zro-lsp-format-' .. client.name
        local id = create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
    end

    return _augroups[client.id]
end

create_autocmd('LspAttach', {
    group = create_augroup('zro-lsp-attach-format', { clear = true }),
    callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        if not client.server_capabilities.documentFormattingProvider then
            return
        end

        vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    async = false,
                    filter = function(c)
                        return c.id == client.id
                    end,
                }
            end,
        })
    end,
})

-- :bd and :q close nvim-tree with the last buffer
create_autocmd({ 'BufEnter', 'QuitPre' }, {
    nested = false,
    callback = function(e)
        local tree = require('nvim-tree.api').tree
        if not tree.is_visible() then
            return
        end
        local winCount = 0
        for _, winId in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(winId).focusable then
                winCount = winCount + 1
            end
        end
        if e.event == 'QuitPre' and winCount == 2 then
            vim.api.nvim_cmd({ cmd = 'qall' }, {})
        end
        if e.event == 'BufEnter' and winCount == 1 then
            vim.defer_fn(function()
                tree.toggle({ find_file = true, focus = true })
                tree.toggle({ find_file = true, focus = false })
            end, 10)
        end
    end
})
