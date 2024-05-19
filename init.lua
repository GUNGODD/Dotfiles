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

-- Define plugins and options for lazy.nvim setup
local plugins = {
  { 
    "nvim-treesitter/nvim-treesitter", 
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua" , "typescript"}, -- add other languages here
        highlight = {
          enable = true,              -- false will disable the whole extension
        },
      }
    end
  },

   
 -- colorscheme
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  { 
-- init.lua:
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }

    }


  } 


local opts = {}

-- Setup lazy.nvim with the defined plugins and options
require("lazy").setup(plugins, opts)
require("catppuccin").setup()
--for seting up the command palate  using vim.cmd 
 vim.cmd.colorscheme "catppuccin"
