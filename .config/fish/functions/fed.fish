function fed
  reattach-to-user-namespace code -n -w ~/.config/fish/config.fish ~/.config/fish/functions
  source ~/.config/fish/config.fish
end 

