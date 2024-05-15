return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function()
        vim.opt.termguicolors = true
        vim.cmd 'colorscheme kanagawa'
    end
}
