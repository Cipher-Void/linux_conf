source "$ZDOTDIR/rc.d/00-detect-profile.zsh"

for f in "$ZDOTDIR"/rc.d/common/*.zsh; do
    source "$f"
done

if [[ -d "$ZDOTDIR/rc.d/$DOTFILES_PROFILE" ]]; then
    for f in "$ZDOTDIR"/rc.d/"$DOTFILES_PROFILE"/*.zsh; do
        source "$f"
    done
fi

source "$ZDOTDIR/rc.d/30-oh-my-zsh.zsh"
