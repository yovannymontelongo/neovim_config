return{
    "nvim-treesitter/nvim-treesitter",
    cmd = 'TSUpdate',
    build = ':TSUpdate',
    lazy = false,
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "java",
                "javascript",
                "json",
                "kotlin",
                "lua",
                "luadoc",
                "pem",
                "python",
                "query",
                "regex",
                "ruby",
                "rust",
                "smithy",
                "sql",
                "tsv",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true
        })
    end
}
