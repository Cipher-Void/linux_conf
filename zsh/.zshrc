source "$ZDOTDIR/rc.d/00-detect-profile.zsh"

# --- PRE: до oh-my-zsh ---
for f in "$ZDOTDIR"/rc.d/pre/common/*.zsh(N); do
    source "$f"
done

if [[ -d "$ZDOTDIR/rc.d/pre/$DOTFILES_PROFILE" ]]; then
    for f in "$ZDOTDIR"/rc.d/pre/"$DOTFILES_PROFILE"/*.zsh(N); do
        source "$f"
    done
fi

# --- oh-my-zsh сам ---
source "$ZDOTDIR/rc.d/30-oh-my-zsh.zsh"

# --- POST: после oh-my-zsh ---
for f in "$ZDOTDIR"/rc.d/post/common/*.zsh(N); do
    source "$f"
done

if [[ -d "$ZDOTDIR/rc.d/post/$DOTFILES_PROFILE" ]]; then
    for f in "$ZDOTDIR"/rc.d/post/"$DOTFILES_PROFILE"/*.zsh(N); do
        source "$f"
    done
fi
