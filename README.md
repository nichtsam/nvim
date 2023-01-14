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
  - File Wide 
    - tree-sitter
    - Completions
      - Lsp Source
      - Snippet Source
      - Vim builtin Source
      - Filesystem Source
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

### Misc
- organize "## General Structure" a bit more.
- sometime warns "Client 1 quit with exit code 0 and signal 6", what?
- keep an eye on `lsp-zero`'s integration with `null-ls`.
- issue: [LSP][null-ls] timeout on big project
- figure out the relation between formatters and the nvim options above.
  
### Wanted Feature
- status line
- maybe add some cmp source, cmp-cmdline for one.
- Autopair for tags isn't working.

### Try outs
- Neo-tree.nvim (nvim-tree alternative)
- ThePrimeagen/harpoon
- heirline.nvim (status line plugin)
- mbbill/undotree
