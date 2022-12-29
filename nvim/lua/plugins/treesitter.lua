require('nvim-treesitter.configs').setup({
    ensure_installed = {"c_sharp", "haskell"},
    highlight = {
      enable = true,
      disable = { 'NvimTree' },
      additional_vim_regex_highlighting = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["ic"] = "@class.inner",
          ["ac"] = "@class.outer",
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
    context_commentstring = {
      enable = true,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
  })

require "nvim-treesitter.parsers".get_parser_configs().haskell = {
  install_info = {
    url = "~/.config/nvim/tree-sitter-haskell",
    files = {"src/parser.c", "src/scanner.c"}
  }
}