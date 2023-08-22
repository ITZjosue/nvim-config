vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymap

--keymap.set("i","++","<ESC>")
keymap.set("n","<leader>nh",":nohl<CR>")
keymap.set("n","x",'"_x"')

keymap.set("n","<leader>sv","<C-w>v") -- slit vertically
keymap.set("n","<leader>sh","<C-w>s") -- split horizontally
keymap.set("n","<leader>se","<C-w>=") -- make split windows equila width
keymap.set("n","<leader>sx",":close<CR>") -- close current split window

keymap.set("n","<leader>to",":tabnew<CR>") -- open new tab
keymap.set("n","<leader>tx",":tabclose<CR>") -- close current tab
keymap.set("n","<leader>tn",":tabn<CR>") -- go to next tan
keymap.set("n","<leader>tp",":tabp<CR>") -- go to previous tab


-- plugins
-- vim-maximizer
keymap.set("n","<leader>sm",":MaximizerToggle<CR>")
-- telescope
keymap.set("n","<leader>ff",":Telescope find_files<CR>")
keymap.set("n","<leader>fg",":Telescope live_grep<CR>")
keymap.set("n","<leader>fb",":Telescope buffers<CR>")
keymap.set("n","<leader>fh",":Telescope help_tags<CR>")

keymap.set("n","<leader>e",":NvimTreeToggle<CR>")

-- ufo (function folding)
