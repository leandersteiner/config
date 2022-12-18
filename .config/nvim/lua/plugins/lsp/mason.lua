local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "omnisharp",
    "cmake",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "eslint",
    "gopls",
    "golangci_lint_ls",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "texlab",
    "sumneko_lua",
    "marksman",
    "phpactor",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "yamlls",
  }
})
