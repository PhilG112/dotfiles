local configs = require "nvim-treesitter.parsers".get_parser_configs() 

configs.c_sharp = {
    install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-c-sharp",
        files = {"src/parser.c", "src/scanner.c"}
    }
}

configs.haskell = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-haskell",
    files = {"src/parser.c", "src/scanner.c"}
  }
}

configs.rust = {
    install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-rust",
        files = { "src/parser.c", "src/scanner.c" }
    }
}

require('nvim-treesitter.configs').setup({
    ensure_installed = {"c_sharp", "haskell", "rust", "lua", "javascript", "typescript"},
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
