require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    "gopls",
    "jsonls",
    "lua_ls",
    "marksman",
    "rust_analyzer",
    "tailwindcss",
    "taplo",
    "tsserver",
    "yamlls"
  }
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Go
lspconfig.gopls.setup {
  capabilities = capabilities,
}

-- JSON
lspconfig.jsonls.setup {
  capabilities = capabilities,
}

-- Lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- Markdown
lspconfig.marksman.setup {
  capabilities = capabilities
}

-- Rust
local rt = require("rust-tools")
rt.setup({
  tools = {
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Tailwind CSS
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
}

-- TOML
lspconfig.taplo.setup {
  capabilities = capabilities,
}

-- TypeScript
lspconfig.tsserver.setup {
  capabilities = capabilities,
}

-- Yaml
lspconfig.yamlls.setup {
  capabilities = capabilities,
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
