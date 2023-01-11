# My Neovim Setup

## General Structure
Here is a rough mindmap of how I separate individual parts.  
However, Lsp is a big part and lots of thing is related to it, I do my best.

- Neovim fundamentals
  - options
  - keymaps
  - colorscheme
- Plugins manager (Packer.nvim)
- Code Intelligence related utils
  - Project Wide
    - lsp
    - dap
    - linters
    - formatters
  - Completions
    - Lsp Source
    - Snippet Source
    - Vim builtin Source
    - Filesystem Source
  - File Wide 
    - tree-sitter
- Explore Related utils
  - Explorer
  - Buffers "Tab"
  - Fuzzy Finder
  - Easy Terminal
- Editing Utils
  - Commenting
  - Autopairs
- Integration
  - Git

## TODO
- organize "## General Structure" a bit more.
- sometime warns "Client 1 quit with exit code 0 and signal 6", what?
- might need to integrate lsp-zero with null-ls, not sure.
- maybe add some cmp source, cmp-cmdline for one.
