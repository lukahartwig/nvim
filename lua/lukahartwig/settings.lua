-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Set terminal colors
vim.o.termguicolors = true

-- Set line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Disable line wrap
vim.o.wrap = false

-- Set lines before scroll
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

-- Set status line
vim.o.laststatus = 3

-- Set colorscheme
vim.cmd[[colorscheme tokyonight]]
