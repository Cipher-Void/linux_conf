#!/usr/bin/env bash
if [ -z "${BASH_VERSION:-}" ]; then
  exec bash "$0" "$@"
fi
set -euo pipefail

DOTFILES_DIR="$HOME/.config"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

log() { printf '==> %s\n' "$1"; }

# --- 1. Проверка, что репозиторий на месте ---
if [ ! -f "$DOTFILES_DIR/zsh/.zshenv.template" ]; then
    echo "Не найден $DOTFILES_DIR/zsh/.zshenv.template" >&2
    echo "Похоже, ~/.config не клонирован или структура другая." >&2
    exit 1
fi

# --- 2. Установка zsh и git, если их нет ---
install_pkg() {
    local pkg="$1"
    if command -v "$pkg" >/dev/null 2>&1; then
        log "$pkg уже установлен"
        return
    fi

    log "Устанавливаю $pkg"
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm "$pkg"
    elif command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y "$pkg"
    else
        echo "Не найден поддерживаемый менеджер пакетов (pacman/apt). Установи '$pkg' вручную." >&2
        exit 1
    fi
}

install_pkg zsh
install_pkg git
install_pkg curl

# --- 3. ~/.zshenv: копируем шаблон, с бэкапом если уже есть ---
if [ -f "$HOME/.zshenv" ] && [ ! -L "$HOME/.zshenv" ]; then
    log "Бэкаплю существующий ~/.zshenv -> ~/.zshenv.bak"
    cp "$HOME/.zshenv" "$HOME/.zshenv.bak"
fi

log "Копирую .zshenv.template -> ~/.zshenv"
cp "$DOTFILES_DIR/zsh/.zshenv.template" "$HOME/.zshenv"

# --- 4. Установка oh-my-zsh (без смены shell, без запуска zsh) ---
if [ -d "$XDG_DATA_HOME/oh-my-zsh" ]; then
    log "oh-my-zsh уже установлен, пропускаю"
else
    log "Устанавливаю oh-my-zsh"
    mkdir -p "$XDG_DATA_HOME" "$XDG_CACHE_HOME/oh-my-zsh/completions"
    ZSH="$XDG_DATA_HOME/oh-my-zsh" \
    RUNZSH=no \
    CHSH=no \
    KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- 5. Плагин zsh-vi-mode (не входит в oh-my-zsh по умолчанию) ---
ZVM_PATH="$XDG_DATA_HOME/oh-my-zsh/custom/plugins/zsh-vi-mode"
if [ -d "$ZVM_PATH" ]; then
    log "zsh-vi-mode уже установлен, пропускаю"
else
    log "Устанавливаю плагин zsh-vi-mode"
    git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode "$ZVM_PATH"
fi

# --- 6. На время установщик мог создать ~/.zshrc — убираем, нам он не нужен ---
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    log "Удаляю лишний ~/.zshrc (конфиг живёт в \$ZDOTDIR)"
    rm -f "$HOME/.zshrc"
fi

# --- 7. Смена дефолтного шелла на zsh (по желанию, спрашиваем) ---
if [ "$SHELL" != "$(command -v zsh)" ]; then
    read -r -p "Сделать zsh шеллом по умолчанию? [y/N] " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        chsh -s "$(command -v zsh)"
    fi
fi

log "Готово. Перезапусти терминал или выполни: exec zsh"
