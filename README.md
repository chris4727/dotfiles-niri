# Niri Dotfiles

Personal dotfile repository for the Niri window manager based desktop.

# Usage

## General keybind scheme

- `Super`: Window manager bindings
- `Alt`: Tmux bindings
- `Ctrl`: Individual application bindings
- `Shift`: Modifies all of the above

## Window manager

- `Super+<num>` = *Move to workspace <num>*
- `Super+v` = *Split vertically (right)*
- `Super+d` = *Split horizontally (down)*
- `Super+l` or `Super+Right` = *Move to right window*
- `Super+h` or `Super+Left` = *Move to left window*
- `Super+j` or `Super+Down` = *Move to lower window*
- `Super+k` or `Super+Up` = *Move to upper window*

> [!todo]
> - `Super+z` = Fullscreen (zoomed)
> - `Super+w` = Floating (W)indows
> - `Super+t` = Tabbed layout

### Application launchers

- `Super+Enter` = *Open new terminal window*
- `Super+b` = *Open new browser window*
- `Super+m` = *Open Signal Messenger*

## Terminal

> [!NOTE]
> Tabs in the terminal are generally used to contain Tmux sessions when on different servers. Typically tab 1 is the current computer, and additional tabs are servers connected through SSH. This prevents having to have nested Tmux sessions.

- `Ctrl+Shift+t` = *New terminal tab*
- `Ctrl+Shift+left` = *Move to left tab*
- `Ctrl+Shift+right` = *Move to right tab*

## Tmux

- `$ tmx` or `Ctrl+t` = *Alias to create or attach to Tmux session*
- `Ctrl+Space` = *Leader key*
- `Leader s` = *List sessions*
- `Leader w` = *Create new window and prompt for name*
- `Leader r` = *Rename window*
- `Leader <num>` = *Move to window <num>*
- `Alt+q` = *Close window*

- `Alt+x` = *Close pane*
- `Leader v` = *Split pane vertically (right)*
- `Leader d` = *Split pane horizontally (down)*
- `Leader z` = *Zoom pane*
- `Alt+h` or `Alt+Left` = *Move to left pane*
- `Alt+j` or `Alt+Down` = *Move to lower pane*
- `Alt+k` or `Alt+Up` = *Move to upper pane*
- `Alt+l` or `Alt+Right` = *Move to right pane*

- `Alt+g` = *Open Lazygit in popup*
- `Alt+t` = *Open new terminal in popup*

## Vim

- `Space` = *Leader key*
- `;` = *Local leader*

### Vim Normal Mode

- `-` = *Show file directory*
- `Leader c` = *Source config*

- `Leader v` = *Split vertically (right)*
- `Leader d` = *Split horizontally (down)*
- `Leader w` = Swap between Vim split panes
- `Alt+h` or `Alt+Left` = *Move to left pane* [^1]
- `Alt+j` or `Alt+Down` = *Move to lower pane* [^1]
- `Alt+k` or `Alt+Up` = *Move to upper pane* [^1]
- `Alt+l` or `Alt+Right` = *Move to right pane* [^1]
 
- `F4` = Toggle Line numbers
- `F7` = Toggle Spellcheck
- `F8` = Toggle visible whitespace
- `F9` = Insert datestamp at cursor
- `F11` = Toggle reading mode

- `Ctrl+t` = Format Markdown table under cursor
- `Leader t <char>` = Tabularize by character

- `Ctrl+f` = **FZF**: Fuzzy find and open a file in directory*
- `Ctrl+g` = **FZF**:Fuzzy find git commits
 
### Vim Insert Mode

- `Ctrl+f` = **FZF**: Fuzzy find in current file

### Vim Visual Mode

- `Ctrl+y` = *Yank visually selected into system clipboard*

### Yazi

- `y` BASH alias to start Yazi
- `y` Yank (copy)
- `x` Cancel yank (copy)
- `Y` Yank (cut)
- `X` Cancel yank (cut)


[^1]: Since Vim splits are only used on machines without Tmux installed, navigating Vim splits uses the same bindings as Tmux panes. The bindings are only applied in Vim if not running in a Tmux session.

 
