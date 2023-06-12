local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
vim.keymap.set('n', '<A-b>', builtin.buffers, {})
vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<A-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
