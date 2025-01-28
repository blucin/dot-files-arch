if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

set -Ux LIBVA_DRIVER_NAME nvidia
set -Ux GIT_EDITOR lvim

fish_add_path .local/bin/
fish_add_path go/bin
fish_add_path .cargo/bin
fish_add_path /opt/sonar-scanner/bin/
fish_add_path flatpdf/

if type -q starship
    function starship_transient_prompt_func
        starship module character
    end
    starship init fish | source

    if string match -q "$TERM_PROGRAM" vscode
        set -e VSCODE_SHELL_INTEGRATION
        . (code --locate-shell-integration-path fish)
    end
end


# abbr zellij zellij -l welcome

if type -q eza
    function eza --wraps eza
        command eza --icons --git --group-directories-first --hyperlink $argv
    end
    abbr ls eza -a
    abbr ll eza -l -a
    abbr lt eza -T -D
    abbr ltt eza -T
end

abbr ga git add
abbr gc git commit -m
abbr gb git branch
abbr gp git push
abbr gl git pull
abbr gd git diff
abbr gs git status
abbr gst git switch
abbr gco git checkout
abbr gcf git cat-file -p
abbr glog git --no-pager log -n 10 --oneline --parents --graph --decorate

abbr cat bat

abbr hx helix

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
