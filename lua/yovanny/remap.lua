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
map("n", "<leader>wa", ":wa<cr>")
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

-- map('n', '<leader><leader>', '@')

-- Place current word in single or double quotes
map('n', '<leader>\'', 'maciw\'<C-r>\"\'<ESC>`a')
map('n', '<leader>\"', 'maciw\"<C-r>\"\"<ESC>`a')

-- Remap motion controls
map({'n', 'v'} , 'n', 'j')
map({'n', 'v'} , 'e', 'k')
map({'n', 'v'} , 'i', 'l')
map({'n', 'v'} , 'j', 'n')
map({'n', 'v'} , 'k', 'e')
map({'n', 'v'} , 'l', 'i')

map({'n', 'v'} , 'J', 'N')

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
map("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
map("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- GoTo code navigation
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
map("n", "gi", "<Plug>(coc-implementation)", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Quickly show all registers
map({"n", "v"}, "<leader>rr", ":reg")

-- Source nvim
--map("n", "<leader><leader>so", ":so ~/.config/nvim/init.lua<cr> :so ~/.config/nvim/lua/yovanny/remap.lua<cr> :so ~/.config/nvim/lua/yovanny/set.lua<cr>", {silent = true})

