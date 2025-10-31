return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
    vim.cmd.colorscheme "kanagawa"
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {}
        end,
        theme = "wave",  -- "wave", "dragon", "lotus"
        background = {
          dark = "wave",
          light = "lotus"
        },
      })
    end
}
