return {
	"mfussenegger/nvim-dap",
	config= function()
		local dap = require('dap')

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = {vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}"},
			}
		}

		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				envFile="${fileDirname}/.env",

				-- resolve "Could not read source map..." issues
				resolveSourceMapLocations={
					"${workspaceFolder}/**",
					"!**/node_modules/**"
				}
			},
		}


		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				envFile="${fileDirname}/.env",

				-- resolve "Could not read source map..." issues
				resolveSourceMapLocations={
					"${workspaceFolder}/**",
					"!**/node_modules/**"
				}
			},
		}
	end,
}
