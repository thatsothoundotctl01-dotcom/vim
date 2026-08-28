# Gruvbox Vim Setup — Support Guide

A complete reference for installing, using, and troubleshooting the custom
`.vimrc` (Gruvbox theme + Airline + NERDTree + F6 run-code shortcut).

---

## 1. What This Setup Includes

| Feature | Plugin / Setting |
|---|---|
| Color scheme | `morhetz/gruvbox` (dark, hard contrast) |
| Status line + buffer tabs | `vim-airline` + `vim-airline-themes` |
| File explorer sidebar | `preservim/nerdtree` |
| File type icons | `ryanoasis/vim-devicons` |
| Auto-close brackets/quotes | `jiangmiao/auto-pairs` |
| Escape insert mode | `jj` |
| Run current file | `F6` |

---

## 2. Requirements

Before installing, make sure you have:

- **Vim 8+** or **Neovim** (`vim --version` / `nvim --version`)
- **git** and **curl** installed
- A **Nerd Font** installed and set as your terminal font
  (e.g. *FiraMono Nerd Font*, *FantasqueSansMono Nerd Font*)
  → Download: https://www.nerdfonts.com/
- Language toolchains for whichever `F6` shortcuts you plan to use:

| Language | Required tool |
|---|---|
| C | `gcc` |
| C++ | `g++` |
| Python | `python3` |
| JavaScript | `node` |
| TypeScript | `ts-node` |
| Java | `javac` / `java` |
| Go | `go` |
| Rust | `cargo` |
| Ruby | `ruby` |
| PHP | `php` |
| Bash | `bash` |
| Lua | `lua` |
| Perl | `perl` |
| R | `Rscript` |

---

## 3. Installation

### Step 1 — Back up your existing config (if any)
```bash
mv ~/.vimrc ~/.vimrc.backup 2>/dev/null
```

### Step 2 — Save the provided `.vimrc`
Place the full configuration file at:
```
~/.vimrc              (for Vim)
~/.config/nvim/init.vim   (for Neovim)
```

### Step 3 — Install vim-plug (plugin manager)
This happens automatically the first time you open Vim, but you can also do it manually:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Step 4 — Install the plugins
Open Vim and run:
```
:PlugInstall
```
Wait for all plugins to finish downloading, then restart Vim.

### Step 5 — Set your terminal font
In your terminal emulator's preferences, set the font to a **Nerd Font**
variant. Without this, icons in NERDTree/Airline will show as broken boxes (`�`).

---

## 4. Keybindings Reference

| Shortcut | Action |
|---|---|
| `jj` (insert mode) | Escape to normal mode |
| `F6` | Compile & run the current file |
| `Ctrl+n` | Toggle NERDTree file sidebar |
| `Ctrl+h/j/k/l` | Move between split windows |
| `,w` (leader+w) | Save file |
| `,q` (leader+q) | Quit file |

> Leader key is set to `,` (comma).

---

## 5. Usage Examples

**Run a Python script:**
1. Open `script.py` in Vim.
2. Press `F6`.
3. Vim saves the file and runs `python3 script.py` in the command line below.

**Run a C program:**
1. Open `main.c`.
2. Press `F6`.
3. Vim compiles with `gcc` and immediately executes the binary.

**Toggle the file tree:**
- Press `Ctrl+n` anytime to show/hide NERDTree.

---

## 6. Troubleshooting

### Icons look like boxes or question marks
➡ Your terminal font isn't a Nerd Font. Install one and set it in your terminal's font settings, then restart the terminal.

### `colorscheme gruvbox` gives an error: "Cannot find color scheme"
➡ Plugins haven't installed yet. Run `:PlugInstall` inside Vim, then restart.

### `F6` does nothing
➡ Check `:set filetype?` — if it shows blank or wrong type, Vim doesn't
recognize the file extension. Add `:set filetype=python` (or the correct
language) manually, or ensure the file has the correct extension (`.py`, `.js`, etc).

### F6 says "command not found" (e.g. `gcc`, `node`, `go`)
➡ The required compiler/interpreter isn't installed on your system. Install it via your package manager, e.g.:
```bash
sudo apt install gcc python3 nodejs golang ruby php
```

### Colors look washed out / not matching screenshots
➡ Add or confirm this line is present and your terminal supports true color:
```vim
set termguicolors
```
Also verify your terminal emulator itself supports 24-bit color (most modern ones do — Alacritty, Kitty, iTerm2, GNOME Terminal, Windows Terminal).

### Plugins fail to install / `git` errors
➡ Ensure `git` is installed and you have internet access:
```bash
sudo apt install git
```

### Vim feels slow when opening large files
➡ Already mitigated with `synmaxcol=300` and `lazyredraw`, but for very
large files you can also add:
```vim
autocmd BufWinEnter * if line('$') > 5000 | syntax off | endif
```

### Auto-pairs interferes with typing brackets
➡ Temporarily disable per-buffer:
```
:let b:autopairs_enabled = 0
```

---

## 7. Uninstalling / Reverting

To remove everything and go back to default Vim:
```bash
rm -rf ~/.vim ~/.vimrc
mv ~/.vimrc.backup ~/.vimrc   # restore your old config, if you made one
```

---

## 8. Customization Tips

- **Switch to light mode:** change `set background=dark` → `set background=light`.
- **Change contrast:** `let g:gruvbox_contrast_dark = 'soft'` (options: `soft`, `medium`, `hard`).
- **Add more F6 languages:** copy a line under section 7 of the `.vimrc` and change the `FileType` + shell command.
- **Disable auto-open NERDTree on startup:** delete or comment out the `autocmd VimEnter * if argc()...` line.

---

## 9. Getting Further Help

- Gruvbox docs: https://github.com/morhetz/gruvbox
- Airline docs: https://github.com/vim-airline/vim-airline
- NERDTree docs: https://github.com/preservim/nerdtree
- vim-plug docs: https://github.com/junegunn/vim-plug

If an issue isn't covered here, run `:messages` in Vim right after the error occurs — it usually shows the exact plugin or line causing the problem, which you can share for further troubleshooting.