return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false, -- Load the theme immediately
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
        vim.cmd.colorscheme("dracula")
    end,
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent"
        }
    }
  }
}

