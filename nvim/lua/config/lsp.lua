local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities()

-- all servers
local servers = {
	-- web
	"ts_ls",
	"html",
	"cssls",
	"jsonls",

	-- nix
	"nixd",

	-- lua
	"lua_ls",

	-- python
	"pyright",

	-- go
	"gopls",

	-- rust
	"rust_analyzer",

	-- markdown
	"marksman",

	-- terraform
	"terraformls",

	-- zig
	"zls",
}

-- generic setup
for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
end

-- special configs

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("nixd", {
	capabilities = capabilities,
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
		},
	},
})

vim.lsp.config("pyright", {
	settings = {
		python = {
			venvPath = ".",
			venv = ".venv",
		},
	},
})

vim.lsp.enable(servers)
