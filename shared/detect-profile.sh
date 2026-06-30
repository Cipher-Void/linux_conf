detect_dotfiles_profile() {
    if [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl"
    elif [[ -f /etc/arch-release ]]; then
        echo "arch"
    else
        echo "generic"
    fi
}
