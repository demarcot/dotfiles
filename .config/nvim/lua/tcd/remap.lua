vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "U", "<C-r>")

-- Editor Nav
vim.keymap.set("n", "<C-n>", "<C-d>zz")
vim.keymap.set("n", "<C-p>", "<C-u>zz")

-- Config Edits
vim.keymap.set("n", "<leader><cr>", ":source ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<leader>e<cr>", ":edit ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<leader>ze<cr>", ":edit ~/.zshrc<cr>")

-- File Nav
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
vim.keymap.set("n", "<leader>f", ":Ex<cr>")
vim.keymap.set("n", "<leader>sf", ":Vex<cr>")


-- Window/Buffer Nav
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>nb", ":bnext<cr>")
vim.keymap.set("n", "<leader>pb", ":bprevious<cr>")
vim.keymap.set("n", "<leader>nw", "<C-W>l")
vim.keymap.set("n", "<leader>pw", "<C-W>h")
vim.keymap.set("n", "<leader>ww", ":only<cr>")


vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
