# Vim Command Reference & Optimization Guide

A support document for getting fast with Vim — built-in commands plus
the custom shortcuts provided by this VSCode Vim configuration. Keep it
in this project as `README.md`.

## Table of contents

- [This config's shortcuts](#this-configs-shortcuts)
- [Movement](#movement)
- [Editing](#editing)
- [Search & replace](#search--replace)
- [Visual mode](#visual-mode)
- [Registers & macros](#registers--macros)
- [Marks & jumps](#marks--jumps)
- [Windows, splits & buffers](#windows-splits--buffers)
- [Folding](#folding)
- [Command-line tricks](#command-line-tricks)
- [Speed habits worth building](#speed-habits-worth-building)

---

## This config's shortcuts

| Key | Action |
|---|---|
| `Space` | Leader key |
| `Leader e` | Toggle file tree (NERDTree) |
| `F5` | Toggle folder/file browser (NERDTree) |
| `F4` | Toggle terminal split |
| `F6` | Save, compile, and run current C/C++ file |
| `Ctrl+p` | Fuzzy find files |
| `Ctrl+f` | Fuzzy search text in project (ripgrep) |
| `Ctrl+h/j/k/l` | Move between splits |
| `Ctrl+Up` / `Ctrl+Down` | Previous/next open buffer |
| `Alt+Arrow keys` | Resize current split |
| `Ctrl+n` (on a word) | Multi-cursor: select next occurrence |
| `Leader c` | Comment/uncomment line or selection |
| `Leader u` | Toggle undo tree |
| `Leader g` | Git status (`:G`) |
| `Leader n f` | Create a new file |
| `Leader n d` | Create a new folder |
| `Leader h` | Open Vim's built-in `:help` (type a command/option after it) |
| `Leader ?` | Open this cheat sheet (`vim-config-plugin/README.md` — update the mapping if you move this file) |
| `jj` | Escape insert mode |

---

## Movement

| Key | Moves to |
|---|---|
| `h j k l` | Left / down / up / right |
| `w` / `b` | Next / previous word start |
| `e` / `ge` | Next / previous word end |
| `0` / `^` / `$` | Start of line / first non-blank / end of line |
| `gg` / `G` | Top / bottom of file |
| `{count}G` or `:{count}` | Go to line `{count}` |
| `%` | Jump to matching `()`/`{}`/`[]` |
| `{` / `}` | Previous / next paragraph |
| `Ctrl+d` / `Ctrl+u` | Half page down / up |
| `Ctrl+f` / `Ctrl+b` | Full page down / up *(check this config: `Ctrl+f` is also mapped to project search; use `Page Down`/`Page Up` for paging)* |
| `f{char}` / `t{char}` | Jump to / just before next `{char}` on the line |
| `;` / `,` | Repeat last `f`/`t` forward / backward |

## Editing

| Key | Action |
|---|---|
| `i` / `a` | Insert before / after cursor |
| `I` / `A` | Insert at start / end of line |
| `o` / `O` | Open new line below / above |
| `x` / `X` | Delete char under / before cursor |
| `dd` | Delete (cut) line |
| `yy` | Yank (copy) line |
| `p` / `P` | Paste after / before cursor |
| `cw` | Change word |
| `cc` | Change whole line |
| `r{char}` | Replace single character |
| `~` | Toggle case of char under cursor |
| `u` / `Ctrl+r` | Undo / redo |
| `.` | Repeat last change |
| `dt{char}` | Delete up to (not including) `{char}` |
| `di(` / `da(` | Delete inside / around `()`; use `dib`/`dab` for parentheses. Similar text objects include `di"`, `di'`, `di{`, and `dit` for tags when supported by the filetype/config |

## Search & replace

| Key | Action |
|---|---|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Repeat search forward / backward |
| `*` / `#` | Search word under cursor forward / backward |
| `:%s/old/new/g` | Replace all `old` with `new` on every line in the file |
| `:%s/old/new/gc` | Same, but confirm each replacement |
| `:s/old/new/g` | Replace all on current line only |

## Visual mode

| Key | Action |
|---|---|
| `v` | Character-wise visual selection |
| `V` | Line-wise visual selection |
| `Ctrl+v` | Block (column) visual selection |
| `gv` | Reselect last visual selection |
| `>` / `<` | Indent / unindent selection |
| `=` | Auto-indent selection |
| `Ctrl+n` | Add next matching word as another cursor *(vim-visual-multi, part of this config)* |

## Registers & macros

| Key | Action |
|---|---|
| `"ayy` | Yank line into register `a` |
| `"ap` | Paste from register `a` |
| `qa ... q` | Record macro into register `a` |
| `@a` | Run macro `a` |
| `@@` | Repeat last-run macro |
| `:reg` | List all registers |

## Marks & jumps

| Key | Action |
|---|---|
| `ma` | Set mark `a` at cursor |
| `` `a `` | Jump to mark `a` (exact position) |
| `'a` | Jump to mark `a` (start of line) |
| `Ctrl+o` / `Ctrl+i` | Back / forward through jump list |
| `` `` `` | Jump to the position before the last jump |

## Windows, splits & buffers

| Key | Action |
|---|---|
| `:sp` / `:vsp` | Horizontal / vertical split |
| `Ctrl+h/j/k/l` | Move between splits *(this config)* |
| `Ctrl+w` `=` | Equalize split sizes |
| `:ls` | List open buffers |
| `:b {number}` | Jump to buffer by number |
| `Ctrl+Up`/`Ctrl+Down` | Previous/next buffer *(this config)* |
| `:bd` | Close (delete) current buffer |

## Folding

| Key | Action |
|---|---|
| `zf{motion}` | Create a fold, e.g. `zfap` folds a paragraph |
| `za` | Toggle fold under cursor |
| `zR` | Open all folds |
| `zM` | Close all folds |

## Command-line tricks

| Command | Action |
|---|---|
| `:w !sudo tee %` | Write through `sudo` when you lack permission *(then reload with `:e` if needed)* |
| `:e!` | Reload file, discarding unsaved changes |
| `:earlier 5m` | Move the undo state to roughly 5 minutes ago |
| `:later 5m` | Move forward through the undo history |
| `:set ft?` | Show the current filetype |
| `!!ls` (normal mode; same as `:.!ls`) | Replace the current line with shell command output |

## Speed habits worth building

- Stop using arrow keys — `h j k l` keeps your hands on the home row.
- Combine an operator with a motion instead of repeating a key: `d3w`
  deletes 3 words, `y$` yanks to end of line, `ci"` changes inside
  quotes.
- Use `.` to repeat the last change rather than redoing it manually.
- Use `*`/`#` plus `n`/`N` instead of manually typing `/word` again.
- Record a macro (`qa...q`) for any repetitive edit you'll do more
  than twice, then run it with a count: `10@a`.
- Use `Ctrl+p` (fuzzy find, this config) instead of `:e` + tab-completing
  a path by hand.

### Important configuration notes

- This guide mixes built-in Vim commands with plugin mappings. Verify the
  mappings in `settings.json` or `keybindings.json`; a mapping can override
  a standard Vim command, as `Ctrl+f` does here.
- `Leader` means the key configured as `mapleader` (shown as `Space` above),
  so `Leader n f` means `Space`, then `n`, then `f`.
- Plugin-dependent entries such as NERDTree, fuzzy finding, Git, undo tree,
  commenting, and multi-cursor require their corresponding extensions or
  plugins to be installed.
- `:w !sudo tee %` may print the written file in the command area and can
  leave the buffer marked modified; use `:e` or `:checktime` after saving.
#update Readme
