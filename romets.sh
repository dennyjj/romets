build() {
    if [[ -z $DIRECTORY || -z $NAME ]]; then
        echo "Both directory and name are required."
        exit 1
    fi

    cd $DIRECTORY
    mkdir -p $NAME
    cd $NAME
    npm init -y
    npm install --save-dev typescript ts-node @types/node
    npx tsc --init
    mkdir -p src
    echo "console.log('TypeScript App is Created ✅');" >src/index.ts
    npx ts-node src/index.ts
}

show_help() {
    echo "romets [-n <NAME> -d <DIRECTORY> -h <HELP>]"
    echo
    echo "Arguments:"
    echo
    echo "NAME, the project name"
    echo "DIRECTORY, the path of the project"
    echo "HELP, show help"
    exit 1
}

while getopts 'n:d:h' OPT; do
    case $OPT in
    n) NAME="$OPTARG" ;;
    d) DIRECTORY="$OPTARG" ;;
    h) show_help ;;
    *)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    esac
done

if [[ -z $NAME || -z $DIRECTORY ]]; then
    show_help
else
    build
fi
