# docker.fish - docker completions for fish shell
#
# This file is generated by gen_docker_fish_completions.py from:
# https://github.com/barnybug/docker-fish-completion
#
# To install the completions:
# mkdir -p ~/.config/fish/completions
# cp docker.fish ~/.config/fish/completions
#
# Completion supported:
# - parameters
# - commands
# - containers
# - images
# - repositories

function __fish_docker_no_subcommand --description 'Test if docker has yet to be given the subcommand'
    for i in (commandline -opc)
        if contains -- $i attach build commit cp create diff events exec export history images import info inspect kill load login logout logs pause port ps pull push rename restart rm rmi run save search start stats stop tag top unpause version wait
            return 1
        end
    end
    return 0
end

function __fish_print_docker_containers --description 'Print a list of docker containers' -a select
    switch $select
        case running
            docker ps -a --no-trunc | command awk 'NR>1' | command awk 'BEGIN {FS="  +"}; $5 ~ "^Up" {print $1 "\n" $(NF-1)}' | tr ',' '\n'
        case stopped
            docker ps -a --no-trunc | command awk 'NR>1' | command awk 'BEGIN {FS="  +"}; $5 ~ "^Exit" {print $1 "\n" $(NF-1)}' | tr ',' '\n'
        case all
            docker ps -a --no-trunc | command awk 'NR>1' | command awk 'BEGIN {FS="  +"}; {print $1 "\n" $(NF-1)}' | tr ',' '\n'
    end
end

function __fish_print_docker_images --description 'Print a list of docker images'
    docker images | command awk 'NR>1' | command grep -v '<none>' | command awk '{print $1":"$2}'
end

function __fish_print_docker_repositories --description 'Print a list of docker repositories'
    docker images | command awk 'NR>1' | command grep -v '<none>' | command awk '{print $1}' | command sort | command uniq
end

# common options
complete -c docker -f -n '__fish_docker_no_subcommand' -l api-cors-header -d 'Set CORS headers in the remote API'
complete -c docker -f -n '__fish_docker_no_subcommand' -s b -l bridge -d 'Attach containers to a network bridge'
complete -c docker -f -n '__fish_docker_no_subcommand' -l bip -d 'Specify network bridge IP'
complete -c docker -f -n '__fish_docker_no_subcommand' -s D -l debug -d 'Enable debug mode'
complete -c docker -f -n '__fish_docker_no_subcommand' -s d -l daemon -d 'Enable daemon mode'
complete -c docker -f -n '__fish_docker_no_subcommand' -l default-ulimit -d 'Set default ulimits for containers'
complete -c docker -f -n '__fish_docker_no_subcommand' -l dns -d 'DNS server to use'
complete -c docker -f -n '__fish_docker_no_subcommand' -l dns-search -d 'DNS search domains to use'
complete -c docker -f -n '__fish_docker_no_subcommand' -s e -l exec-driver -d 'Exec driver to use'
complete -c docker -f -n '__fish_docker_no_subcommand' -l fixed-cidr -d 'IPv4 subnet for fixed IPs'
complete -c docker -f -n '__fish_docker_no_subcommand' -l fixed-cidr-v6 -d 'IPv6 subnet for fixed IPs'
complete -c docker -f -n '__fish_docker_no_subcommand' -s G -l group -d 'Group for the unix socket'
complete -c docker -f -n '__fish_docker_no_subcommand' -s g -l graph -d 'Root of the Docker runtime'
complete -c docker -f -n '__fish_docker_no_subcommand' -s H -l host -d 'Daemon socket(s) to connect to'
complete -c docker -f -n '__fish_docker_no_subcommand' -s h -l help -d 'Print usage'
complete -c docker -f -n '__fish_docker_no_subcommand' -l icc -d 'Enable inter-container communication'
complete -c docker -f -n '__fish_docker_no_subcommand' -l insecure-registry -d 'Enable insecure registry communication'
complete -c docker -f -n '__fish_docker_no_subcommand' -l ip -d 'Default IP when binding container ports'
complete -c docker -f -n '__fish_docker_no_subcommand' -l ip-forward -d 'Enable net.ipv4.ip_forward'
complete -c docker -f -n '__fish_docker_no_subcommand' -l ip-masq -d 'Enable IP masquerading'
complete -c docker -f -n '__fish_docker_no_subcommand' -l iptables -d 'Enable addition of iptables rules'
complete -c docker -f -n '__fish_docker_no_subcommand' -l ipv6 -d 'Enable IPv6 networking'
complete -c docker -f -n '__fish_docker_no_subcommand' -s l -l log-level -d 'Set the logging level'
complete -c docker -f -n '__fish_docker_no_subcommand' -l label -d 'Set key=value labels to the daemon'
complete -c docker -f -n '__fish_docker_no_subcommand' -l log-driver -d 'Containers logging driver'
complete -c docker -f -n '__fish_docker_no_subcommand' -l mtu -d 'Set the containers network MTU'
complete -c docker -f -n '__fish_docker_no_subcommand' -s p -l pidfile -d 'Path to use for daemon PID file'
complete -c docker -f -n '__fish_docker_no_subcommand' -l registry-mirror -d 'Preferred Docker registry mirror'
complete -c docker -f -n '__fish_docker_no_subcommand' -s s -l storage-driver -d 'Storage driver to use'
complete -c docker -f -n '__fish_docker_no_subcommand' -l selinux-enabled -d 'Enable selinux support'
complete -c docker -f -n '__fish_docker_no_subcommand' -l storage-opt -d 'Set storage driver options'
complete -c docker -f -n '__fish_docker_no_subcommand' -l tls -d 'Use TLS; implied by --tlsverify'
complete -c docker -f -n '__fish_docker_no_subcommand' -l tlscacert -d 'Trust certs signed only by this CA'
complete -c docker -f -n '__fish_docker_no_subcommand' -l tlscert -d 'Path to TLS certificate file'
complete -c docker -f -n '__fish_docker_no_subcommand' -l tlskey -d 'Path to TLS key file'
complete -c docker -f -n '__fish_docker_no_subcommand' -l tlsverify -d 'Use TLS and verify the remote'
complete -c docker -f -n '__fish_docker_no_subcommand' -s v -l version -d 'Print version information and quit'

