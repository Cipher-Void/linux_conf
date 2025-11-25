linux_conf - Унифицированная коллекция dotfiles для создания консистентной и продуктивной среды разработки на Linux и Windows Subsystem for Linux (WSL). Включает преднастроенные конфигурации для tmux, git, alacritty, ssh и zsh.

# Установка
Убедитесь, что все файлы конфигурации находятся в директории `~/.config` (в вашем домашнем каталоге). Если директории `.config` не существует, создайте ее: 
```bash
mkdir ~/.config
```

## Настройка
### Настройка SSH (Опционально)
создаём ссылку на нашу настройку которая расположена в `ssh/conf.conf`
```bash
sudo ln -s ~/.config/ssh/conf.conf /etc/ssh/sshd_config.d/conf.conf
```

Перезапустите службу SSH:
```bash
sudo service ssh restart
```

**Важно:** Неправильная настройка SSH может привести к проблемам с безопасностью.  Убедитесь, что вы понимаете, что делаете.

### Установка Zsh и Oh My Zsh
1.  Установите Zsh:
    ```bash
    sudo apt install -y zsh
    ```

2.  Установите Oh My Zsh (опционально, но рекомендуется):
    Oh My Zsh – это фреймворк для управления конфигурацией Zsh.  Он предоставляет темы, плагины и другие полезные инструменты.

    ```bash
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

3.  Сделайте Zsh оболочкой по умолчанию:
    ```bash
    chsh -s $(which zsh)
    ```

4.  Перезапустите терминал:
    ```bash
    zsh
    ```


### nvim
#### Установка
Если у вас уже установлен Neovim, моя конфигурация будет автоматически загружена при запуске Neovim
##### Через пакетный менеджер ()
Его можно установить через менеджер, но тогда это будет не последняя версия
```
sudo apt install -y nvim
```

##### Установка Neovim из исходного кода (для продвинутых пользователей)
Перейдите на страницу [релизов Neovim](https://github.com/neovim/neovim/releases) и найдите последнюю версию для вашей архитектуры
- скачиваем
```
wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
```

- Распаковка
```
tar -xzvf nvim-linux-x86_64.tar.gz
```

- удаляем (заметаем следы хе-хе)
```
rm -r nvim-linux-x86_64.tar.gz
```

- создаём папку где будем хранить совт
```
mkdir .soft
```

- Переносим 
```
mv nvim-linux-x86_64 .soft/nvim
```

- создаём ссылку на nvim
```bash
sudo ln -s ~/.soft/nvim/bin/nvim /usr/local/bin/nvim
```


##### Решение проблемы с telescope-fzf-native (опционально)

Иногда команда make не запускается автоматом. По этому надо это сделать ручками
```
cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
```
```
make
```

### tmux

1) Перед запуском, а если запустили то `:kill-session`
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2) После запуска нажмите: `prefix` + `I` для установки (`prefix` = `^A`)

#### Key bindings

1) `prefix` + `I`
	- Installs new plugins from GitHub or any other git repository
	- Refreshes TMUX environment

2) `prefix` + `U`
	- updates plugin(s)

3) `prefix` + `alt` + `u`
	- remove/uninstall plugins not on the plugin list


## Для винды
### wsl
Запустить cmd от админа. Это установит и запустит Debian
```cmd
wsl.exe --install -d Debian
```

После установки WSL запустите дистрибутив Debian. Вам будет предложено создать пользователя.

После чего проверяем версию. Желательно что бы была версия 2
```cmd
wsl.exe -l -v
```

### alacritty + wsl 
Эти шаги позволяют настроить Alacritty для использования вашей темы и шрифтов в WSL.

1) Создаём папку куда перенесём настройки 
**Подставьте нужное имя пользователя**
```bash
mkdir -p /mnt/c/Users/<YourUsername>/AppData/Roaming/alacritty/themes
```

2) Переносим наши настройки в созданную папку
```bash
cp ~/.config/alacritty/alacritty.toml /mnt/c/Users/<YourUsername>/AppData/Roaming/alacritty/
```

3) Скачиваем темы
```bash
git clone https://github.com/alacritty/alacritty-theme
```

4) Переносим темы 
```bash
cp -r alacritty-theme/* /mnt/c/Users/<YourUsername>/AppData/Roaming/alacritty/themes
```

**Важно:** Нужно установить шрифты которые используются в темах 
с сайта скачиваем hack `nerd font` с сайта 
https://www.nerdfonts.com/font-downloads
и устанавливаем все шрифты
