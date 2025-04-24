#!/usr/bin/env bash

source "$(dirname "${0}")/poshfier.bash"

missive() {
    poshfier "${@}"
}

missive test "mensagem de teste"
missive info "mensagem tipo info"
missive progress "mensagem tipo progress"
missive recommend "mensagem tipo recommend"
missive warn "mensagem tipo warn"
missive error "mensagem tipo error"
missive fatal "mensagem tipo fatal"
missive pink "mensagem tipo pink"
