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
# fish_add_path ~/.bun/bin
# fish_add_path ~/.deno/bin
# fish_add_path /opt/homebrew/opt/ruby/bin
# fish_add_path /opt/homebrew/opt/llvm/bin
# fish_add_path /opt/homebrew/opt/bison/bin
# fish_add_path /opt/metasploit-framework/bin
# fish_add_path /opt/homebrew/opt/binutils/bin
# fish_add_path /opt/homebrew/opt/bc/bin
# fish_add_path /opt/homebrew/opt/flex/bin
# fish_add_path /opt/homebrew/opt/util-linux/bin
# fish_add_path /opt/homebrew/opt/util-linux/sbin

# Pnpm: Great node package manager
set -gx PNPM_HOME "/Users/ivory/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Global variables
# set -gx PATH /opt/X11/bin $PATH
set -gx EZA_CONFIG_DIR ~/.config/eza
set -Ux MANPAGER "nvim +Man!"
set -x LESSHISTFILE "-"
set -Ux GPG_TTY (tty)
set -gx TERM xterm-256color
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -gx XDG_CONFIG_HOME ~/.config
set -gx BAT_THEME "rose-pine"
# set -gx BUN_INSTALL "$HOME/.bun"
# set -gx PATH $BUN_INSTALL/bin $PATH
# set -gx LDFLAGS "-L/opt/homebrew/opt/ruby/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/ruby/include"
# set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/ruby/lib/pkgconfig"
# set -gx PATH $HOME/.luarocks/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -gx GOPATH (go env GOPATH)
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN
# set -gx PATH /Users/ivory/.rbenv/shims $PATH
# set -gx PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin $PATH
# set -gx PATH /opt/homebrew/opt/gawk/libexec/gnubin $PATH
# set -gx PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
# set -gx PATH /opt/homebrew/opt/make/libexec/gnubin $PATH


# util-linux flags
# set -gx LDFLAGS "-L/opt/homebrew/opt/util-linux/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/util-linux/include"
# set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/util-linux/lib/pkgconfig"

# bison flags

# zlib flags
# set -gx LDFLAGS "-L/opt/homebrew/opt/zlib/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/zlib/include"
# set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/zlib/lib/pkgconfig"

# flex flags
# set -gx LDFLAGS "-L/opt/homebrew/opt/flex/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/flex/include"

# binutils flags
# set -gx LDFLAGS "-L/opt/homebrew/opt/binutils/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/binutils/include"

# llvm flags
# set -x LDFLAGS "-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
# set -x CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

# FZF Config
# set -Ux FZF_DEFAULT_COMMAND "fd --hidden --exclude .git"
# set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
# set -g FZF_LEGACY_KEYBINDINGS 0

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
alias skv "skhd --stop-service && skhd -V"
alias awi "yabai -m query --windows | fx"
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
alias erc "vim ~/.config/espanso/"
alias gnrc "cd ~/.gnupg/"
alias grc "vim ~/.config/ghostty/config"
alias skrc "vim ~/.skhdrc"
alias yrc "vim ~/.yabairc"
alias yrs "yabai --restart-service"
alias u "source ~/.config/fish/config.fish"
alias gu "gpgconf --kill gpg-agent &&  gpgconf --launch gpg-agent"

# |======  Applications  ======|
alias gl gorilla
alias btop bpytop
alias ff "fastfetch -l android"
alias cat bat
alias lg lazygit

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
fnm env --use-on-cd | source
status --is-interactive; and rbenv init - fish | source
