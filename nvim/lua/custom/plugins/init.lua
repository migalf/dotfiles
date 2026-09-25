-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them.
-- `vim.fs.dir()` iteration order is unspecified and must not be relied upon.
-- Linters that are not language servers
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPost', 'BufWritePost' },
  config = function()
    require('lint').linters_by_ft = {
      make = { 'checkmake' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
      group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
