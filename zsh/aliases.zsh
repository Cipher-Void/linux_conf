alias cls=clear

alias n=nvim
alias ls=lsd
alias rm=rmt

# Работа с Python
alias python3="python3.13"
alias python="python3"
alias py="python"
alias actpy="source ./.venv/bin/activate" # для быстрой аквивации python
alias mkpyproj="python3 -m venv .venv && 
    cp ~/.config/other_files/pyrightconfig.json . && 
    actpy && 
    pip install -U pip &&
    pip install pyright"
alias mkdjproj="mkpyproj &&
    pip install django django-stubs django-types django-extensions ipython &&
    echo '\n--- Pls add djangon_extensions in INSTALLED_APPS'"
# WSL Windos
# выбери один из open
# alias open=explorer.exe # for windows wsl - open dir in ecploer windos: open .
# alias open="/mnt/c/Windows/explorer.exe" # for windows wsl - open dir in ecploer windos: open .
