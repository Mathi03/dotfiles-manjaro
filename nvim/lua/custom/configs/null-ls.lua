local null_ls = require "null-ls"

local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  format.deno_fmt,
  -- b.formatting.prettier,
  format.prettier.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" } },
  -- format.prettier.with { filetypes = { "vue", "css", "scss", "less", "html", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" } },

  -- b.formatting.eslint,
  format.eslint.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
  -- lint.eslint.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },

  -- b.formatting.rome,
  -- format.rome.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" } },
  -- lint.rome.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },

  -- Lua
  format.stylua,

  -- Shell
  format.shfmt,
  lint.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  format.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
