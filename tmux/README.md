В основу лёг вот этот конфиг: https://github.com/omerxx/dotfiles -> tmux
# ~/.config/tmux/tmux.conf

## Install
Once everything has been installed it's time to run TPM, install first:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Run
`Ctrl+I`

## bug
If you press "prefix + o," the session opens for a moment and then closes.

Open plugins/tmux-sessionx/sessionx.tmux
And comment line `--scrollbar '▌▐'`

Or use my fork sessionx(default my)

