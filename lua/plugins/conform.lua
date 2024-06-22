return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "ruff_fix", "black" },
            -- Use a sub-list to run only the first available formatter
            xml = { "xmlformat" },
            json = { "jq" },
            c = { "clang-format" },
            clojure = { "cljstyle" }
        },
        formatters = {
            clang_format = {
                prepend_args = function(self, ctx)
                    return { '-style="{BasedOnStyle: Google, IndentWidth: 4}"', }
                end,
            }
        },
        format_on_save = {
            timeout_ms = 100,
            -- lsp_fallback = true,
        },

    },
    -- config = function ()
    --     require("conform").formatters.clang = {
    --
    --     }
    -- end
    -- init = function()
    --     -- If you want the formatexpr, here is the place to set it
    --     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- end,
}
