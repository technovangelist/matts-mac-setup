#!/usr/local/bin/fish
function keyswitch
  set -l currkey (keyboardSwitcher get)
  echo $currkey
  switch $currkey
    case 'Workman-Dead'
      /usr/local/bin/keyboardSwitcher select "U.S"
    case 'U.S.'
      /usr/local/bin/keyboardSwitcher select "Workman-Dead"
  end
end

keyswitch