# HomeBrew
eval (/opt/homebrew/bin/brew shellenv)

if type -q gpgconf
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

# Fish Paths
set fish_greeting ""
set -g fish_key_bindings fish_vi_key_bindings

# Paths
fish_add_path /bin
fish_add_path ~/.local/bin
fish_add_path ~/go/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Global variables
set -gx EZA_CONFIG_DIR ~/.config/eza
set -Ux MANPAGER "nvim +Man!"
set -x LESSHISTFILE "-"
set -Ux GPG_TTY (tty)
set -gx TERM xterm-256color
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -gx XDG_CONFIG_HOME ~/.config
set -gx BAT_THEME "reverse-void"
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -gx GOPATH (go env GOPATH)
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN

# |====== Aliases  ======|
alias vim nvim
alias v nvim
alias c clear
alias :q exit

# |====== Git  ======|
alias g "git"
alias gs "git status -s"
alias gc "git clone"
alias glog "git log --oneline --graph --all"

# |====== Utils  ======|
alias sf "fzf | xargs nvim"
alias s "spf"
alias cp "cp -i"
alias dow "z ~/Downloads"
alias doc "z ~/Documents"
alias p "open -a Preview.app"
alias h history
alias pp "string split ':' $PATH | fzf"
alias attach "tmux attach"

# |======  CD  ======|
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

# |======  LS  ======|
alias l "eza -l --icons --git -a"
alias ls "eza"
alias ll "eza --tree --level=2 --long --icons --git"
alias e "eza --long --tree"
alias lt "eza -lAh --icons=always --git --tree --level=4 --long --ignore-glob='node_modules|.git' "

# |======  Config App  ======|
alias nrc "cd ~/.config/nvim | vim "
alias trc "cd ~/.config/tmux | vim "
alias frc "vim ~/.config/fish/config.fish"
alias gnrc "cd ~/.gnupg/"
alias grc "vim ~/.config/ghostty/config"
alias arc "vim ~/.config/aerospace/aerospace.toml"
alias u "source ~/.config/fish/config.fish"
alias gu "gpgconf --kill gpg-agent &&  gpgconf --launch gpg-agent"

# |======  Applications  ======|
alias btop bpytop
alias ff "fastfetch -l android"
alias cat bat
alias lg lazygit
alias code code-insiders


# |======  Live-Server  ======|
alias live 'live-server --port=5500 --wait=50 --ignore="**/*.scss,**/*.sass,**/*.ts,.vscode/**"'

# |======  HomeBrew ======|
alias bi "brew install"
alias bs "brew search"

function delx
    set files (find . -maxdepth 1 -type f -perm +111)

    if test (count $files) -eq 0
        echo "No executables found."
        return
    end

    echo "Executables found:"
    for f in $files
        echo " - $f"
    end

    # Correct fish prompt flag (uppercase -P)
    read -l -P "Delete these files? (y/N): " confirm

    if test "$confirm" = "y"
        rm $files
        echo "Deleted."
    else
        echo "Aborted."
    end
end

# source
starship init fish | source
zoxide init fish | source
status --is-interactive; and rbenv init - fish | source