# subcommands
# attach
complete -c docker -f -n '__fish_docker_no_subcommand' -a attach -d 'Attach to a running container'
complete -c docker -A -f -n '__fish_seen_subcommand_from attach' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from attach' -l no-stdin -d 'Do not attach STDIN'
complete -c docker -A -f -n '__fish_seen_subcommand_from attach' -l sig-proxy -d 'Proxy all received signals to the process'
complete -c docker -A -f -n '__fish_seen_subcommand_from attach' -a '(__fish_print_docker_containers running)' -d "Container"

# build
complete -c docker -f -n '__fish_docker_no_subcommand' -a build -d 'Build an image from a Dockerfile'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -s c -l cpu-shares -d 'CPU shares (relative weight)'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l cpuset-cpus -d 'CPUs in which to allow execution (0-3, 0,1)'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -s f -l file -d "Name of the Dockerfile (Default is 'PATH/Dockerfile')"
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l force-rm -d 'Always remove intermediate containers'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -s m -l memory -d 'Memory limit'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l memory-swap -d "Total memory (memory + swap), '-1' to disable swap"
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l no-cache -d 'Do not use cache when building the image'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l pull -d 'Always attempt to pull a newer version of the image'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -s q -l quiet -d 'Suppress the verbose output generated by the containers'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -l rm -d 'Remove intermediate containers after a successful build'
complete -c docker -A -f -n '__fish_seen_subcommand_from build' -s t -l tag -d 'Repository name (and optionally a tag) for the image'

# commit
complete -c docker -f -n '__fish_docker_no_subcommand' -a commit -d "Create a new image from a container's changes"
complete -c docker -A -f -n '__fish_seen_subcommand_from commit' -s a -l author -d 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")'
complete -c docker -A -f -n '__fish_seen_subcommand_from commit' -s c -l change -d 'Apply Dockerfile instruction to the created image'
complete -c docker -A -f -n '__fish_seen_subcommand_from commit' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from commit' -s m -l message -d 'Commit message'
complete -c docker -A -f -n '__fish_seen_subcommand_from commit' -s p -l pause -d 'Pause container during commit'
complete -c docker -A -f -n '__fish_seen_subcommand_from commit' -a '(__fish_print_docker_containers all)' -d "Container"

# cp
complete -c docker -f -n '__fish_docker_no_subcommand' -a cp -d "Copy files/folders from a container's filesystem to the host path"
complete -c docker -A -f -n '__fish_seen_subcommand_from cp' -l help -d 'Print usage'

