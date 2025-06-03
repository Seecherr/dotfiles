return {
    {
        'ThePrimeagen/harpoon',
        lazy = true,
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("harpoon").setup()
        end,
    }
}
