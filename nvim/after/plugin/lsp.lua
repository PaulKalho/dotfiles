local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- autoformatting
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'tsserver', 'eslint', 'pylsp', 'jsonls', 'golangci_lint_ls'},
	handlers = {
		lsp.default_setup,
	},
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-z>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	})

})

lsp.set_preferences({
	sign_icons = { }
})

require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
            runtime = {
                version = "LuaJIT",
            },
			diagonostics = {
				globals = {
					'vim',
					'require'
				}
			},
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            }
		}
	}
})
-- don't copy/paste this if you don't know what is `lua_ls`.
-- yes, lsp-zero has changed since ThePrimeagen released his video "0 to LSP". 
