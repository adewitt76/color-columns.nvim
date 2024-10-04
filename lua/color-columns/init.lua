local M = {}

function M.setup(opts)
	opts = opts or {}

	local local_position = opts.position or "80,100,120"
	local key = opts.key_binding or "<leader>uG"

	vim.g.color_column_enabled = true
	vim.opt.colorcolumn = local_position

	vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
		callback = function()
			if vim.g.color_column_enabled then
				vim.opt.colorcolumn = local_position
			else
				vim.opt.colorcolumn = "0"
			end
		end,
	})

	local wk = require("which-key")
	wk.add({
		{
			key,
			function()
				vim.g.color_column_enabled = not vim.g.color_column_enabled
				if vim.g.color_column_enabled then
					vim.opt.colorcolumn = local_position
				else
					vim.opt.colorcolumn = "0"
				end
			end,
			mode = "n",
			desc = function()
				local status
				if vim.g.color_column_enabled then
					status = "Disable"
				else
					status = "Enable"
				end
				return status .. " Color Column Guides"
			end,
		},
	})
end

return M
