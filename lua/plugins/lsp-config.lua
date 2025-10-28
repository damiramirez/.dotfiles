return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "elixirls" },
        handlers = {
          function(server_name)
            vim.lsp.config(server_name, {
              capabilities = capabilities,
            })
            vim.lsp.enable(server_name)
          end,

          ["elixirls"] = function()
        vim.lsp.config("elixirls", {
              cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
              capabilities = capabilities,
            })
            vim.lsp.enable("elixirls")
          end,

          ["lua_ls"] = function()
            vim.lsp.config("lua_ls", {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
            vim.lsp.enable("lua_ls")
          end,

          ["rust_analyzer"] = function()
            vim.lsp.config("rust_analyzer", {
              capabilities = capabilities,
              settings = {
                ["rust-analyzer"] = {
                  checkOnSave = {
                    command = "clippy",
                  },
                },
              },
            })
            vim.lsp.enable("rust_analyzer")
          end,
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end,
  },
}
