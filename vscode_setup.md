# VS Code Setup

## Plugins to install

- Darcula Official
- Gruvbox Theme
- Markdown All in One
- Material Icon Theme
- Open in Vim
- Prettier
- Vim
- Visual Studio IntelliCode

## Apply `vscode_settings.json`

```bash
if [ -f $HOME/Library/Application\ Support/Code/User/settings.json ]; then
  cp $HOME/Library/Application\ Support/Code/User/settings.json \
    $HOME/Library/Application\ Support/Code/User/settings.json.bak
fi
cp vscode_settings.json $HOME/Library/Application\ Support/Code/User/settings.json
```
