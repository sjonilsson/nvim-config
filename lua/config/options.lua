vim.o.number = true
vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.signcolumn = "yes"
vim.o.termguicolors = true

local levels = vim.diagnostic.severity
local opts = {
    virtual_text = true,
    float = {
        border = "rounded",
    },
    signs = {
        text = {
            [levels.ERROR] = "✘",
            [levels.WARN] = "▲",
            [levels.HINT] = "⚑",
            [levels.INFO] = "»",
        },
    },
}

vim.diagnostic.config(opts)
