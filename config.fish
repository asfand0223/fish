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
alias cc="clear"
alias web="cd ~/nexus/nexus.web"
alias oweb="cd ~/nexus/nexus.web && nvim"
alias rweb="web && npm run dev"
alias auth="cd ~/nexus/Nexus.Auth/Nexus.Auth"
alias oauth="cd ~/nexus/Nexus.Auth/Nexus.Auth && nvim"
alias posts="cd ~/nexus/Nexus.Posts/Nexus.Posts"
alias oposts="cd ~/nexus/Nexus.Posts/Nexus.Posts && nvim"
alias server="cd ~/tcp_chat/server"
alias oserver="nvim ~/tcp_chat/server"
alias client="cd ~/tcp_chat/client"
alias oclient="nvim ~/tcp_chat/client"
alias db="dotnet build -c Debug"
alias ckitty="cd ~/.config/kitty"
alias okitty="nvim ~/.config/kitty/kitty.conf"
alias cfish="cd ~/.config/fish"
alias ofish="nvim ~/.config/fish/config.fish"
alias ci3="cd ~/.config/i3"
alias oi3="nvim ~/.config/i3/config"
alias cnvim="cd ~/.config/nvim"
alias onvim="nvim ~/.config/nvim/lua/plugins"

# Enable syntax highlighting (default in Fish)
set -g fish_color_command yellow
set -g fish_color_param cyan

# Enable abbreviations (like smart aliases)
abbr -a ga "git add ."
abbr -a gco "git checkout"
abbr -a gc "git commit -m"
abbr -a gf "git fetch"
abbr -a gl "git pull"
abbr -a gp "git push"

# Useful functions
function mkcd
    # Make a directory and move into it
    mkdir -p $argv; cd $argv
end

function rauth
    auth;
    dotnet build -c Debug;
    dotnet run ~/nexus/Nexus.Auth/Nexus.Auth/bin/Debug/net8.0/Nexus.Auth;
end

function rposts
    posts;
    dotnet build -c Debug;
    dotnet run ~/nexus/Nexus.Posts/Nexus.Posts/bin/Debug/net8.0/Nexus.Posts;
end

function rserver
    server;
    cmake -S . -B .;
    cmake --build build;
    ~/tcp_chat/server/build/tcp_server;
end

function rclient
    client;
    cmake -S . -B .;
    cmake --build build;
    ~/tcp_chat/client/build/tcp_client;
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
set -Ux fish_user_paths $fish_user_paths ~/.dotnet
set -x DOTNET_ROOT ~/.dotnet
