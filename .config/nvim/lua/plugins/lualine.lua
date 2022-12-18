local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local lualine_theme = require("lualine.themes.onedark")

lualine.setup({
  options = {
    theme = lualine_theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
})
