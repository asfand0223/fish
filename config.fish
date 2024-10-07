# Set Fish options
set -g -x fish_greeting ""  # Disable the default Fish greeting
set -g -x EDITOR "nvim"  # Set the default editor (change to "vim" or "nano" if you prefer)
set -g -x VISUAL $EDITOR

# Enhance the PATH
set -U fish_user_paths /usr/local/bin $fish_user_paths  # Add /usr/local/bin to the PATH

# Aliases for convenience
alias ll="ls -lah"  # More detailed directory listing
alias gs="git status"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"  # Enable colored output in grep

# Enable syntax highlighting (default in Fish)
set -g fish_color_command yellow
set -g fish_color_param cyan

# Enable abbreviations (like smart aliases)
abbr -a gco "git checkout"
abbr -a gc "git commit -m"
abbr -a gl "git pull"
abbr -a gp "git push"

# Useful functions
function mkcd
    # Make a directory and move into it
    mkdir -p $argv; cd $argv
end

# Key bindings (e.g., Ctrl+r for history search)
bind \cr history-search-backward
bind \cv history-search-forward

# Set fish as the default shell (uncomment if needed)
if status is-interactive
    set -g -x SHELL (which fish)
end

# Autoload functions from ~/.config/fish/functions
for file in ~/.config/fish/functions/*.fish
    source $file
end

#Paths
# Neovim
set -Ux fish_user_paths $fish_user_paths /opt/nvim-linux64/bin

# Dotnet root
set -Ux fish_user_paths $fish_user_paths $HOME/.dotnet
set -x DOTNET_ROOT $HOME/.dotnet

# Shortcuts for nexus project navigation, build, execution
function web
    cd $HOME/nexus/nexus.web
end

function oweb
    cd $HOME/nexus/nexus.web
    nvim
end

function rweb
    npm run dev
end

function auth
    cd $HOME/nexus/Nexus.Auth/Nexus.Auth
end

function oauth
    cd $HOME/nexus/Nexus.Auth/Nexus.Auth
    nvim
end

function rauth
    dotnet build -c Debug && dotnet run $HOME/nexus/Nexus.Auth/Nexus.Auth/bin/Debug/net8.0/Nexus.Auth
end

function posts
    cd $HOME/nexus/Nexus.Posts/Nexus.Posts
end

function oauth
    cd $HOME/nexus/Nexus.Posts/Nexus.Posts
    nvim
end

function rposts
    dotnet build -c Debug && dotnet run $HOME/nexus/Nexus.Posts/Nexus.Posts/bin/Debug/net8.0/Nexus.Posts
end

# Shortcut to open configs
function cfish
    nvim ~/.config/fish/config.fish
end

function cnvim
    nvim ~/.config/nvim/lua/plugins
end

function ci3
    nvim ~/.config/i3/config
end

#Shortcut key to clear terminal
function cc
    clear
end
