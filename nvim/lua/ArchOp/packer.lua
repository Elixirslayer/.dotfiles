return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use('nvim-treesitter/playground')
    use('HiPhish/rainbow-delimiters.nvim')
    use('mbbill/undotree')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('mfussenegger/nvim-jdtls')
    use({
        "neovim/nvim-lspconfig",
        requires = { "folke/lazydev.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end
    })
    use {
        'Mofiqul/vscode.nvim',
        config = function()
            vim.o.background = 'dark'
            require('vscode').setup({})
            vim.cmd('colorscheme vscode')
        end
    }
end)
