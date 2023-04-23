for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify("Error setting up colorscheme: " .. astronvim.default_colorscheme, "error")
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

vim.cmd "highlight Normal guibg=NONE"


-- Rose Pine colorscheme config
require('rose-pine').setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = 'auto',
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = 'main',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = true,
  disable_float_background = false,
  disable_italics = false,
  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'base',
    background_nc = '_experimental_nc',
    panel = 'surface',
    panel_nc = 'base',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',
    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',
    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },
  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = 'rose' },
    -- Blend colours against the "base" background
    CursorLine = { bg = 'foam', blend = 10 },
    StatusLine = { fg = 'love', bg = 'love', blend = 10 },
  }
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')

vim.cmd "set wrap"
vim.cmd "set nornu" --No relative numbering
vim.cmd "set nocursorline"

-- Disable LSP semantic highlight
vim.cmd('highlight LspReferenceRead guibg=NONE')
vim.cmd('highlight LspReferenceText guibg=NONE')
vim.cmd('highlight LspReferenceWrite guibg=NONE')
