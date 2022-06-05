local actions = require "telescope.actions"
require('telescope').setup{ defaults = { file_ignore_patterns = { "node_modules", "/.git/" } }, pickers = { buffers = { mappings = { i = { ["<c-d>"] = actions.delete_buffer + actions.move_to_top, } } } } }
require('telescope').load_extension "file_browser"
