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



-- not work cause I have a arm64
-- dap.configurations.python = {
--     type = "python",
--     request = "attach",
--     connect = {
--       port = 5678,
--       host = "127.0.0.1",
--     },
--     mode = "remote",
--     name = "Container Attach Debug",
--     cwd = vim.fn.getcwd(),
--     pathMappings = {
--       {
--         localRoot = function()
--           -- return vim.fn.input("Local code folder > ", vim.fn.getcwd(), "file")
--           --"/home/alpha2phi/workspace/alpha2phi/python-apps/ml-yolo/backend", -- Local folder the code lives
--         return "/Users/nikitakurkurin/PycharmProjects/test311"
--         end,
--         remoteRoot = function()
--           -- return vim.fn.input("Container code folder > ", "/", "file")
--           -- "/fastapi", -- Wherever your Python code lives in the container.
--         return "/code"
--         end,
--       },
--     },
--   }
--
--


-- Debugger installation location
local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/netcoredbg"

-- -- Adapter configuration
-- --
-- dap.adapters.coreclr = {
--         type = "executable",
--         command = DEBUGGER_LOCATION .. "/netcoredbg",
--         args = { "--interpreter=vscode" },
-- }
--
-- cs = {
--         type = "coreclr",
--         name = "launch - netcoredbg",
--         request = "launch",
--         -- program = function()
--         -- return vim.fn.input('Path to DLL > ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
--         -- end,
--         program =
--         "/Volumes/KINGSTON/Unity/UnityProjects/test_c_sharp/consoleproject2/bin/Debug/net7.0/consoleproject2.dll"
-- }
