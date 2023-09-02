local options = {
    nu = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    timeoutlen = 200,
    cmdheight = 1,
    -- laststatus = 0,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    mouse = "a",
    showmode = false,
    textwidth = 80,
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
}

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[
function! HTML()
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction
]]
vim.cmd([[autocmd FileType html call HTML()]])