# create
complete -c docker -f -n '__fish_docker_no_subcommand' -a create -d 'Create a new container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s a -l attach -d 'Attach to STDIN, STDOUT or STDERR'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l add-host -d 'Add a custom host-to-IP mapping (host:ip)'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s c -l cpu-shares -d 'CPU shares (relative weight)'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l cap-add -d 'Add Linux capabilities'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l cap-drop -d 'Drop Linux capabilities'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l cgroup-parent -d 'Optional parent cgroup for the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l cidfile -d 'Write the container ID to the file'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l cpuset-cpus -d 'CPUs in which to allow execution (0-3, 0,1)'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l device -d 'Add a host device to the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l dns -d 'Set custom DNS servers'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l dns-search -d 'Set custom DNS search domains'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s e -l env -d 'Set environment variables'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l entrypoint -d 'Overwrite the default ENTRYPOINT of the image'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l env-file -d 'Read in a file of environment variables'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l expose -d 'Expose a port or a range of ports'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s h -l hostname -d 'Container host name'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s i -l interactive -d 'Keep STDIN open even if not attached'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l ipc -d 'IPC namespace to use'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s l -l label -d 'Set meta data on a container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l label-file -d 'Read in a line delimited file of labels'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l link -d 'Add link to another container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l log-driver -d 'Logging driver for container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l lxc-conf -d 'Add custom lxc options'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s m -l memory -d 'Memory limit'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l mac-address -d 'Container MAC address (e.g. 92:d0:c6:0a:29:33)'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l memory-swap -d "Total memory (memory + swap), '-1' to disable swap"
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l name -d 'Assign a name to the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l net -d 'Set the Network mode for the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s P -l publish-all -d 'Publish all exposed ports to random ports'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s p -l publish -d "Publish a container's port(s) to the host"
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l pid -d 'PID namespace to use'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l privileged -d 'Give extended privileges to this container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l read-only -d "Mount the container's root filesystem as read only"
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l restart -d 'Restart policy to apply when a container exits'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l security-opt -d 'Security Options'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s t -l tty -d 'Allocate a pseudo-TTY'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s u -l user -d 'Username or UID (format: <name|uid>[:<group|gid>])'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l ulimit -d 'Ulimit options'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s v -l volume -d 'Bind mount a volume'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -l volumes-from -d 'Mount volumes from the specified container(s)'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -s w -l workdir -d 'Working directory inside the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from create' -a '(__fish_print_docker_images)' -d "Image"

# diff
complete -c docker -f -n '__fish_docker_no_subcommand' -a diff -d "Inspect changes on a container's filesystem"
complete -c docker -A -f -n '__fish_seen_subcommand_from diff' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from diff' -a '(__fish_print_docker_containers all)' -d "Container"

# events
complete -c docker -f -n '__fish_docker_no_subcommand' -a events -d 'Get real time events from the server'
complete -c docker -A -f -n '__fish_seen_subcommand_from events' -s f -l filter -d 'Filter output based on conditions provided'
complete -c docker -A -f -n '__fish_seen_subcommand_from events' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from events' -l since -d 'Show all events created since timestamp'
complete -c docker -A -f -n '__fish_seen_subcommand_from events' -l until -d 'Stream events until this timestamp'

# exec
complete -c docker -f -n '__fish_docker_no_subcommand' -a exec -d 'Run a command in a running container'
complete -c docker -A -f -n '__fish_seen_subcommand_from exec' -s d -l detach -d 'Detached mode: run command in the background'
complete -c docker -A -f -n '__fish_seen_subcommand_from exec' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from exec' -s i -l interactive -d 'Keep STDIN open even if not attached'
complete -c docker -A -f -n '__fish_seen_subcommand_from exec' -s t -l tty -d 'Allocate a pseudo-TTY'
complete -c docker -A -f -n '__fish_seen_subcommand_from exec' -a '(__fish_print_docker_containers running)' -d "Container"

# export
complete -c docker -f -n '__fish_docker_no_subcommand' -a export -d 'Stream the contents of a container as a tar archive'
complete -c docker -A -f -n '__fish_seen_subcommand_from export' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from export' -s o -l output -d 'Write to a file, instead of STDOUT'
complete -c docker -A -f -n '__fish_seen_subcommand_from export' -a '(__fish_print_docker_containers all)' -d "Container"

# history
complete -c docker -f -n '__fish_docker_no_subcommand' -a history -d 'Show the history of an image'
complete -c docker -A -f -n '__fish_seen_subcommand_from history' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from history' -l no-trunc -d "Don't truncate output"
complete -c docker -A -f -n '__fish_seen_subcommand_from history' -s q -l quiet -d 'Only show numeric IDs'
complete -c docker -A -f -n '__fish_seen_subcommand_from history' -a '(__fish_print_docker_images)' -d "Image"

