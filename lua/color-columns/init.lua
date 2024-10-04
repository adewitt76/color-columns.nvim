local M = {}

function M.setup(opts)
	opts = opts or {}

	vim.g.color_column_enabled = true
	vim.opt.colorcolumn = "80,100,120"

	vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
		callback = function()
			if vim.g.color_column_enabled then
				vim.opt.colorcolumn = "80,100,120"
			else
				vim.opt.colorcolumn = "0"
			end
		end,
	})

	local wk = require("which-key")
	wk.add({
		{
			"<leader>uG",
			function()
				vim.g.color_column_enabled = not vim.g.color_column_enabled
				if vim.g.color_column_enabled then
					vim.opt.colorcolumn = "80,100,120"
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
