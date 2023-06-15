local comp = require"complementree"
local s = require"complementree.defaults"

local lsp_completion = {
  default = s.lsp,
  string = s.ins_completion "C-K",
  comment = s.dummy
}

comp.setup {
  default = s.ins_completion "C-N",
  vim = s.ins_completion "C-V",
  c = lsp_completion,
  lua = lsp_completion,
  rust = lsp_completion
}
