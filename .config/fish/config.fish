
#alias tttt "echo 'xxttt'"
#rbenv init - | source
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
 
function getkey
  security find-generic-password -a mattw -s $argv[1] -w
end

alias stt "subl ."
alias st "subl $argv"
alias curl-trace 'curl -w "@/Users/mattw/.curl-format" -o /dev/null -s'
# alias vim "mvim -v"
alias tsinit "npm init -y;tsc --init --target es2016 --typeroots "node_modules/@types";npm install @types/node --save-dev;touch index.ts;npm install ts-node --save-dev;npm install nodemon --save-dev"

# set -gx PYTHONPATH /usr/local/lib/python2.7/site-packages
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gx GITHUB_ACCESS_TOKEN (getkey github_access_token)
set -g -x github_personal_token (getkey github_person_token)
set GHIPS_ORG datadog
set GOPATH $HOME/Projects/golang
# set PATH $PATH /Users/mattw/Projects/golang/bin
set -x PATH /usr/local/bin /usr/bin /bin ~/bin ./node_modules/.bin $PATH
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
# status --is-interactive; and . (rbenv init -|psub)
set -gx VAULT_ADDR http://127.0.0.1:8200

function ansone -d "run a playbook"
set play $argv[1]
  pushd ~/Projects/DatadogRepos/summit-training
  aws-vault exec demo -- pwd
  aws-vault exec demo -- ansible-playbook -i inventory $play
  popd
end

function ansgroup -d "run a playbook on a up to x groups"
  set count $argv[1]
  set play $argv[2]
  pushd ~/Projects/DatadogRepos/summit-training
  aws-vault exec demo -- pwd
  for x in (seq 1 $count)
    aws-vault exec demo -- ansible-playbook -i inventory $play --extra-vars "group=$x eventname=sfsummit" &
  end
  popd
end

function anslist -d "list the summit playbooks"
  pushd ~/Projects/DatadogRepos/summit-training
  ls *.yml
  popd
end

function dddinfo
  set hostmachine $argv[1]
  vagrant ssh $hostmachine -c \'docker exec (vagrant ssh $hostmachine -c 'docker ps -f name=dd-agent -q') /etc/init.d/datadog-agent info\'
end

alias updatesg "ansgroup 8 0-updatesg.yml;ansone a-update-controller-sg.yml"
alias fvim "fzf > $TMPDIR/fzf.result; and vim (cat $TMPDIR/fzf.result)"

alias bcs "brew cask search"
alias bci "brew cask info"
chruby ruby-2.3

eval (direnv hook fish)
