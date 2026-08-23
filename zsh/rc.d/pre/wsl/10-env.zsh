export WIN_IP=$(grep -m1 nameserver /etc/resolv.conf | awk '{print $2}')

export ZVM_SYSTEM_CLIPBOARD_ENABLED=true
export ZVM_CLIPBOARD_COPY_CMD='win32yank.exe -i --crlf'
export ZVM_CLIPBOARD_PASTE_CMD='win32yank.exe -o --lf'
