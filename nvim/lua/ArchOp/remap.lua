vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Tree-sitter keybindings
local ts_utils = require('nvim-treesitter.ts_utils')

-- Show detailed node info
vim.keymap.set('n', '<leader>tti', function()
    local node = ts_utils.get_node_at_cursor()
    if node then
        local node_type = node:type()
        local start_row, start_col, end_row, end_col = node:range()

        -- Show in a floating window
        local bufnr = vim.api.nvim_create_buf(false, true)
        local lines = {
            "Tree-sitter Node Info:",
            string.format("Type: %s", node_type),
            string.format("Range: L%d:%d to L%d:%d", start_row+1, start_col, end_row+1, end_col),
            "",
            "Press q or <ESC> to close"
        }

        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
        vim.api.nvim_buf_set_option(bufnr, 'filetype', 'markdown')

        local width = math.max(unpack(vim.tbl_map(function(line) return #line end, lines))) + 2
        local height = #lines + 2

        local win = vim.api.nvim_open_win(bufnr, true, {
            relative = 'cursor',
            width = width,
            height = height,
            row = 1,
            col = 0,
            style = 'minimal',
            border = 'rounded'
        })

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<cmd>close<CR>', {nowait = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<ESC>', '<cmd>close<CR>', {nowait = true, silent = true})
    else
        print("No Tree-sitter node found at cursor position")
    end
end, {desc = "Show Tree-sitter node info"})

-- Incremental selection keymaps (moved from config)
vim.keymap.set('n', 'gnn', function()
    require('nvim-treesitter.incremental_selection').init_selection()
end, {desc = "Init treesitter selection"})

vim.keymap.set('n', 'grn', function()
    require('nvim-treesitter.incremental_selection').node_incremental()
end, {desc = "Increment treesitter selection"})

vim.keymap.set('n', 'grc', function()
    require('nvim-treesitter.incremental_selection').scope_incremental()
end, {desc = "Increment treesitter scope"})

vim.keymap.set('n', 'grm', function()
    require('nvim-treesitter.incremental_selection').node_decremental()
end, {desc = "Decrement treesitter selection"})
