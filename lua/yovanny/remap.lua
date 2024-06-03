local map = vim.keymap.set
local set = vim.opt
vim.g.mapleader = " "
map("n", "<leader>pv", vim.cmd.Ex)

-- -- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
map("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
map("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
map("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
map("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
map("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
map("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
map("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
map("n", "<space>l", ":<C-u>CocListResume<cr>", opts)

-- quickly save using <leader>
map("n", "<leader>w", ":w<cr>")
map("n", "<leader>wq", ":wq<cr>")
map("n", "<leader>q", ":q<cr>")
map("n", "<leader>qq", ":q!<cr>")

-- Visual mode pressing * or # searches for the current selection
-- Super useful! From an idea by Michael Naumann
map("v", "*", ":<C-u>y*")
map("v", "#", ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>")
map({ "n", "v" }, "**", "*N")
map({ "n", "v" }, "##", "#N")

-- Using <leader> + number (1, 2, ... 9) to switch tab
for i=1,9,1
do
  map('n', '<leader>'..i, i.."gt", {})
end
map('n', '<leader>0', ":tablast<cr>", {})

 -- auto add closing {, [, (, ', ", <
map('i', '{<cr>', '{<cr>}<ESC>kA<CR>', {})
closing_pairs = {'}', ')', ']', '"', "'", '>'}
opening_pairs = {'{', '(', '[', '"', "'", '<'}
for key, chr in pairs(opening_pairs)
do
  map('i', chr, chr..closing_pairs[key]..'<esc>i', {})
end

-- use U for redo :))
map('n', 'U', '<C-r>', {})

-- scrolling
map('n', ',', '20<C-u>', defaults)
map('n', 'm', '20<C-d>', defaults)
map('n', 'M', 'm', defaults)

-- Insert empty line without entering insert mode
map('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)
map('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', defaults)

-- Shift + Up/Down to move line up/down
map('n', '<S-Up>', 'yyddkP', defaults)
map('n', '<S-Down>', 'yyddp', defaults)

map('n', '<leader>;', ':w !pbcopy<cr><cr>')
map('n', '<leader>y', "ma0\"+y$`a")
map('n', '<leader>[', "\"+p")

map('n', '<leader><leader>', '@')


