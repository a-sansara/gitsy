_gitsy() 
{
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    #
    #  The basic options we'll complete.
    #
    if [ ! "$GITSY_INSTALLED" = "true" ]; then
        opts="list spush add remove version install"
    else
        opts="list spush add remove version uninstall"
    fi


    #
    #  Complete the arguments to some of the basic commands.
    #
    case "${prev}" in
        add|remove)
            local running=$(cat .gitsy)
            COMPREPLY=( $(compgen -W "${running}" -- ${cur}) )
            return 0
            ;;
        spush)
            local names=$(git remote -v | grep -v ^upsync-[^\(]*\(push\)$ |  grep -v ^upsync-[^\(]*\(fetch\)$ | cut -f 1)
            COMPREPLY=( $(compgen -W "${names}" -- ${cur}) )
            return 0
            ;;
        origin)
            local running="master"
            COMPREPLY=( $(compgen -W "${running}" -- ${cur}) )
            return 0
            ;;
        *)
        ;;
    esac

   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))  
   return 0
}
complete -F _gitsy gitsy
