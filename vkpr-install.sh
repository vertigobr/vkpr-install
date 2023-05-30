#!/bin/sh

rit_identify_os () {
  if [ $(uname) = "Linux" ]; then
      echo "Installing Ritchie for Linux"
      OPERATIONAL_SYSTEM="Linux"
  elif [ $(uname) = "Darwin" ]; then
      echo "Installing Ritchie for Mac"
      OPERATIONAL_SYSTEM="Darwin"
  else
    echo "Unable to identify which OS you're using"
    exit 1
  fi
}

install_rit(){
  curl -SLO https://vkpr-rit.s3.amazonaws.com/2.11.3/${OPERATIONAL_SYSTEM}/rit
  chmod +x ./rit
  INSTALL_PATH="/usr/local/bin"
  if [ ! -d "$INSTALL_PATH" ]; then
    mkdir -p $INSTALL_PATH
  fi
  sudo mv ./rit $INSTALL_PATH/rit
}

echo "$(printf '\033[1m')$(printf '\033[32m')VKPR install script$(printf '\033[0m')"
echo "$(printf '\033[1m')===================$(printf '\033[0m')"
rit_identify_os
install_rit
rit add repo --provider="Github" --name="vkpr-cli" --repoUrl="https://github.com/vertigobr/vkpr-cli"
rit set formula-runner --runner="local"
# dev/null to fix OSX error
rit vkpr init < /dev/null
echo "--------"
echo "$(printf '\033[4m')$(printf '\033[1m')$(printf '\033[31m')Caution!$(printf '\033[0m')"
echo "--------"
echo "To use VKPR, you must have Docker installed."
echo "It is recommended to use aliases to make writing VKPR commands easier, like:"
echo ""
echo "$(printf '\033[32m')alias$(printf '\033[0m') vkpr=\"rit vkpr\""
echo ""

install_control () {
if [ $CONTROL_SKIP ]; then
    echo "EXECUÇÃO TESTE"
else
 curl --location 'https://api.platform.vee.codes/platform-metrics/v1/metrics' \
 --header 'X-Api-Key: Uxw459d7l8FsMP8U72rvAJ6JfEfkE5NURshHcHiiOBhqISpI3R09WCuA6spLXahg' \
 --header 'Content-Type: application/json' \
 --data '{
 "command":"install-vkpr"
    }'
fi
}
install_control
