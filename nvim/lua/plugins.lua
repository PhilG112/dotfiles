-- Install packer
local ensure_packer = function ()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
display = {
  open_fn = function()
    return require('packer.util').float({ border = 'solid' })
  end,
},
})

-- Intall plugins
local use = require('packer').use

use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.nvim-tree')
    end,
  })


use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('plugins.telescope')
  end,
})

use({
  'rose-pine/neovim',
  as = 'rose-pine',
  config = function()
      require('plugins.rose-pine')
  end
})

use {'p00f/nvim-ts-rainbow', branch = 'master'}

use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('plugins.treesitter')
  end,
})

use {'neoclide/coc.nvim', branch = 'release'}

use({
  'voldikss/vim-floaterm',
  config = function()
    require('plugins.floaterm')
  end,
})

-- Automatically install plugins on first run
if packer_bootstrap then
  require('packer').sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])