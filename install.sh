#!/bin/bash
#
# For FreeBSD systems, you'll need to manually invoke bash to run
# this script since /bin/bash isn't a valid shell.
# /usr/local/bin/bash ./install.sh

SRC="$(pwd)"
DEST=$HOME

cp_cmd="/bin/cp"
rm_cmd="/bin/rm"
install-homedir() {
  echo "setting up info/doc directories..."
  $cp_cmd -a ${SRC}/how-to/ ${DEST}/how-to
  
  echo "setting up bin directories..."
  $cp_cmd -a ${SRC}/bin/ ${DEST}/bin
  $cp_cmd -a ${SRC}/bin-freebsd ${DEST}/bin-freebsd
  $cp_cmd -a ${SRC}/bin-darwin ${DEST}/bin-darwin

  echo "setting up dev tools..."
  $cp_cmd -a ${SRC}/git/gitconfig ${DEST}/.gitconfig
  $cp_cmd -a ${SRC}/tmux.conf ${DEST}/.tmux.conf
  $cp_cmd -a ${SRC}/ctags ${DEST}/.ctags
 
  echo "DONE with install tasks."
}

tmux_plugins() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}  

uninstall-homedir() {
  echo "Uninstalling homedir stuff from ${DEST}..."
  $rm_cmd -rf ${DEST}/bin
  $rm_cmd -rf ${DEST}/bin-freebsd
  $rm_cmd -rf ${DEST}/bin-darwin
  $rm_cmd -rf ${DEST}/how-to
  $rm_cmd -rf ${DEST}/.gitconfig
  $rm_cmd -rf ${DEST}/.tmux.conf
  $rm_cmd -rf ${DEST}/.ctags
}

uninstall-homedir
install-homedir
