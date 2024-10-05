# color-columns.nvim
This plugin sets up colorcolumns to be easily configured and enabled/disabled
with **which-key**

To install with **Lazy**
``` lua
return {
  "adewitt76/color-columns.nvim",
  dependencies = { "folke/which-key.nvim" },
  opts = {
    position = "80,100,120",
    key_binding = "<leader>uG",
    disabled_on_start = false,
    highlight_color = "#393939"
  },
}
````
Note: all the above optional settings are the defaults.

