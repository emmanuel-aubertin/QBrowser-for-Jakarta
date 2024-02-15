#!/bin/bash

#*******************************************************************************************#
#*----- Auteur :        Aubertin Emmanuel               | For: QBrowser-reloaded        ****#
#*----- Description :   Compiler for Java in src/                                       ****#
#*******************************************************************************************#

PROGNAME=$(basename $0)
RELEASE="Revision 1.0"
AUTHOR="(c) 2024 Aubertin Emmanuel"
DEBUG=0


print_release() {
    echo "$RELEASE $AUTHOR"
}

print_usage() {
        echo ""
        echo "$PROGNAME"
        echo ""
        echo "Usage: $PROGNAME | [-h | --help] | [-v | --version] | [-d | --debug]"
        echo ""
        echo "          -h  --help            Aide"
        echo "          -v  --version         Version"
        echo ""
}

print_help() {
        print_release $PROGNAME $RELEASE
        echo ""
        print_usage
        echo ""
        echo ""
                exit 0
}

# Detect operating system
OS=$(uname -s)

colored_echo() {
    local color_code="$1"
    local text="$2"
    case "$OS" in
        Darwin)
            # macOS uses \033 instead of \e for color codes
            echo -e "\033[${color_code}${text}\033[0m"
            ;;
        *)
            # Linux and other systems
            echo -e "\e[${color_code}${text}\e[0m"
            ;;
    esac
}

while [ $# -gt 0 ]; do
    if [[ $skip == 1 ]]; then
      skip=0
      continue
    fi
    case "$1" in
        -h | --help)
            print_help
            exit
            ;;
        -v | --version)
            print_release
            exit
            ;;
        *)  echo "Argument inconnu: $1"
            print_usage
            ;;
        esac
shift
done




function ask_yes_or_no() {
    echo -n "[yes/no] : "
    read -r YESNO
    if [[ $YESNO =~ [yY] ]]; then
        return 0
    fi
    return 1
}

colored_echo "32m--------|" "Compile Java source |--------"
if find src/ -name "*.java" -print | xargs javac -d bin; then
    colored_echo "32m" "Compiled src/ successfully"
else
    colored_echo "1;31m" "Error during compilation of src/. Please check the errors above."
    exit 1
fi

