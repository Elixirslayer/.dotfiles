require('nvim-treesitter.configs').setup({
    -- Parser installation config
    ensure_installed = { "java", "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,

    -- Highlighting config
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    -- Rainbow parentheses
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
    },

    -- Indentation
    indent = {
        enable = true,
        disable = { "python" }, -- disable for languages where it can be problematic
    },

    -- Text objects and incremental selection
    incremental_selection = {
        enable = true,
    },
})

-- Automatic hover diagnostics
vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})
