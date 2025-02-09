local nvimtree = require("nvim-tree")
local nnoremap = require("utils").nnoremap
local icons = require("theme").icons

local view = require("nvim-tree.view")
_G.NvimTreeConfig = {}

vim.g.nvim_tree_icons = {
  default = icons.file,
  symlink = icons.symlink,
  git = {
    unstaged = icons.unmerged,
    staged = icons.staged,
    unmerged = icons.unmerged,
    renamed = icons.renamed,
    untracked = icons.untracked,
    deleted = icons.deleted,
    ignored = icons.ignored
  },
  folder = {
    arrow_open = icons.arrow_open,
    arrow_closed = icons.arrow_closed,
    default = icons.default,
    open = icons.open,
    empty = icons.empty,
    empty_open = icons.empty_open,
    symlink = icons.symlink,
    symlink_open = icons.symlink_open
  },
  lsp = {
    hint = icons.hint,
    info = icons.info,
    warning = icons.warning,
    error = icons.error
  }
}

function NvimTreeConfig.find_toggle()
  if view.win_open() then
    view.close()
  else
    vim.cmd("NvimTreeToggle")
  end
end

nnoremap("<leader>k", "<CMD>lua NvimTreeConfig.find_toggle()<CR>")

view.width = 40

nvimtree.setup {
  disable_netrw = false,
  hijack_netrw = true,
  auto_close = false,
  diagnostics = {
    enable = false
  },
  update_focused_file = {
    enable = true,
    update_cwd = false
  },
  view = {
    width = 40,
    side = "left",
    auto_resize = true
  }
}
