---@type ChadrcConfig 
 local M = {}
 M.ui = {
   theme = 'catppuccin',
   statusline = {
     theme = 'vscode_colored',
     overriden_modules = function(modules)
      table.remove(modules, 9) --remove cursor_positioning
      table.remove(modules, 9) --remove file_encoding
      table.remove(modules, 9) --remove filetype
     end,
   },
   tabufline = {
     overriden_modules = function(modules)
       table.remove(modules, 4) --remove buttons
     end,
   },
 }
 M.plugins = 'custom.plugins'
 M.mappings = require "custom.mappings"
 return M
