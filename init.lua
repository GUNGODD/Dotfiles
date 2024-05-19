-- Set Neovim options for tabs and indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Define the path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim directory exists, if not, clone it from GitHub
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Prepend the lazy.nvim path to runtime path
vim.opt.rtp:prepend(lazypath)

-- Define plugins
local plugins = {
  require('plugins.telescope') -- Load Telescope configuration
  -- Add other plugins here
}

local opts = {}

-- Setup lazy.nvim with the defined plugins and options
require("lazy").setup(plugins, opts)

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

