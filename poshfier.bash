#!/usr/bin/env bash
#######################################
# Making color easier
# Arguments:
#   color[Int], message_string[string]
# Outputs:
#######################################
colourist() {
    local -i cor
    local texto
    cor="${1}"
    texto="${2}"
    tput setaf "${cor}"
    printf "%b\n" "${texto}"
    tput sgr0
}
#######################################
# Prints coloured messages for specific purposes
# Arguments:
#   message_type, message_string
# Outputs: "formatted"/colourist message
#   Colored string message based on message_type input
# this was inspired by Wimpy's World (Martin Wimpress) deb-get fancy_message function
#######################################
poshfier() {
    # https://robotmoon.com/256-colors/
    # https://www.color-hex.com/color-names.html

    [ -z "${1}" ] || [ -z "${2}" ] && return

    local count_colours
    local message_type
    local message_string
    local -i red
    local -i blue
    local -i green
    local -i white
    local -i grey
    local -i lightblue
    local -i purple
    local -i scarlet
    local -i orange
    local -i cyan
    local -i pink
    local -i lightgrey
    local -a message_types
    count_colours="$(tput colors)"
    message_type="${1}"
    shift
    message_string="${1}"
    # if more are going to be used, add them here. like green, pink etc.
    message_types=(
        "error"
        "fatal"
        "info"
        "bullets"
        "progress"
        "recommend"
        "warn"
    )

    if [[ -z "${message_string}" ]]; then
        printf "Please type a message"
    fi

    if [[ ! "${message_types[*]}" =~ ${message_type} ]]; then
        printf "Unknow message type \'%s\'!\nMessage types available: \n\t%s\n" "${message_type}" "${message_types[*]}"
    fi

    if [[ "${count_colours}" == 256 ]]; then
        red="124"
        blue="21"
        green="46"
        white="255"
        grey="241"
        lightblue="39"
        purple="99"
        scarlet="160"
        yellow="226"
        orange="208"
        cyan="44"
        pink="9"
        lightgrey="244"
    else
        red="1"
        blue="4"
        green="2"
        white="15"
        grey="7"
        lightblue="12"
        purple="5"
        scarlet="9"
        yellow="11"
        orange="${yellow}"
        cyan="14"
        pink="13"
        lightgrey="8"
    fi

    case ${message_type} in
    error) colourist "${red}" "[e] ${message_string}" | tee >&2 ;;
    fatal) colourist "${scarlet}" "[f] ${message_string}" | tee >&2 ;;
    info) colourist "${lightblue}" "[i] ${message_string}" ;;
    bullets) colourist "${cyan}" "    -> ${message_string}" ;;
    progress) colourist "${white}" "[p] ${message_string}" ;;
    recommend) colourist "${cyan}" "[r] ${message_string}" ;;
    warn) colourist "${orange}" "[w] ${message_string}" ;;
    purple) colourist "${purple}" "${message_string}" ;;
    grey) colourist "${grey}" "${message_string}" ;;
    green) colourist "${green}" "${message_string}" ;;
    blue) colourist "${blue}" "${message_string}" ;;
    white) colourist "${white}" "${message_string}" ;;
    yellow) colourist "${yellow}" "${message_string}" ;;
    lightblue) colourist "${lightblue}" "${message_string}" ;;
    cyan) colourist "${cyan}" "${message_string}" ;;
    pink) colourist "${pink}" "${message_string}" ;;
    lightgrey) colourist "${lightgrey}" "${message_string}" ;;
    *) printf "  - ? - %s - ? -\n" "${message_type}" ;;
    esac
}
# poshfier "${@}"
