return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        window = {
          position = "right",
          mappings = {
            ["<C-b>"] = "close_window",  -- Cerrar con Ctrl+B desde dentro
            ["<CR>"] = "open",           -- Enter abre archivos
            ["l"] = "open",              -- l también abre
          },
        },
      })
      vim.keymap.set("n", "<C-b>", ":Neotree toggle focus<CR>", { silent = true })
    end
  }
}
