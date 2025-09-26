local Plugin = { "mason-org/mason.nvim" }

Plugin.cmd = "Mason"
Plugin.keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } }
Plugin.build = ":MasonUpdate"

Plugin.opts_extend = { "ensure_installed" }
Plugin.opts = {
    ui = { border = "rounded" },
    ensure_installed = {
        "stylua",
        "shfmt",
        "lua-language-server",
        "typescript-language-server",
    },
}

---@param opts MasonSettings | {ensure_installed: string[]}
function Plugin.config(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
        vim.defer_fn(function()
            -- trigger FileType event to possibly load this newly installed LSP server
            require("lazy.core.handler.event").trigger({
                event = "FileType",
                buf = vim.api.nvim_get_current_buf(),
            })
        end, 100)
    end)

    mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
                p:install()
            end
        end
    end)
end

return Plugin
