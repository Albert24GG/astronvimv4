local M = {}

local mason_bins = vim.fn.expand "~/.local/share/nvim/mason/bin/"

local cwd = vim.fn.getcwd()

local exec_opts = {
    path = cwd,
    executables = true,

    filter = function(exec)
        -- Filter out shared libraries
        return not exec:match "%.so([.0-9]*)"
    end,
}

M.adapter = {
    id = "cppdbg",
    type = "executable",
    command = mason_bins .. "OpenDebugAD7",
}

M.config = {
    {
        name = "Run executable (GDB)",
        type = "cppdbg",
        request = "launch",
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function() return require("dap.utils").pick_file(exec_opts) end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        setupCommands = {
            {
                description = "enable pretty printing",
                text = "-enable-pretty-printing",
                ignoreFailures = false,
            },
        },
    },
    {
        name = "Run executable with arguments (GDB)",
        type = "cppdbg",
        request = "launch",
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function() return require("dap.utils").pick_file(exec_opts) end,
        args = function()
            local args_str = vim.fn.input {
                prompt = "Executable arguments: ",
            }
            return vim.split(args_str, " +")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        setupCommands = {
            {
                description = "enable pretty printing",
                text = "-enable-pretty-printing",
                ignoreFailures = false,
            },
        },
    },
    {
        name = "Attach to process (GDB)",
        type = "cppdbg",
        request = "attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        setupCommands = {
            {
                description = "enable pretty printing",
                text = "-enable-pretty-printing",
                ignoreFailures = false,
            },
        },
    },
}

return M
