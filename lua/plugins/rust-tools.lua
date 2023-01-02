local rt = require("rust-tools")

local opts = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            '/usr/bin/lldb-vscode', '/usr/lib/libldb.so')
    }
}

require("rust-tools").setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            '/usr/bin/lldb-vscode', '/usr/lib/libldb.so') --захардкожено
    }
})
