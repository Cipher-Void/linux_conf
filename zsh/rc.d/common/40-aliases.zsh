alias cls=clear
alias n=nvim
alias ls=lsd

alias python3="python3.13"
alias python="python3"
alias py="python"
alias actpy="source ./.venv/bin/activate"

mkpyproj() {
    python3 -m venv .venv
    cp ~/.config/other_files/pyrightconfig.json .
    actpy
    pip install -U pip
    pip install pyright
}

mkdjproj() {
    mkpyproj
    pip install django django-stubs django-types django-extensions ipython
    echo "--- Pls add django_extensions in INSTALLED_APPS"
}
