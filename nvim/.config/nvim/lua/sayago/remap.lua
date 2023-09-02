local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Rename space as leader key
keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap("n", "<leader>r", "<cmd>Jaq<CR>")

-- Markdown Preview
keymap("n", "<leader>m", "<cmd>MarkdownPreview<CR>")
keymap("n", "<leader>M", "<cmd>MarkdownPreviewStop<CR>")

keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>W", "<cmd>wq<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

keymap("n", "<leader>c", "<cmd>bdelete<CR>")

keymap("v", "J", ":m '>+1<CR>gv-gv", opts)
keymap("v", "K", ":m '<-2<CR>gv-gv", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)


keymap({ "n", "v" }, "<leader>d", [["_d]], opts)

-- This is going to get me cancelled
keymap("i", "<C-c>", "<Esc>", opts)

-- Navigation Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts, opts)

-- Stay in indent modo
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "Q", "<nop>", opts)

-- Spell
keymap("n", "<leader>.s", "<cmd>set spell! spelllang=es<cr>", opts)
keymap("n", "<leader>.e", "<cmd>set spelllang=es<cr>", opts)
keymap("n", "<leader>.i", "<cmd>set spelllang=en<cr>", opts)

-- Colorcolumn
keymap("n", "<Leader>v", "<cmd>set colorcolumn=80<cr>", opts)
keymap("n", "<Leader>vv", "<cmd>set colorcolumn=0<cr>", opts)

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

keymap("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/sayago/packer.lua<CR>", opts);

keymap("n", "<leader><leader>", function ()
    vim.cmd("so")
    print("Source... ✅")
end)

keymap("n", "<M-n>", "<cmd>lua require'luasnip'.jump(1)<CR>")
keymap("n", "<M-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

keymap("n", "YY", "va{Vy}", opts)
