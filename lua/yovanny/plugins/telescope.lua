return {
    'nvim-telescope/telescope.nvim', branch= '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' , 'sharkdp/fd'},
    config = function()
        local builtin = require('telescope.builtin')
        keyset = vim.keymap.set
        keyset('n', '<leader>ff', builtin.find_files, {})
        keyset('n', '<leader>fg', builtin.live_grep, {})
        keyset('n', '<leader>fb', builtin.buffers, {})
        keyset('n', '<leader>fh', builtin.help_tags, {})
    end
}
