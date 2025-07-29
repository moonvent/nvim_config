-- return {
--   "nvim-telescope/telescope-fzf-native.nvim",
--   build = "make",
--   config = function()
--     require("telescope").load_extension("fzf")
--   end,
-- }

-- return {
--   {
--     "nvim-telescope/telescope.nvim",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       require("telescope").setup()
--     end,
--   },
-- }

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = false,      -- по умолчанию не показывать скрытые
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- fuzzy matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          }
        }
      })
      require("telescope").load_extension("fzf")
    end,
  },
  -- остальные плагины ...
}

