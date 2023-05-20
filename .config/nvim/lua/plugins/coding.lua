return {
  { import = "plugins.extras.coding.autopairs" },
  { import = "plugins.extras.coding.comment" },
  -- cmp
  { import = "plugins.extras.coding.supertab" },
  { import = "plugins.extras.coding.esc-unlink-snippet" },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.completion.keyword_length = 1

      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    event = { "CmdlineEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      types = {
        {
          type = ":",
          sources = {
            { name = "path" },
            { name = "cmdline" },
          },
        },
        {
          type = { "/", "?" },
          sources = {
            { name = "buffer" },
          },
        },
      },
    },
    config = function(_, opts)
      local cmp = require("cmp")

      for _, opt in ipairs(opts.types) do
        cmp.setup.cmdline(
          opt.type,
          vim.tbl_extend("force", opts, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(opt.sources),
          })
        )
      end
    end,
  },

  -- codeium
  -- https://github.com/jcdickinson/codeium.nvim
  {
    "jcdickinson/codeium.nvim",
    lazy = true,
    event = { "InsertEnter" },
    init = function()
      require("util.cmp").duplicates.codeium = 0
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        table.insert(opts.sources, 1, { name = "codeium", group_index = 1 })
      end,
    },
  },
}
