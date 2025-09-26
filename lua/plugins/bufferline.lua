return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    options = {
        mode = "buffers",
        offsets = {
            { filetype = "snacks_layout_box" },
        },
    },
    highlights = {
        buffer_selected = {
            italic = false,
        },
        indicator_selected = {
            fg = { attribute = "fg", highlight = "Function" },
            italic = false,
        },
    },
    keys = {
        { "sb", "<cmd>BufferLinePick<cr>", mode = "n", desc = "Pick a visible tab" },
    },
}
