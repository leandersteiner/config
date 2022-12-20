local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local map = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  map.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  map.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  map.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  map.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  map.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  map.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  map.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  map.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  map.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  if client.name == "tsserver" then
    map.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- lspconfig["phpactor"].setup({
  -- capabilities = capabilities,
  -- on_attach = on_attach,
-- })

lspconfig["intelephense"].setup({
 capabilities = capabilities,
 on_attach = on_attach,
})
