# Macbook-Setup

## System Settings

- Swap control and command key on external keyboard
- Remap CapsLock to Ctrl in Setting -> Keyboard -> Modifier Keys
- Increase keyboard key repeat rate and initial delay

```bash
# Restart to see the change
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

## Software to install

- Rectangle
- Google Drive
- JetBrains Toolbox
- Scroll Reverser
- Alfred
- iTerm2
- VSCode
- Raindrop.io

### VSCode Setup

#### settings.json

```json
{
  "window.zoomLevel": 0,
  "editor.tabSize": 2,
  "terminal.integrated.rendererType": "dom",
  "editor.multiCursorModifier": "ctrlCmd",
  "vim.startInInsertMode": true,
  "vim.leader": ",",
  "vim.insertModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ],
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["Z", "Z"],
      "commands": [":wq"]
    },
    {
      "before": ["<C-n>"],
      "commands": [":nohl"]
    },
    {
      "before": ["leader", "w"],
      "commands": ["workbench.action.files.save"]
    }
  ],
  "vim.easymotion": true,
  "terminal.integrated.fontFamily": "MesloLGS NF",
  "workbench.colorTheme": "Material Theme Darker"
}
```

## Terminal

- oh-my-zsh
  - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [zsg-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- HomeBrew

### iTerm2

#### Enable Natural Text Editing

Profile -> Keys -> Presets -> Natural Text Editing

#### Theme

Minimal

#### Color Presets

Clovis’ iTerm2 color scheme file, follow this guide: [Configuration of a beautiful (efficient) terminal and prompt on OSX in 7minutes](https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961)

### VIM

Symlink `~/.vimrc` to `myvimrc.vimrc`

```bash
rm ~/.vimrc
ln -sf ~/Documents/Projects/Macbook-Setup/myvimrc.vimrc ~/.vimrc
```

Symlink `~/.ideavimrc` to `ideavimrc.vimrc`

```bash
rm ~/.ideavimrc
ln -sf ~/Documents/Projects/Macbook-Setup/ideavimrc.vimrc ~/.ideavimrc
```

### ZSH

Symlink `~/.zshrc` to `myzshrc.zshrc`

```bash
rm ~/.zshrc
ln -sf ~/Documents/Projects/Macbook-Setup/myzshrc.zshrc ~/.zshrc
```

## References

- https://gist.github.com/kevin-smets/8568070
- https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
