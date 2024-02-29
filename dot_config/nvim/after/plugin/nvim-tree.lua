local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")

-- empty setup using defaults
nvim_tree.setup()

vim.keymap.set("n", "<leader>tt", function()
    nvim_tree_api.tree.toggle()
end)