# images
complete -c docker -f -n '__fish_docker_no_subcommand' -a images -d 'List images'
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -s a -l all -d 'Show all images (default hides intermediate images)'
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -l digests -d 'Show digests'
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -s f -l filter -d 'Filter output based on conditions provided'
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -l no-trunc -d "Don't truncate output"
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -s q -l quiet -d 'Only show numeric IDs'
complete -c docker -A -f -n '__fish_seen_subcommand_from images' -a '(__fish_print_docker_repositories)' -d "Repository"

# import
complete -c docker -f -n '__fish_docker_no_subcommand' -a import -d 'Create a new filesystem image from the contents of a tarball'
complete -c docker -A -f -n '__fish_seen_subcommand_from import' -s c -l change -d 'Apply Dockerfile instruction to the created image'
complete -c docker -A -f -n '__fish_seen_subcommand_from import' -l help -d 'Print usage'

# info
complete -c docker -f -n '__fish_docker_no_subcommand' -a info -d 'Display system-wide information'

# inspect
complete -c docker -f -n '__fish_docker_no_subcommand' -a inspect -d 'Return low-level information on a container or image'
complete -c docker -A -f -n '__fish_seen_subcommand_from inspect' -s f -l format -d 'Format the output using the given go template'
complete -c docker -A -f -n '__fish_seen_subcommand_from inspect' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from inspect' -a '(__fish_print_docker_containers all)' -d "Container"
complete -c docker -A -f -n '__fish_seen_subcommand_from inspect' -a '(__fish_print_docker_images)' -d "Image"

# kill
complete -c docker -f -n '__fish_docker_no_subcommand' -a kill -d 'Kill a running container'
complete -c docker -A -f -n '__fish_seen_subcommand_from kill' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from kill' -s s -l signal -d 'Signal to send to the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from kill' -a '(__fish_print_docker_containers running)' -d "Container"

# load
complete -c docker -f -n '__fish_docker_no_subcommand' -a load -d 'Load an image from a tar archive'
complete -c docker -A -f -n '__fish_seen_subcommand_from load' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from load' -s i -l input -d 'Read from a tar archive file, instead of STDIN'

# login
complete -c docker -f -n '__fish_docker_no_subcommand' -a login -d 'Register or log in to a Docker registry server'
complete -c docker -A -f -n '__fish_seen_subcommand_from login' -s e -l email -d 'Email'
complete -c docker -A -f -n '__fish_seen_subcommand_from login' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from login' -s p -l password -d 'Password'
complete -c docker -A -f -n '__fish_seen_subcommand_from login' -s u -l username -d 'Username'

# logout
complete -c docker -f -n '__fish_docker_no_subcommand' -a logout -d 'Log out from a Docker registry server'

# logs
complete -c docker -f -n '__fish_docker_no_subcommand' -a logs -d 'Fetch the logs of a container'
complete -c docker -A -f -n '__fish_seen_subcommand_from logs' -s f -l follow -d 'Follow log output'
complete -c docker -A -f -n '__fish_seen_subcommand_from logs' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from logs' -s t -l timestamps -d 'Show timestamps'
complete -c docker -A -f -n '__fish_seen_subcommand_from logs' -l tail -d 'Number of lines to show from the end of the logs'
complete -c docker -A -f -n '__fish_seen_subcommand_from logs' -a '(__fish_print_docker_containers running)' -d "Container"

# port
complete -c docker -f -n '__fish_docker_no_subcommand' -a port -d 'Lookup the public-facing port that is NAT-ed to PRIVATE_PORT'
complete -c docker -A -f -n '__fish_seen_subcommand_from port' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from port' -a '(__fish_print_docker_containers running)' -d "Container"

# pause
complete -c docker -f -n '__fish_docker_no_subcommand' -a pause -d 'Pause all processes within a container'
complete -c docker -A -f -n '__fish_seen_subcommand_from pause' -a '(__fish_print_docker_containers running)' -d "Container"

# ps
complete -c docker -f -n '__fish_docker_no_subcommand' -a ps -d 'List containers'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -s a -l all -d 'Show all containers (default shows just running)'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -l before -d 'Show only container created before Id or Name'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -s f -l filter -d 'Filter output based on conditions provided'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -s l -l latest -d 'Show the latest created container, include non-running'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -s n -d 'Show n last created containers, include non-running'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -l no-trunc -d "Don't truncate output"
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -s q -l quiet -d 'Only display numeric IDs'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -s s -l size -d 'Display total file sizes'
complete -c docker -A -f -n '__fish_seen_subcommand_from ps' -l since -d 'Show created since Id or Name, include non-running'

