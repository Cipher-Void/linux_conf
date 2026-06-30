export WIN_IP=$(grep -m1 nameserver /etc/resolv.conf | awk '{print $2}')

export ZVM_SYSTEM_CLIPBOARD_ENABLED=true
export ZVM_CLIPBOARD_COPY_CMD='/mnt/c/Windows/System32/clip.exe'
export ZVM_CLIPBOARD_PASTE_CMD='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command Get-Clipboard'
