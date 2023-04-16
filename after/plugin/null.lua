local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      only_local = true,
    }),
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        return utils.root_has_file({
          ".prettierrc",
          "prettier.config.js",
          "prettier.config.cjs",
        })
      end,
      only_local = true,
    }),
    null_ls.builtins.formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
      end,
    }),
  },
})
