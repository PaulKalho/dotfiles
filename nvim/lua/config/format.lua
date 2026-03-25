local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
    go = { "gofumpt" },
    python = { "ruff_format" },

    -- fallback
    ["_"] = { "trim_whitespace" },
  },
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    conform.format({
      bufnr = args.buf,
      async = false,
      lsp_fallback = true,
    })
  end,
})
