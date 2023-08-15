require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "docker_compose_language_service",
    "gopls",
    "golangci_lint_ls",
    "pyre",
    "svelte",
    "lua_ls",
  },
})
-- local mason_status, mason = pcall(require, "mason")
-- if not mason_status then
--   print("not mason working")
--   return
-- end
--
-- local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason_lspconfig")
-- if not mason_lspconfig_status then
--   return
-- end
--
-- mason.setup()

-- mason_lspconfig.setup({
  -- ensure_installed = {
  --   "tsserver",
  --   "html",
  --   "cssls",
  --   "tailwind",
  --   "sumneko_lua",
  --   "dockerls",
  --   "docker_compose_language_service",
  --   "eslint",
  --   "gopls",
  --   "golangci_lint_ls",
  --   "pyre",
  --   "ruby_ls",
  --   "svelte"
  -- },
-- })