# pull
complete -c docker -f -n '__fish_docker_no_subcommand' -a pull -d 'Pull an image or a repository from a Docker registry server'
complete -c docker -A -f -n '__fish_seen_subcommand_from pull' -s a -l all-tags -d 'Download all tagged images in the repository'
complete -c docker -A -f -n '__fish_seen_subcommand_from pull' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from pull' -a '(__fish_print_docker_images)' -d "Image"
complete -c docker -A -f -n '__fish_seen_subcommand_from pull' -a '(__fish_print_docker_repositories)' -d "Repository"

# push
complete -c docker -f -n '__fish_docker_no_subcommand' -a push -d 'Push an image or a repository to a Docker registry server'
complete -c docker -A -f -n '__fish_seen_subcommand_from push' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from push' -a '(__fish_print_docker_images)' -d "Image"
complete -c docker -A -f -n '__fish_seen_subcommand_from push' -a '(__fish_print_docker_repositories)' -d "Repository"

# rename
complete -c docker -f -n '__fish_docker_no_subcommand' -a rename -d 'Rename an existing container'

# restart
complete -c docker -f -n '__fish_docker_no_subcommand' -a restart -d 'Restart a running container'
complete -c docker -A -f -n '__fish_seen_subcommand_from restart' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from restart' -s t -l time -d 'Seconds to wait for stop before killing the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from restart' -a '(__fish_print_docker_containers running)' -d "Container"

# rm
complete -c docker -f -n '__fish_docker_no_subcommand' -a rm -d 'Remove one or more containers'
complete -c docker -A -f -n '__fish_seen_subcommand_from rm' -s f -l force -d 'Force the removal of a running container (uses SIGKILL)'
complete -c docker -A -f -n '__fish_seen_subcommand_from rm' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from rm' -s l -l link -d 'Remove the specified link'
complete -c docker -A -f -n '__fish_seen_subcommand_from rm' -s v -l volumes -d 'Remove the volumes associated with the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from rm' -a '(__fish_print_docker_containers stopped)' -d "Container"

# rmi
complete -c docker -f -n '__fish_docker_no_subcommand' -a rmi -d 'Remove one or more images'
complete -c docker -A -f -n '__fish_seen_subcommand_from rmi' -s f -l force -d 'Force removal of the image'
complete -c docker -A -f -n '__fish_seen_subcommand_from rmi' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from rmi' -l no-prune -d 'Do not delete untagged parents'
complete -c docker -A -f -n '__fish_seen_subcommand_from rmi' -a '(__fish_print_docker_images)' -d "Image"

# run
complete -c docker -f -n '__fish_docker_no_subcommand' -a run -d 'Run a command in a new container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s a -l attach -d 'Attach to STDIN, STDOUT or STDERR'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l add-host -d 'Add a custom host-to-IP mapping (host:ip)'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s c -l cpu-shares -d 'CPU shares (relative weight)'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l cap-add -d 'Add Linux capabilities'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l cap-drop -d 'Drop Linux capabilities'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l cgroup-parent -d 'Optional parent cgroup for the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l cidfile -d 'Write the container ID to the file'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l cpuset-cpus -d 'CPUs in which to allow execution (0-3, 0,1)'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s d -l detach -d 'Run container in background and print container ID'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l device -d 'Add a host device to the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l dns -d 'Set custom DNS servers'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l dns-search -d 'Set custom DNS search domains'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s e -l env -d 'Set environment variables'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l entrypoint -d 'Overwrite the default ENTRYPOINT of the image'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l env-file -d 'Read in a file of environment variables'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l expose -d 'Expose a port or a range of ports'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s h -l hostname -d 'Container host name'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s i -l interactive -d 'Keep STDIN open even if not attached'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l ipc -d 'IPC namespace to use'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s l -l label -d 'Set meta data on a container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l label-file -d 'Read in a line delimited file of labels'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l link -d 'Add link to another container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l log-driver -d 'Logging driver for container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l lxc-conf -d 'Add custom lxc options'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s m -l memory -d 'Memory limit'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l mac-address -d 'Container MAC address (e.g. 92:d0:c6:0a:29:33)'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l memory-swap -d "Total memory (memory + swap), '-1' to disable swap"
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l name -d 'Assign a name to the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l net -d 'Set the Network mode for the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s P -l publish-all -d 'Publish all exposed ports to random ports'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s p -l publish -d "Publish a container's port(s) to the host"
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l pid -d 'PID namespace to use'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l privileged -d 'Give extended privileges to this container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l read-only -d "Mount the container's root filesystem as read only"
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l restart -d 'Restart policy to apply when a container exits'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l rm -d 'Automatically remove the container when it exits'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l security-opt -d 'Security Options'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l sig-proxy -d 'Proxy received signals to the process'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s t -l tty -d 'Allocate a pseudo-TTY'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s u -l user -d 'Username or UID (format: <name|uid>[:<group|gid>])'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l ulimit -d 'Ulimit options'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s v -l volume -d 'Bind mount a volume'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -l volumes-from -d 'Mount volumes from the specified container(s)'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -s w -l workdir -d 'Working directory inside the container'
complete -c docker -A -f -n '__fish_seen_subcommand_from run' -a '(__fish_print_docker_images)' -d "Image"

