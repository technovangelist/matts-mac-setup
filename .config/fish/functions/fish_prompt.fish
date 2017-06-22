function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    git-radar --fish -fetch
    set_color normal
    echo -n ' > '
end
