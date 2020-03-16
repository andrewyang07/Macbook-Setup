# Macbook-Setup

## System Settings

* Swap control and command key on external keyboard
* Remap CapsLock to Ctrl in Setting -> Keyboard -> Modifier Keys
* Increase keyboard key repeat rate and initial delay

```bash
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
```

## Software to install

* Rectangle
* Google Drive
* JetBrains Toolbox
* Scroll Reverser
* Alfred
* iTerm2
* VSCode

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
            "commands": [
                ":wq"
            ]
        },
        {
            "before":["<C-n>"],
            "commands": [
                ":nohl"
            ]
        },
        {
            "before": ["leader", "w"],
            "commands": [
                "workbench.action.files.save",
            ]
        }
    ],
    "vim.easymotion": true,
    "terminal.integrated.fontFamily": "MesloLGS NF",
    "workbench.colorTheme": "Material Theme Darker"
}
```

## Terminal

* oh-my-zsh
  * powerlevel10k
  * zsh-autosuggestions
* HomeBrew

### iTerm2

Profile -> Keys -> Presets -> Natural Text Editing

## References

* https://gist.github.com/kevin-smets/8568070