# save
complete -c docker -f -n '__fish_docker_no_subcommand' -a save -d 'Save an image to a tar archive'
complete -c docker -A -f -n '__fish_seen_subcommand_from save' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from save' -s o -l output -d 'Write to an file, instead of STDOUT'
complete -c docker -A -f -n '__fish_seen_subcommand_from save' -a '(__fish_print_docker_images)' -d "Image"

# search
complete -c docker -f -n '__fish_docker_no_subcommand' -a search -d 'Search for an image on the Docker Hub'
complete -c docker -A -f -n '__fish_seen_subcommand_from search' -l automated -d 'Only show automated builds'
complete -c docker -A -f -n '__fish_seen_subcommand_from search' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from search' -l no-trunc -d "Don't truncate output"
complete -c docker -A -f -n '__fish_seen_subcommand_from search' -s s -l stars -d 'Only displays with at least x stars'

# start
complete -c docker -f -n '__fish_docker_no_subcommand' -a start -d 'Start a stopped container'
complete -c docker -A -f -n '__fish_seen_subcommand_from start' -s a -l attach -d 'Attach STDOUT/STDERR and forward signals'
complete -c docker -A -f -n '__fish_seen_subcommand_from start' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from start' -s i -l interactive -d "Attach container's STDIN"
complete -c docker -A -f -n '__fish_seen_subcommand_from start' -a '(__fish_print_docker_containers stopped)' -d "Container"

# stats
complete -c docker -f -n '__fish_docker_no_subcommand' -a stats -d "Display a stream of a containers' resource usage statistics"
complete -c docker -A -f -n '__fish_seen_subcommand_from stats' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from stats' -a '(__fish_print_docker_containers running)' -d "Container"

# stop
complete -c docker -f -n '__fish_docker_no_subcommand' -a stop -d 'Stop a running container'
complete -c docker -A -f -n '__fish_seen_subcommand_from stop' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from stop' -s t -l time -d 'Seconds to wait for stop before killing it'
complete -c docker -A -f -n '__fish_seen_subcommand_from stop' -a '(__fish_print_docker_containers running)' -d "Container"

# tag
complete -c docker -f -n '__fish_docker_no_subcommand' -a tag -d 'Tag an image into a repository'
complete -c docker -A -f -n '__fish_seen_subcommand_from tag' -s f -l force -d 'Force'
complete -c docker -A -f -n '__fish_seen_subcommand_from tag' -l help -d 'Print usage'

# top
complete -c docker -f -n '__fish_docker_no_subcommand' -a top -d 'Lookup the running processes of a container'
complete -c docker -A -f -n '__fish_seen_subcommand_from top' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from top' -a '(__fish_print_docker_containers running)' -d "Container"

# unpause
complete -c docker -f -n '__fish_docker_no_subcommand' -a unpause -d 'Unpause a paused container'
complete -c docker -A -f -n '__fish_seen_subcommand_from unpause' -a '(__fish_print_docker_containers running)' -d "Container"

# version
complete -c docker -f -n '__fish_docker_no_subcommand' -a version -d 'Show the Docker version information'

# wait
complete -c docker -f -n '__fish_docker_no_subcommand' -a wait -d 'Block until a container stops, then print its exit code'
complete -c docker -A -f -n '__fish_seen_subcommand_from wait' -l help -d 'Print usage'
complete -c docker -A -f -n '__fish_seen_subcommand_from wait' -a '(__fish_print_docker_containers running)' -d "Container"


