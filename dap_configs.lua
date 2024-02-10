path_to_python_from_venv = "/venv/bin/python"




-- For sing file
LaunchFileConf = {
  -- The first three options are required by nvim-dap
  type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
  request = 'launch',
  name = "Launch file",
  -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

  program = "${file}", -- This configuration will launch the current file if used.
  pythonPath = function()
    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. path_to_python_from_venv) == 1 then
      return cwd .. path_to_python_from_venv
    else
      return '/usr/bin/python'
    end
  end,
}

LaunchAppConf = {
  -- The first three options are required by nvim-dap
  type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
  request = 'launch',
  name = "Launch app",
  -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

  program = "main.py", -- This configuration will launch the current file if used.
  pythonPath = function()
    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. path_to_python_from_venv) == 1 then
      return cwd .. path_to_python_from_venv
    else
      return '/usr/bin/python'
    end
  end,
}


-- For django
DjangoConf = {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py', -- NOTE: Adapt path to manage.py as needed
  -- program = 'manage.py', -- NOTE: Adapt path to manage.py as needed
  args = { 'runserver', '--noreload' },

  env = {
    DEBUG_SQL = '1',
  },
}

LaunchTestConf = {
  type = 'python',
  request = 'launch',
  name = 'Tests',
  module = 'pytest',
  -- program = "${workspaceFolder}/venv/bin/python",
  -- cwd = "${workspaceFolder}",
  -- args = { '-m', 'pytest', '-vv', '-s', 'rpc/client/client_backend/tests/bl/calculator/test_supply_plan.py' },
  -- args = { '-m', 'pytest', },
  args = {
    "${file}",
    "-sv",
    "--log-cli-level=INFO",
    "--log-file=test_out.log",
  },
  -- console= "integratedTerminal",
  -- env = {
  --         PYTHONPATH = "${workspaceFolder}",
  -- },
  -- stopOnEntry = true,
}


DjangoConf3 = {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py', -- NOTE: Adapt path to manage.py as needed
  args = { 'import-data', 'etc/rpc/bbs-auto/bbs-auto-data-mapping.yml', '-ie', 'category', },
  -- args = { 'infobackend', },

  env = {
  }
}


DjangoConf2 = {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py', -- NOTE: Adapt path to manage.py as needed
  args = { 'runserver', '8001', '--noreload' },
}


gdscript = {
  type = "godot",
  request = "launch",
  name = "Launch scene",
  project = "${workspaceFolder}",
  launch_scene = true,
}


javaScript = {
  type = "java",
  request = "launch",
  name = "java test",
  projectName = "Template Mod Generator",
  mainClass = "net.fabricmc.devlaunchinjector.Main",
  javaExec = "/usr/bin/java",
  vmArgs =
  "-Dfabric.dli.config=/Users/nikitakurkurin/MinecraftModsCreation/HPHud/.gradle/loom-cache/launch.cfg -Dfabric.dli.env=client -XstartOnFirstThread -Dfabric.dli.main=net.fabricmc.loader.impl.launch.knot.KnotClient",
  cwd = "${workspaceFolder}/run",
}

-- javaScript = {
--         type = "java",
--         request = 'attach',
--         name = "Debug (Attach) - Remote",
--         hostName = "127.0.0.1",
--         port = 58936,
-- }



local dap = require('dap')


dap.set_log_level('DEBUG')


dap.adapters.python = {
  type = 'executable',
  -- command = os.getenv("VIRTUAL_ENV") .. "/bin/python"; -- before start nvim must be in need environment
  command = vim.fn.getcwd() .. "/venv/bin/python", -- before start nvim must be in need environment
  args = { '-m', 'debugpy.adapter' },
}


dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 59502,
}


dap.adapters.java = {
  type = 'server',
  host = '127.0.0.1',
  port = 33829,
}


local cpptools_path = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"


dap.adapters.lldb = {
  id = 'lldb',
  type = 'executable',
  command = cpptools_path,
}


-- local mason_registry = require("mason-registry")
--
--
-- vim.g.rustaceanvim = function()
--   -- Update this path
--   local extension_path = mason_registry.get_package("codelldb")
--   -- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
--   local codelldb_path = extension_path .. 'adapter/codelldb'
--   local liblldb_path = extension_path .. 'lldb/lib/liblldb'
--   local this_os = vim.uv.os_uname().sysname;
--
--   -- The path is different on Windows
--   -- The liblldb extension is .so for Linux and .dylib for MacOS
--   liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
--
--   local cfg = require('rustaceanvim.config')
--   return {
--     dap = {
--       adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--     },
--   }
-- end

local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

rt.setup({
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  server = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
})
