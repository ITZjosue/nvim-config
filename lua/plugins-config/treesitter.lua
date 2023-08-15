local status_ok, configs = pcall(require,"nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_install = 'maintained',
  sync_install = false,
  ingnore_install = {""},
  highlight = {
    enable = true,
    disable = {""},
    adittional_vim_regex_highlighting = true,
  },
  indent = {enable = true, disable = {"yaml"}},
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { "html" , "xml", "svelte", "jsx" },
  }
})
