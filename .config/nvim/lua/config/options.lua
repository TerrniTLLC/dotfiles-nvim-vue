-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local float = require("util.opts").float
local opt = vim.opt

opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.breakindent = true
opt.formatoptions:append({ "r" })
opt.mouse = ""
opt.relativenumber = false
opt.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"

-- popup, float
opt.winblend = float.winblend
opt.pumblend = float.pumblend
opt.pumheight = 10