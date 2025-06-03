return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup()
  end
}
