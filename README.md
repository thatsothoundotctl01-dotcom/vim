# vim-config

Personal Vim and VSCode-Vim configuration focused on fast navigation, a Gruvbox color scheme, fuzzy finding, file browsing, Git tools, and C/C++ run commands.

## Start

From the repository root:

```sh
vim -u "$PWD/init.vim"
```

The config installs `vim-plug` automatically when it is missing, then loads the declared plugins. Run `:PlugInstall` if the plugin installation did not complete.

## Features

- Gruvbox with true-color support, relative line numbers, and a highlighted cursor line
- FZF file search with `Ctrl+p` and ripgrep search with `Ctrl+f`
- NERDTree with `<leader>e` or `F5`
- Split navigation with `Ctrl+h/j/k/l`
- Terminal toggle with `F4`
- C and C++ compile/run with `F6`
- New file and folder helpers with `<leader>nf` and `<leader>nd`
- `jj` to leave insert mode
- Airline, ALE, GitGutter, Fugitive, UndoTree, Commentary, Surround, and visual-multi support

The full keybinding reference is in [docs/cheatsheet.md](docs/cheatsheet.md).

## Layout

| Path | Purpose |
| --- | --- |
| `init.vim` | Main Vim entry point and plugin configuration |
| `plugin/colorschemes/gruvbox/` | Local Gruvbox runtime files |
| `plugin/keybindings/keybind.vim` | User commands wrapping config helpers |
| `plugin/vscodevim/plugin.json` | VSCode-Vim settings |
| `docs/cheatsheet.md` | Keybinding and command reference |
| `.gitignore` | Ignores Vim and editor-generated files |

The local Gruvbox source is added to `runtimepath` from the repository location, so the config does not depend on an absolute path from another machine.
update readme 
