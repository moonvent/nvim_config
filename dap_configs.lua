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
        args = { 'runserver', '--noreload' },
}


DjangoConf2 = {
        type = 'python',
        request = 'launch',
        name = 'Django',
        program = vim.fn.getcwd() .. '/manage.py', -- NOTE: Adapt path to manage.py as needed
        args = { 'runserver', '8001', '--noreload' },
}



XLabFormDebugDocker = {
        type = 'python',
        request = 'attach',
        name = 'XLabFormDebugDocker',
        connect = {
                port = 5678,
                host = "127.0.0.1",
        },
        mode = "remote",
        pathMappings = {
                {
                        localRoot = "/Users/nikitakurkurin/PycharmProjects/ca-form",
                        remoteRoot = "/home/on-bank",
                },
        },
}


local dap = require('dap')


dap.set_log_level('DEBUG')


dap.adapters.python = {
        type = 'executable',
        -- command = os.getenv("VIRTUAL_ENV") .. "/bin/python"; -- before start nvim must be in need environment
        command = vim.fn.getcwd() .. "/venv/bin/python", -- before start nvim must be in need environment
        args = { '-m', 'debugpy.adapter' },
}
