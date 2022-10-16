-- builtin
-- https://github.com/lunarvim/lunarvim/blob/rolling/lua/lvim/core/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")

local lcmp = lvim.builtin.cmp

lcmp.window = {}

lcmp.mapping["<C-space>"] = {}
lcmp.mapping["<C-p>"] = cmp.mapping.complete()
lcmp.mapping["<C-u>"] = cmp.mapping.scroll_docs(-4)
lcmp.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)

-- if back to normal mode, then unlink snippet action
lcmp.mapping["<esc>"] = cmp.mapping(function(callback)
  luasnip.unlink_current()

  -- NOTE: CAN NOT delete this `callback`
  callback()
end, { "i", "s" })

lcmp.confirm_opts = {
  behavior = cmp.ConfirmBehavior.Replace,
  select = false,
}

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'cmdline' },
    { name = 'path' },
  },
})

local status_lspkind_ok, lspkind = pcall(require, "lspkind")
if status_lspkind_ok then
  lcmp.formatting.format = lspkind.cmp_format({
    with_text = false,
    mode = "symbol",
  })
end