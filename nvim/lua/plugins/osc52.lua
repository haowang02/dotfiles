return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      max_length = 0,    -- 禁用复制长度限制
      silent = false,    -- 显示提示
      trim = false,      -- 保持空格
    })
    -- 自动 yank 同步（推荐，直接 y 即可）
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
          require('osc52').copy_register('')
        end
      end,
    })
  end,
}
