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
# Neovim path
set -Ux fish_user_paths $fish_user_paths /opt/nvim-linux64/bin
set -Ux fish_user_paths $fish_user_paths $HOME/.dotnet
set -x DOTNET_ROOT $HOME/.dotnet
