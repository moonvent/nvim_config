

return {
  "akinsho/bufferline.nvim",
  lazy = false,
  enabled = true,
  
  config = function()
    require("bufferline").setup({
      options = {
        -- show_buffer_close_icons = false,
        diagnostics = false,
        offsets = {
          {filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"},
          {filetype = "vista", text = "Vista", highlight = "Directory", text_align = "left"},
          {filetype = "terminal", text = "Terminal", highlight = "Directory", text_align = "left"}
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or "" )
            s = s .. sym .. n .. " "
          end
          return s
        end,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        -- sort_by = 'id',
        separator_style = 'none',
        },
      highlights = {
        buffer_selected = {
          bg = '#6E0000',
        },
      }
    })
  end,
  }
