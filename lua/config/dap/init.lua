local dap = require "dap"

-- debuggers
local cppdbg = require "config.dap.adapters.cppdbg"

dap.adapters.cppdbg = cppdbg.adapter

dap.configurations.c = cppdbg.config
dap.configurations.cpp = cppdbg.config
-- dap.configurations.rust = cppdbg.config
