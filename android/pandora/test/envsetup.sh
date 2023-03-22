function avatar {
  # avatar script.
  _AVATAR="${ANDROID_BUILD_TOP}/packages/modules/Bluetooth/android/pandora/test/avatar.sh"

  if ! command -v python3 &> /dev/null; then
    echo "python3: command not found" 1>&2
    echo "  on linux: 'sudo apt install python3 python3-pip'" 1>&2
    return 1
  fi
  if ! command -v pip &> /dev/null; then
    echo "pip: command not found" 1>&2
    echo "  on linux: 'sudo apt install python3 python3-pip'" 1>&2
    return 1
  fi

  # only compile when needed.
  if [[ "$1" == "run" ]]; then
    m avatar avatar.sh PandoraServer tradefed || return 1
    _AVATAR="avatar.sh"
  fi

  # run avatar script.
  "${_AVATAR}" "$@"
}
