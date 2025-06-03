-- General nvim keymaps
vim.g.mapleader = " "
-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true, silent = true })

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>P", '"+P', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cv", vim.cmd.Ex)

-- Move half a screen at a time and center automatically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Telescope plugin keymaps
local builtin = require("telescope.builtin")
--vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find_files' })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fd", function ()
        builtin.find_files{find_command = {"find", ".", "-type", "d"}}
    end)
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ft', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>fh", function() 
    builtin.find_files {
        cwd = "~/.config/hypr"
    }
end)

vim.keymap.set("n", "<leader>ff", function() 
    builtin.find_files {
        cwd = vim.fn.expand("%:p:h:h") 
    }
end)

-- Harpoon plugin keymaps 
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<leader>r", function() require("harpoon.mark").rm_file() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)
vim.keymap.set("n", "<C-;>", function() require("harpoon.ui").nav_file(5) end)

-- Undotree plugin keymaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Undo highlighting on Esc
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

--Set the exit to <leader>q
vim.keymap.set('n', '<leader>q', ':q<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>e', ':wq<CR>', {noremap = true, silent = true})

-- Neotree remap
vim.keymap.set('n', '<leader><Tab>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Default vim Search keymap to use flash
vim.keymap.set('n', 'zk', '/', { noremap = true, silent = true})
-- Set a shortcut to surround a word with "
vim.keymap.set("n", "<leader>ssq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })
-- Set a shortcut to replace all apperiances of particular word
-- vim.keymap.set("n", "<leader>ciw", ":%s/\\<<C-r><C-w>\\>//g<left><left>", {desc = "Replace all occurances of the word under cursor"})
vim.keymap.set("n", "<leader>ciw", function() 
    local word = vim.fn.expand("<cword>")
    local replace = vim.fn.input("Replace word under cursor with: ")
    vim.cmd(string.format("%%s/\\<%s\\>/%s/g", word, replace))
end, { desc = "Replace all occurances of the word under cursor"})

vim.keymap.set("n", "<leader>cw", function()
  local search = vim.fn.input("Word to replace: ")
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(string.format("%%s/\\<%s\\>/%s/g", search, replace))
end, { desc = "Replace input word with another" })
