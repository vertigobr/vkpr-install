#!/bin/sh
echo "$(printf '\033[1m')$(printf '\033[32m')VKPR install script$(printf '\033[0m')"
echo "$(printf '\033[1m')===================$(printf '\033[0m')"
if [ $(id -u) -eq 0 ]; then
  curl -fsSL https://commons-repo.ritchiecli.io/install.sh | sed -e 's/sudo//g' | bash
else
  curl -fsSL https://commons-repo.ritchiecli.io/install.sh | bash
fi
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
