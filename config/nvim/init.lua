-- load all plugins
require "pluginList"
require "misc-utils"

require "top-bufferline"
require "statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "nvim-lspconfig"
require "compe-completion"
require'lspconfig'.pyright.setup{}


require'sniprun'.setup({
  display = { "Classic" },
})

--local lsp_status = require("lsp_status")

require "lsp_signature".on_attach({
    on_attach = on_attach,
    capabilities = require("lsp-status").capabilities,
})

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"

--local base16 = require "base16"
--base16(base16.themes["onedark"], true)

require "highlights"

-- blankline

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

g.python_highlight_all = 1

require "treesitter-nvim"
require "mappings"

require "telescope-nvim"
require "nvimTree" -- file tree stuff
require "file-icons"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)

require "zenmode"
require "whichkey"
require "dashboard"


vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])
vim.opt.undofile = true
vim.cmd([[au BufRead * normal zR]])

--function on_attach_callback(client, bufnr)
  ---- If you use completion-nvim/diagnostic-nvim, uncomment those two lines.
  ---- require('diagnostic').on_attach()
  ---- require('completion').on_attach()
  --require('folding').on_attach()
--end

local api = vim.api
function find_project_root()
  local id = [[.git]]
  local file = api.nvim_buf_get_name(0)
  local root = vim.fn.finddir(id, file .. ';')
  if root ~= "" then
    root = root:gsub(id, '')
    print(root)
    vim.api.nvim_set_current_dir(root)
  else
    print("No repo found.")
  end
end
